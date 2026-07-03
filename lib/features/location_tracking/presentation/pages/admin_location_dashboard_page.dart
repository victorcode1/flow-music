import 'dart:async';
import 'dart:math' as math;

import 'package:flow_music/features/home/data/location_service.dart';
import 'package:flow_music/features/home/presentation/providers/text_search.dart';
import 'package:flow_music/features/location_tracking/data/user_location_providers.dart';
import 'package:flow_music/features/location_tracking/data/user_location_record.dart';
import 'package:flow_music/features/location_tracking/data/user_location_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geocoding/geocoding.dart' as geocoding;
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:latlong2/latlong.dart';
import 'package:share_plus/share_plus.dart';

class AdminLocationDashboardPage extends ConsumerStatefulWidget {
  const AdminLocationDashboardPage({super.key});

  @override
  ConsumerState<AdminLocationDashboardPage> createState() =>
      _AdminLocationDashboardPageState();
}

class _AdminLocationDashboardPageState
    extends ConsumerState<AdminLocationDashboardPage> {
  static const _initialCenter = LatLng(8.9833, -79.5167);
  static const _initialZoom = 6.0;
  static const _currentLocationZoom = 14.0;

  final LocationService _locationService = const LocationService();
  final MapController _mapController = MapController();
  final Map<String, Future<String?>> _countryCache = {};
  late final TextEditingController _searchController;
  LatLng? _selectedLocationPoint;
  String? _selectedLocationLabel;
  UserLocationRecord? _selectedLocationUser;
  bool _didMoveToCurrentLocation = false;
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _searchController = ref.read(searchProvider);
    _searchQuery = _searchController.text;
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _mapController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    if (!mounted) return;
    setState(() => _searchQuery = _searchController.text);
  }

  Future<void> _moveToCurrentLocation() async {
    final location = await _locationService.resolveLocation(
      timeLimit: const Duration(seconds: 8),
    );
    if (!mounted || !location.isResolved) return;

    _mapController.move(
      LatLng(location.latitude!, location.longitude!),
      _currentLocationZoom,
    );
  }

  void _onMapReady() {
    if (_didMoveToCurrentLocation) return;
    _didMoveToCurrentLocation = true;
    unawaited(_moveToCurrentLocation());
  }

  void _focusUser(UserLocationRecord user) {
    FocusManager.instance.primaryFocus?.unfocus();
    _focusLocation(
      latitude: user.latitude,
      longitude: user.longitude,
      label: user.title,
      user: user,
    );
  }

  void _focusLocation({
    required double latitude,
    required double longitude,
    String? label,
    UserLocationRecord? user,
  }) {
    final point = LatLng(latitude, longitude);
    setState(() {
      _selectedLocationPoint = point;
      _selectedLocationLabel = label;
      _selectedLocationUser = user;
    });
    _mapController.move(point, 15);
  }

  void _selectUserLocation(UserLocationRecord user) {
    _searchController.clear();
    _focusUser(user);
  }

  void _showUserActions(UserLocationRecord user) {
    showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      isScrollControlled: true,
      builder: (context) =>
          _UserLocationActionSheet(user: user, onShowLocation: _focusLocation),
    );
  }

  void _showAllUsersSheet({
    _UsersSheetMode initialMode = _UsersSheetMode.registered,
  }) {
    showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      isScrollControlled: true,
      builder: (sheetContext) => _UsersRealtimeSheet(
        initialMode: initialMode,
        onUserTap: (user) {
          Navigator.of(sheetContext).pop();
          _selectUserLocation(user);
        },
        onUserLongPress: (user) {
          Navigator.of(sheetContext).pop();
          _showUserActions(user);
        },
        countryForUser: _countryForUser,
      ),
    );
  }

  List<Marker> _buildMarkers(List<UserLocationRecord> users) {
    return users
        .map((user) {
          return Marker(
            point: LatLng(user.latitude, user.longitude),
            width: 160,
            height: 88,
            alignment: Alignment.topCenter,
            child: _UserLocationMarker(
              user: user,
              onTap: () => _selectUserLocation(user),
              onLongPress: () => _showUserActions(user),
            ),
          );
        })
        .toList(growable: false);
  }

  Marker? _buildSelectedLocationMarker() {
    final point = _selectedLocationPoint;
    if (point == null) return null;

    return Marker(
      point: point,
      width: 170,
      height: 86,
      alignment: Alignment.topCenter,
      child: _SelectedLocationMarker(
        label: _selectedLocationLabel,
        onLongPress: _selectedLocationUser == null
            ? null
            : () => _showUserActions(_selectedLocationUser!),
      ),
    );
  }

  List<UserLocationRecord> _filterUsers(List<UserLocationRecord> users) {
    final query = _normalizeQuery(_searchQuery);
    if (query.isEmpty) return users;

    return users
        .where((user) {
          final haystack = _normalizeQuery(
            [
              user.title,
              user.subtitle,
              user.email,
              user.displayName,
              user.uid,
              user.appState,
              user.platform,
              user.deviceLocale,
              user.appVersion,
              user.isAnonymous ? 'anonimo invitado anonymous guest' : null,
              user.campaignSegments.join(' '),
            ].whereType<String>().join(' '),
          );
          return haystack.contains(query);
        })
        .toList(growable: false);
  }

  Future<String?> _countryForUser(UserLocationRecord user) {
    final cacheKey =
        '${user.uid}:${user.latitude.toStringAsFixed(4)},${user.longitude.toStringAsFixed(4)}';
    return _countryCache.putIfAbsent(cacheKey, () async {
      try {
        final placemarks = await geocoding.placemarkFromCoordinates(
          user.latitude,
          user.longitude,
        );
        if (placemarks.isEmpty) return null;
        final country = placemarks.first.country?.trim();
        return country == null || country.isEmpty ? null : country;
      } catch (_) {
        return null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final usersAsync = ref.watch(usersWithLocationsProvider);
    final anonymousUsersAsync = ref.watch(anonymousUsersProvider);
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final isDark = theme.brightness == Brightness.dark;
    final tileUrl = isDark
        ? 'https://{s}.basemaps.cartocdn.com/dark_all/{z}/{x}/{y}.png'
        : 'https://{s}.basemaps.cartocdn.com/light_all/{z}/{x}/{y}.png';
    final allUsers = usersAsync.asData?.value;
    final filteredUsers = allUsers == null
        ? const <UserLocationRecord>[]
        : _filterUsers(allUsers);
    final anonymousCount = anonymousUsersAsync.maybeWhen(
      data: (users) => users.length,
      orElse: () => allUsers?.where((user) => user.isAnonymous).length ?? 0,
    );

    return Scaffold(
      backgroundColor: colors.surface,
      body: Stack(
        children: [
          usersAsync.when(
            data: (users) {
              final filteredUsers = _filterUsers(users);
              final selectedLocationMarker = _buildSelectedLocationMarker();
              return FlutterMap(
                mapController: _mapController,
                options: MapOptions(
                  initialCenter: _initialCenter,
                  initialZoom: _initialZoom,
                  minZoom: 2,
                  maxZoom: 18,
                  backgroundColor: colors.surfaceContainerHighest,
                  interactionOptions: const InteractionOptions(
                    flags: InteractiveFlag.all & ~InteractiveFlag.rotate,
                  ),
                  onMapReady: _onMapReady,
                ),
                children: [
                  TileLayer(
                    urlTemplate: tileUrl,
                    subdomains: const ['a', 'b', 'c', 'd'],
                    userAgentPackageName: 'com.flowmusic.app',
                  ),
                  MarkerLayer(
                    markers: [
                      ..._buildMarkers(filteredUsers),
                      ?selectedLocationMarker,
                    ],
                  ),
                ],
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, _) => Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Text(
                  'No se pudieron cargar las ubicaciones.\n$error',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: _DashboardHeader(
                totalCount: allUsers?.length ?? 0,
                visibleCount: filteredUsers.length,
                anonymousCount: anonymousCount,
                query: _searchQuery,
                users: filteredUsers,
                onUserTap: _selectUserLocation,
                onUserLongPress: _showUserActions,
                onDashboardTap: _showAllUsersSheet,
                onAnonymousTap: () =>
                    _showAllUsersSheet(initialMode: _UsersSheetMode.anonymous),
                countryForUser: _countryForUser,
              ),
            ),
          ),
          Positioned(
            right: 16,
            bottom: 16 + MediaQuery.paddingOf(context).bottom,
            child: FloatingActionButton.small(
              heroTag: 'location-dashboard-center',
              onPressed: () {
                _didMoveToCurrentLocation = true;
                unawaited(_moveToCurrentLocation());
              },
              child: const Icon(Icons.my_location_rounded),
            ),
          ),
        ],
      ),
    );
  }
}

class _DashboardHeader extends StatelessWidget {
  const _DashboardHeader({
    required this.totalCount,
    required this.visibleCount,
    required this.anonymousCount,
    required this.query,
    required this.users,
    required this.onUserTap,
    required this.onUserLongPress,
    required this.onDashboardTap,
    required this.onAnonymousTap,
    required this.countryForUser,
  });

  final int totalCount;
  final int visibleCount;
  final int anonymousCount;
  final String query;
  final List<UserLocationRecord> users;
  final ValueChanged<UserLocationRecord> onUserTap;
  final ValueChanged<UserLocationRecord> onUserLongPress;
  final VoidCallback onDashboardTap;
  final VoidCallback onAnonymousTap;
  final Future<String?> Function(UserLocationRecord user) countryForUser;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final isFiltering = query.trim().isNotEmpty;
    final countText = isFiltering
        ? '$visibleCount de $totalCount usuarios encontrados'
        : '$totalCount usuarios con ubicacion registrada';
    final onlineCount = users.where((user) => user.isEffectivelyOnline).length;

    return Align(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 520),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Material(
              color: colors.surface.withValues(alpha: 0.92),
              elevation: 6,
              shadowColor: colors.shadow.withValues(alpha: 0.18),
              borderRadius: BorderRadius.circular(18),
              clipBehavior: Clip.antiAlias,
              child: InkWell(
                onTap: onDashboardTap,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 42,
                        height: 42,
                        decoration: BoxDecoration(
                          color: colors.primaryContainer,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          Icons.admin_panel_settings_rounded,
                          color: colors.onPrimaryContainer,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Dashboard de ubicaciones',
                              style: theme.textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            Text(countText, style: theme.textTheme.bodySmall),
                            const SizedBox(height: 6),
                            Wrap(
                              spacing: 6,
                              runSpacing: 4,
                              children: [
                                _InfoPill(
                                  icon: Icons.sensors_rounded,
                                  label: _onlineDevicesLabel(onlineCount),
                                  color: onlineCount > 0
                                      ? colors.primary
                                      : colors.onSurfaceVariant,
                                ),
                                _InfoPill(
                                  icon: Icons.person_outline_rounded,
                                  label: _anonymousUsersLabel(anonymousCount),
                                  color: anonymousCount > 0
                                      ? colors.tertiary
                                      : colors.onSurfaceVariant,
                                  onTap: onAnonymousTap,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            if (isFiltering) ...[
              const SizedBox(height: 10),
              _UserSearchResults(
                users: users,
                onUserTap: onUserTap,
                onUserLongPress: onUserLongPress,
                countryForUser: countryForUser,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

String _onlineDevicesLabel(int count) {
  final noun = count == 1 ? 'dispositivo' : 'dispositivos';
  return '$count $noun en linea';
}

String _anonymousUsersLabel(int count) {
  final noun = count == 1 ? 'invitado' : 'invitados';
  return '$count $noun';
}

class _UserSearchResults extends StatelessWidget {
  const _UserSearchResults({
    required this.users,
    required this.onUserTap,
    required this.onUserLongPress,
    required this.countryForUser,
  });

  final List<UserLocationRecord> users;
  final ValueChanged<UserLocationRecord> onUserTap;
  final ValueChanged<UserLocationRecord> onUserLongPress;
  final Future<String?> Function(UserLocationRecord user) countryForUser;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Material(
      color: colors.surface.withValues(alpha: 0.94),
      elevation: 8,
      shadowColor: colors.shadow.withValues(alpha: 0.22),
      borderRadius: BorderRadius.circular(18),
      clipBehavior: Clip.antiAlias,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxHeight: 360),
        child: users.isEmpty
            ? Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Icon(Icons.person_search_rounded, color: colors.primary),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'No hay usuarios para ese filtro.',
                        style: theme.textTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
              )
            : ListView.separated(
                padding: const EdgeInsets.symmetric(vertical: 6),
                shrinkWrap: true,
                itemCount: math.min(users.length, 6),
                separatorBuilder: (context, index) => Divider(
                  height: 1,
                  indent: 72,
                  endIndent: 14,
                  color: colors.outlineVariant.withValues(alpha: 0.7),
                ),
                itemBuilder: (context, index) {
                  final user = users[index];
                  return _UserLocationListTile(
                    user: user,
                    onTap: () => onUserTap(user),
                    onLongPress: () => onUserLongPress(user),
                    countryForUser: countryForUser,
                  );
                },
              ),
      ),
    );
  }
}

enum _UsersSheetMode { registered, anonymous }

class _UsersRealtimeSheet extends ConsumerStatefulWidget {
  const _UsersRealtimeSheet({
    required this.initialMode,
    required this.onUserTap,
    required this.onUserLongPress,
    required this.countryForUser,
  });

  final _UsersSheetMode initialMode;
  final ValueChanged<UserLocationRecord> onUserTap;
  final ValueChanged<UserLocationRecord> onUserLongPress;
  final Future<String?> Function(UserLocationRecord user) countryForUser;

  @override
  ConsumerState<_UsersRealtimeSheet> createState() =>
      _UsersRealtimeSheetState();
}

class _UsersRealtimeSheetState extends ConsumerState<_UsersRealtimeSheet> {
  late _UsersSheetMode _mode;

  @override
  void initState() {
    super.initState();
    _mode = widget.initialMode;
  }

  @override
  Widget build(BuildContext context) {
    final usersAsync = ref.watch(usersWithLocationsProvider);
    final anonymousUsersAsync = ref.watch(anonymousUsersProvider);
    final globalIntervalAsync = ref.watch(globalLocationUpdateIntervalProvider);
    final cleanupScheduleAsync = ref.watch(
      locationHistoryCleanupScheduleProvider,
    );
    final anonymousCleanupAsync = ref.watch(anonymousUserCleanupConfigProvider);
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final registeredUsers = usersAsync.maybeWhen(
      data: (users) => users,
      orElse: () => const <UserLocationRecord>[],
    );
    final globalInterval = globalIntervalAsync.maybeWhen(
      data: (interval) => interval,
      orElse: () => registeredUsers.isEmpty
          ? defaultLocationUpdateInterval
          : registeredUsers.first.updateInterval,
    );
    final anonymousUsers = anonymousUsersAsync.maybeWhen(
      data: (users) => users,
      orElse: () => const <UserProfileRecord>[],
    );
    final showingAnonymous = _mode == _UsersSheetMode.anonymous;
    final isLoading = showingAnonymous
        ? anonymousUsersAsync.isLoading && anonymousUsers.isEmpty
        : usersAsync.isLoading && registeredUsers.isEmpty;
    final error = showingAnonymous
        ? anonymousUsersAsync.maybeWhen(
            error: (error, _) => error,
            orElse: () => null,
          )
        : usersAsync.maybeWhen(error: (error, _) => error, orElse: () => null);

    return SafeArea(
      top: false,
      child: DraggableScrollableSheet(
        expand: false,
        initialChildSize: 0.72,
        minChildSize: 0.35,
        maxChildSize: 0.92,
        builder: (context, scrollController) {
          final cleanupSchedule = cleanupScheduleAsync.maybeWhen(
            data: (schedule) => schedule,
            orElse: () => defaultLocationHistoryCleanupSchedule,
          );
          final anonymousCleanup = anonymousCleanupAsync.maybeWhen(
            data: (config) => config,
            orElse: () => defaultAnonymousUserCleanupConfig,
          );
          return CustomScrollView(
            controller: scrollController,
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        showingAnonymous
                            ? 'Usuarios anonimos'
                            : 'Usuarios con ubicacion',
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Text(
                        showingAnonymous
                            ? '${anonymousUsers.length} invitados'
                            : '${registeredUsers.length} usuarios registrados',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: colors.onSurfaceVariant,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          _SheetModeButton(
                            selected: !showingAnonymous,
                            icon: Icons.location_on_outlined,
                            label: '${registeredUsers.length} registrados',
                            onPressed: () => setState(
                              () => _mode = _UsersSheetMode.registered,
                            ),
                          ),
                          _SheetModeButton(
                            selected: showingAnonymous,
                            icon: Icons.person_outline_rounded,
                            label: _anonymousUsersLabel(anonymousUsers.length),
                            color: colors.tertiary,
                            onPressed: () => setState(
                              () => _mode = _UsersSheetMode.anonymous,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          FilledButton.tonalIcon(
                            onPressed: globalIntervalAsync.isLoading
                                ? null
                                : () => _pickGlobalInterval(
                                    context,
                                    ref,
                                    globalInterval,
                                  ),
                            icon: const Icon(Icons.public_rounded),
                            label: Text(
                              'Frecuencia ${_formatDuration(globalInterval)}',
                            ),
                          ),
                          FilledButton.tonalIcon(
                            onPressed: cleanupScheduleAsync.isLoading
                                ? null
                                : () => _showCleanupScheduleSheet(
                                    context,
                                    ref,
                                    cleanupSchedule,
                                  ),
                            icon: Icon(
                              cleanupSchedule.enabled
                                  ? Icons.event_repeat_rounded
                                  : Icons.event_busy_rounded,
                            ),
                            label: Text(
                              _formatCleanupSchedule(cleanupSchedule),
                            ),
                          ),
                          FilledButton.tonalIcon(
                            onPressed: anonymousCleanupAsync.isLoading
                                ? null
                                : () => _toggleAnonymousCleanup(
                                    context,
                                    ref,
                                    anonymousCleanup,
                                  ),
                            icon: Icon(
                              anonymousCleanup.enabled
                                  ? Icons.person_remove_rounded
                                  : Icons.person_off_rounded,
                            ),
                            label: Text(
                              _formatAnonymousCleanup(anonymousCleanup),
                            ),
                          ),
                          OutlinedButton.icon(
                            onPressed: () =>
                                _confirmDeleteAllUsersHistory(context, ref),
                            icon: const Icon(Icons.delete_sweep_rounded),
                            label: const Text('Borrar historiales'),
                            style: OutlinedButton.styleFrom(
                              foregroundColor: colors.error,
                              side: BorderSide(
                                color: colors.error.withValues(alpha: 0.5),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              if (isLoading)
                const SliverFillRemaining(
                  hasScrollBody: false,
                  child: Center(child: CircularProgressIndicator()),
                )
              else if (error != null)
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text(
                        'No se pudieron cargar los usuarios.\n$error',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                )
              else if (showingAnonymous)
                _AnonymousUsersSliverList(
                  users: anonymousUsers,
                  onUserTap: (user) => _handleAnonymousUserTap(context, user),
                  onUserLongPress: (user) =>
                      _handleAnonymousUserEdit(context, user),
                  countryForUser: widget.countryForUser,
                )
              else
                _RegisteredUsersSliverList(
                  users: registeredUsers,
                  onUserTap: widget.onUserTap,
                  onUserLongPress: widget.onUserLongPress,
                  countryForUser: widget.countryForUser,
                ),
            ],
          );
        },
      ),
    );
  }

  void _handleAnonymousUserTap(BuildContext context, UserProfileRecord user) {
    final locationUser = user.locationRecord;
    if (locationUser != null) {
      widget.onUserLongPress(locationUser);
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${user.title} aun no tiene ubicacion registrada.'),
      ),
    );
  }

  void _handleAnonymousUserEdit(BuildContext context, UserProfileRecord user) {
    final locationUser = user.locationRecord;
    if (locationUser != null) {
      widget.onUserLongPress(locationUser);
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${user.title} aun no tiene ubicacion para editar.'),
      ),
    );
  }

  Future<void> _confirmDeleteAllUsersHistory(
    BuildContext context,
    WidgetRef ref,
  ) async {
    final confirmed = await _confirmGlobalHistoryDelete(context);
    if (!confirmed || !context.mounted) return;

    final messenger = ScaffoldMessenger.of(context);
    try {
      final deletedCount = await ref
          .read(userLocationRepositoryProvider)
          .deleteAllUsersLocationHistory();
      if (!context.mounted) return;
      messenger.showSnackBar(
        SnackBar(
          content: Text(
            '$deletedCount ubicaciones eliminadas de todos los usuarios.',
          ),
        ),
      );
    } catch (error) {
      if (!context.mounted) return;
      messenger.showSnackBar(
        SnackBar(content: Text('No se pudo borrar el historial: $error')),
      );
    }
  }

  Future<void> _pickGlobalInterval(
    BuildContext context,
    WidgetRef ref,
    Duration initialInterval,
  ) async {
    final selected = await showModalBottomSheet<Duration>(
      context: context,
      showDragHandle: true,
      isScrollControlled: true,
      builder: (context) =>
          _LocationIntervalPickerSheet(initialInterval: initialInterval),
    );
    if (selected == null || !context.mounted) return;

    final messenger = ScaffoldMessenger.of(context);
    try {
      final updatedCount = await ref
          .read(userLocationRepositoryProvider)
          .updateGlobalLocationUpdateInterval(selected);
      if (!context.mounted) return;
      messenger.showSnackBar(
        SnackBar(
          content: Text(
            'Frecuencia global actualizada a ${_formatDuration(selected)} '
            'para $updatedCount usuarios.',
          ),
        ),
      );
    } catch (error) {
      if (!context.mounted) return;
      messenger.showSnackBar(
        SnackBar(content: Text('No se pudo guardar la frecuencia: $error')),
      );
    }
  }

  Future<bool> _confirmGlobalHistoryDelete(BuildContext context) async {
    return await showDialog<bool>(
          context: context,
          builder: (dialogContext) {
            final colors = Theme.of(dialogContext).colorScheme;
            return AlertDialog(
              title: const Text('Borrar historiales'),
              content: const Text(
                'Se eliminara el historial de ubicaciones de todos los '
                'usuarios. La ultima ubicacion de cada usuario se mantiene.',
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(dialogContext).pop(false),
                  child: const Text('Cancelar'),
                ),
                FilledButton(
                  style: FilledButton.styleFrom(
                    backgroundColor: colors.error,
                    foregroundColor: colors.onError,
                  ),
                  onPressed: () => Navigator.of(dialogContext).pop(true),
                  child: const Text('Borrar todo'),
                ),
              ],
            );
          },
        ) ??
        false;
  }

  Future<void> _showCleanupScheduleSheet(
    BuildContext context,
    WidgetRef ref,
    LocationHistoryCleanupSchedule schedule,
  ) async {
    final selected = await showModalBottomSheet<LocationHistoryCleanupSchedule>(
      context: context,
      showDragHandle: true,
      isScrollControlled: true,
      builder: (context) =>
          _LocationHistoryCleanupScheduleSheet(initialSchedule: schedule),
    );
    if (selected == null || !context.mounted) return;

    final messenger = ScaffoldMessenger.of(context);
    try {
      await ref
          .read(userLocationRepositoryProvider)
          .updateLocationHistoryCleanupSchedule(selected);
      if (!context.mounted) return;
      messenger.showSnackBar(
        SnackBar(
          content: Text(
            selected.enabled
                ? 'Limpieza automatica configurada para '
                      '${_formatScheduleTime(selected)}.'
                : 'Limpieza automatica apagada.',
          ),
        ),
      );
    } catch (error) {
      if (!context.mounted) return;
      messenger.showSnackBar(
        SnackBar(content: Text('No se pudo guardar la configuracion: $error')),
      );
    }
  }

  Future<void> _toggleAnonymousCleanup(
    BuildContext context,
    WidgetRef ref,
    AnonymousUserCleanupConfig config,
  ) async {
    final enabled = !config.enabled;
    final messenger = ScaffoldMessenger.of(context);
    try {
      await ref
          .read(userLocationRepositoryProvider)
          .updateAnonymousUserCleanupEnabled(enabled);
      if (!context.mounted) return;
      messenger.showSnackBar(
        SnackBar(
          content: Text(
            enabled
                ? 'Limpieza semanal de invitados activada.'
                : 'Limpieza semanal de invitados apagada.',
          ),
        ),
      );
    } catch (error) {
      if (!context.mounted) return;
      messenger.showSnackBar(
        SnackBar(content: Text('No se pudo guardar la configuracion: $error')),
      );
    }
  }
}

class _SheetModeButton extends StatelessWidget {
  const _SheetModeButton({
    required this.selected,
    required this.icon,
    required this.label,
    required this.onPressed,
    this.color,
  });

  final bool selected;
  final IconData icon;
  final String label;
  final VoidCallback onPressed;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final resolvedColor = color ?? Theme.of(context).colorScheme.primary;

    if (selected) {
      return FilledButton.tonalIcon(
        onPressed: onPressed,
        icon: Icon(icon),
        label: Text(label),
        style: FilledButton.styleFrom(
          backgroundColor: resolvedColor.withValues(alpha: 0.18),
          foregroundColor: resolvedColor,
        ),
      );
    }

    return OutlinedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon),
      label: Text(label),
      style: OutlinedButton.styleFrom(
        foregroundColor: resolvedColor,
        side: BorderSide(color: resolvedColor.withValues(alpha: 0.42)),
      ),
    );
  }
}

class _RegisteredUsersSliverList extends StatelessWidget {
  const _RegisteredUsersSliverList({
    required this.users,
    required this.onUserTap,
    required this.onUserLongPress,
    required this.countryForUser,
  });

  final List<UserLocationRecord> users;
  final ValueChanged<UserLocationRecord> onUserTap;
  final ValueChanged<UserLocationRecord> onUserLongPress;
  final Future<String?> Function(UserLocationRecord user) countryForUser;

  @override
  Widget build(BuildContext context) {
    if (users.isEmpty) {
      return SliverFillRemaining(
        hasScrollBody: false,
        child: Center(
          child: Text(
            'No hay usuarios con ubicacion registrada.',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      );
    }

    final colors = Theme.of(context).colorScheme;
    return SliverList.separated(
      itemCount: users.length,
      separatorBuilder: (context, index) => Divider(
        height: 1,
        indent: 72,
        endIndent: 20,
        color: colors.outlineVariant.withValues(alpha: 0.7),
      ),
      itemBuilder: (context, index) {
        final user = users[index];
        return _UserLocationListTile(
          user: user,
          onTap: () => onUserTap(user),
          onLongPress: () => onUserLongPress(user),
          countryForUser: countryForUser,
        );
      },
    );
  }
}

class _AnonymousUsersSliverList extends StatelessWidget {
  const _AnonymousUsersSliverList({
    required this.users,
    required this.onUserTap,
    required this.onUserLongPress,
    required this.countryForUser,
  });

  final List<UserProfileRecord> users;
  final ValueChanged<UserProfileRecord> onUserTap;
  final ValueChanged<UserProfileRecord> onUserLongPress;
  final Future<String?> Function(UserLocationRecord user) countryForUser;

  @override
  Widget build(BuildContext context) {
    if (users.isEmpty) {
      return SliverFillRemaining(
        hasScrollBody: false,
        child: Center(
          child: Text(
            'No hay usuarios anonimos.',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      );
    }

    final colors = Theme.of(context).colorScheme;
    return SliverList.separated(
      itemCount: users.length,
      separatorBuilder: (context, index) => Divider(
        height: 1,
        indent: 72,
        endIndent: 20,
        color: colors.outlineVariant.withValues(alpha: 0.7),
      ),
      itemBuilder: (context, index) {
        final user = users[index];
        return _UserProfileListTile(
          user: user,
          onTap: () => onUserTap(user),
          onLongPress: () => onUserLongPress(user),
          countryForUser: countryForUser,
        );
      },
    );
  }
}

class _UserProfileListTile extends StatelessWidget {
  const _UserProfileListTile({
    required this.user,
    required this.onTap,
    required this.onLongPress,
    required this.countryForUser,
  });

  final UserProfileRecord user;
  final VoidCallback onTap;
  final VoidCallback onLongPress;
  final Future<String?> Function(UserLocationRecord user) countryForUser;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final locationUser = user.locationRecord;

    return InkWell(
      onTap: onTap,
      onLongPress: onLongPress,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        child: Row(
          children: [
            CircleAvatar(
              radius: 22,
              backgroundImage: user.photoUrl == null || user.photoUrl!.isEmpty
                  ? null
                  : NetworkImage(user.photoUrl!),
              child: user.photoUrl == null || user.photoUrl!.isEmpty
                  ? Text(user.title.characters.first.toUpperCase())
                  : null,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Text(
                    user.subtitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.bodySmall,
                  ),
                  const SizedBox(height: 4),
                  Wrap(
                    spacing: 6,
                    runSpacing: 4,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      _ProfilePresenceChip(user: user),
                      const _InfoPill(
                        icon: Icons.person_outline_rounded,
                        label: 'Invitado',
                      ),
                      if (_compactProfileAppLabel(user) != null)
                        _InfoPill(
                          icon: Icons.phone_iphone_rounded,
                          label: _compactProfileAppLabel(user)!,
                        ),
                      if (user.openCount != null)
                        _InfoPill(
                          icon: Icons.visibility_rounded,
                          label: '${user.openCount} aperturas',
                        ),
                    ],
                  ),
                  if (user.lastSeenAt != null) ...[
                    const SizedBox(height: 3),
                    Text(
                      'Visto ${_formatDateTime(user.lastSeenAt!)}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: colors.onSurfaceVariant,
                      ),
                    ),
                  ],
                  if (locationUser == null)
                    Text(
                      'Sin ubicacion registrada',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: colors.onSurfaceVariant,
                      ),
                    )
                  else
                    FutureBuilder<String?>(
                      future: countryForUser(locationUser),
                      builder: (context, snapshot) {
                        final country = snapshot.data;
                        return Text(
                          country == null || country.isEmpty
                              ? 'Pais no disponible'
                              : country,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: colors.primary,
                          ),
                        );
                      },
                    ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Icon(
              locationUser == null
                  ? Icons.location_off_rounded
                  : Icons.place_rounded,
              size: 20,
              color: locationUser == null
                  ? colors.onSurfaceVariant
                  : colors.primary,
            ),
          ],
        ),
      ),
    );
  }
}

class _UserLocationListTile extends StatelessWidget {
  const _UserLocationListTile({
    required this.user,
    required this.onTap,
    required this.onLongPress,
    required this.countryForUser,
  });

  final UserLocationRecord user;
  final VoidCallback onTap;
  final VoidCallback onLongPress;
  final Future<String?> Function(UserLocationRecord user) countryForUser;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return InkWell(
      onTap: onTap,
      onLongPress: onLongPress,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        child: Row(
          children: [
            CircleAvatar(
              radius: 22,
              backgroundImage: user.photoUrl == null || user.photoUrl!.isEmpty
                  ? null
                  : NetworkImage(user.photoUrl!),
              child: user.photoUrl == null || user.photoUrl!.isEmpty
                  ? Text(user.title.characters.first.toUpperCase())
                  : null,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  if (user.email != null && user.email!.trim().isNotEmpty)
                    Text(
                      user.email!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.bodySmall,
                    ),
                  const SizedBox(height: 4),
                  Wrap(
                    spacing: 6,
                    runSpacing: 4,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      _PresenceChip(user: user),
                      if (user.isAnonymous)
                        const _InfoPill(
                          icon: Icons.person_outline_rounded,
                          label: 'Invitado',
                        ),
                      if (_compactAppLabel(user) != null)
                        _InfoPill(
                          icon: Icons.phone_iphone_rounded,
                          label: _compactAppLabel(user)!,
                        ),
                      if (user.openCount != null)
                        _InfoPill(
                          icon: Icons.visibility_rounded,
                          label: '${user.openCount} aperturas',
                        ),
                    ],
                  ),
                  if (user.lastSeenAt != null) ...[
                    const SizedBox(height: 3),
                    Text(
                      'Visto ${_formatDateTime(user.lastSeenAt!)}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: colors.onSurfaceVariant,
                      ),
                    ),
                  ],
                  FutureBuilder<String?>(
                    future: countryForUser(user),
                    builder: (context, snapshot) {
                      final country = snapshot.data;
                      return Text(
                        country == null || country.isEmpty
                            ? 'Pais no disponible'
                            : country,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: colors.primary,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Icon(Icons.place_rounded, size: 20, color: colors.primary),
          ],
        ),
      ),
    );
  }
}

class _PresenceChip extends StatelessWidget {
  const _PresenceChip({required this.user});

  final UserLocationRecord user;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final online = user.isEffectivelyOnline;
    final color = online ? colors.primary : colors.onSurfaceVariant;
    final label = online ? 'En linea' : 'Offline';

    return _InfoPill(
      icon: online
          ? Icons.radio_button_checked_rounded
          : Icons.radio_button_unchecked_rounded,
      label: label,
      color: color,
    );
  }
}

class _ProfilePresenceChip extends StatelessWidget {
  const _ProfilePresenceChip({required this.user});

  final UserProfileRecord user;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final online = user.isEffectivelyOnline;
    final color = online ? colors.primary : colors.onSurfaceVariant;
    final label = online ? 'En linea' : 'Offline';

    return _InfoPill(
      icon: online
          ? Icons.radio_button_checked_rounded
          : Icons.radio_button_unchecked_rounded,
      label: label,
      color: color,
    );
  }
}

class _InfoPill extends StatelessWidget {
  const _InfoPill({
    required this.icon,
    required this.label,
    this.color,
    this.onTap,
  });

  final IconData icon;
  final String label;
  final Color? color;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final resolvedColor = color ?? colors.primary;

    final pill = Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 4),
      decoration: BoxDecoration(
        color: resolvedColor.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: resolvedColor.withValues(alpha: 0.28)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 13, color: resolvedColor),
          const SizedBox(width: 4),
          Text(
            label,
            style: theme.textTheme.labelSmall?.copyWith(
              color: resolvedColor,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
    if (onTap == null) return pill;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(999),
        child: pill,
      ),
    );
  }
}

class _SelectedLocationMarker extends StatelessWidget {
  const _SelectedLocationMarker({this.label, this.onLongPress});

  final String? label;
  final VoidCallback? onLongPress;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final cleanLabel = label?.trim();

    return GestureDetector(
      onLongPress: onLongPress,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Material(
            color: colors.primary,
            elevation: 5,
            shadowColor: colors.shadow.withValues(alpha: 0.22),
            borderRadius: BorderRadius.circular(16),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.place_rounded, color: colors.onPrimary, size: 18),
                  if (cleanLabel != null && cleanLabel.isNotEmpty) ...[
                    const SizedBox(width: 6),
                    Flexible(
                      child: Text(
                        cleanLabel,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.labelLarge?.copyWith(
                          color: colors.onPrimary,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
          Icon(Icons.location_on_rounded, color: colors.primary, size: 34),
        ],
      ),
    );
  }
}

class _UserLocationMarker extends StatelessWidget {
  const _UserLocationMarker({
    required this.user,
    required this.onTap,
    required this.onLongPress,
  });

  final UserLocationRecord user;
  final VoidCallback onTap;
  final VoidCallback onLongPress;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return GestureDetector(
      onTap: onTap,
      onLongPress: onLongPress,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Material(
            color: colors.surface,
            elevation: 5,
            shadowColor: colors.shadow.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(16),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    radius: 14,
                    backgroundImage:
                        user.photoUrl == null || user.photoUrl!.isEmpty
                        ? null
                        : NetworkImage(user.photoUrl!),
                    child: user.photoUrl == null || user.photoUrl!.isEmpty
                        ? Text(user.title.characters.first.toUpperCase())
                        : null,
                  ),
                  const SizedBox(width: 8),
                  Flexible(
                    child: Text(
                      user.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.labelLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Icon(Icons.location_on_rounded, color: colors.primary, size: 34),
        ],
      ),
    );
  }
}

class _HistoryIndexBadge extends StatelessWidget {
  const _HistoryIndexBadge({required this.number});

  final int number;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Container(
      width: 34,
      height: 34,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: colors.primary.withValues(alpha: 0.14),
        shape: BoxShape.circle,
        border: Border.all(color: colors.primary.withValues(alpha: 0.42)),
      ),
      child: Text(
        '$number',
        style: theme.textTheme.labelLarge?.copyWith(
          color: colors.primary,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}

class _UserLocationActionSheet extends ConsumerWidget {
  const _UserLocationActionSheet({
    required this.user,
    required this.onShowLocation,
  });

  final UserLocationRecord user;
  final void Function({
    required double latitude,
    required double longitude,
    String? label,
  })
  onShowLocation;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUser = _resolveCurrentUser(
      ref.watch(usersWithLocationsProvider),
    );
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final historyAsync = ref.watch(
      userLocationHistoryProvider(currentUser.uid),
    );

    return SafeArea(
      child: DraggableScrollableSheet(
        expand: false,
        initialChildSize: 0.72,
        minChildSize: 0.38,
        maxChildSize: 0.92,
        builder: (context, scrollController) {
          return ListView(
            controller: scrollController,
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 26,
                    backgroundImage:
                        currentUser.photoUrl == null ||
                            currentUser.photoUrl!.isEmpty
                        ? null
                        : NetworkImage(currentUser.photoUrl!),
                    child:
                        currentUser.photoUrl == null ||
                            currentUser.photoUrl!.isEmpty
                        ? Text(currentUser.title.characters.first.toUpperCase())
                        : null,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          currentUser.title,
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Text(
                          currentUser.subtitle,
                          style: theme.textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              _InfoTile(
                icon: currentUser.isAnonymous
                    ? Icons.person_outline_rounded
                    : Icons.verified_user_rounded,
                title: 'Tipo de usuario',
                value: currentUser.isAnonymous
                    ? 'No autenticado'
                    : 'Autenticado',
              ),
              _InfoTile(
                icon: Icons.schedule_rounded,
                title: 'Frecuencia actual',
                value: _formatDuration(currentUser.updateInterval),
              ),
              _InfoTile(
                icon: Icons.place_rounded,
                title: 'Ultima ubicacion',
                value: currentUser.locationUpdatedAt == null
                    ? 'Sin fecha'
                    : DateFormat(
                        'dd/MM/yyyy HH:mm',
                      ).format(currentUser.locationUpdatedAt!),
                onTap: () => _showLocationActions(
                  context,
                  title: 'Ultima ubicacion',
                  user: currentUser,
                  latitude: currentUser.latitude,
                  longitude: currentUser.longitude,
                  createdAt: currentUser.locationUpdatedAt,
                ),
              ),
              if (currentUser.locationStatus != null)
                _InfoTile(
                  icon: currentUser.locationStatus!.isHealthy
                      ? Icons.gps_fixed_rounded
                      : Icons.gps_off_rounded,
                  title: 'Estado de ubicacion',
                  value: _locationStatusSummary(currentUser.locationStatus!),
                ),
              _InfoTile(
                icon: currentUser.isEffectivelyOnline
                    ? Icons.radio_button_checked_rounded
                    : Icons.radio_button_unchecked_rounded,
                title: 'Estado de conexion',
                value: _presenceSummary(currentUser),
              ),
              _InfoTile(
                icon: Icons.login_rounded,
                title: 'Ultima actividad',
                value: _activitySummary(currentUser),
              ),
              _InfoTile(
                icon: Icons.phone_iphone_rounded,
                title: 'App y dispositivo',
                value: _deviceSummary(currentUser),
              ),
              if (currentUser.campaignSegments.isNotEmpty)
                _InfoTile(
                  icon: Icons.campaign_rounded,
                  title: 'Segmentos de campaña',
                  value: currentUser.campaignSegments.take(6).join(', '),
                ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: FilledButton.icon(
                      onPressed: () => _pickInterval(context, ref, currentUser),
                      icon: const Icon(Icons.timer_rounded),
                      label: const Text('Cambiar tiempo'),
                    ),
                  ),
                  const SizedBox(width: 10),
                  IconButton.filledTonal(
                    tooltip: 'Usar 24 horas',
                    onPressed: () => _setInterval(
                      context,
                      ref,
                      currentUser,
                      defaultLocationUpdateInterval,
                    ),
                    icon: const Icon(Icons.today_rounded),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Historial de ubicaciones',
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  historyAsync.maybeWhen(
                    data: (history) => history.isEmpty
                        ? const SizedBox.shrink()
                        : TextButton.icon(
                            onPressed: () =>
                                _confirmDeleteAllHistory(context, ref, history),
                            icon: const Icon(Icons.delete_sweep_rounded),
                            label: const Text('Borrar todo'),
                          ),
                    orElse: () => const SizedBox.shrink(),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              historyAsync.when(
                data: (history) {
                  if (history.isEmpty) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      child: Text(
                        'Este usuario aun no tiene historial guardado.',
                        style: theme.textTheme.bodyMedium,
                      ),
                    );
                  }

                  return Column(
                    children: history.indexed
                        .map((item) {
                          final index = item.$1;
                          final entry = item.$2;
                          return ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: _HistoryIndexBadge(number: index + 1),
                            trailing: IconButton(
                              tooltip: 'Borrar ubicacion',
                              icon: const Icon(Icons.delete_outline_rounded),
                              color: colors.error,
                              onPressed: () => _confirmDeleteHistoryEntry(
                                context,
                                ref,
                                entry,
                              ),
                            ),
                            onTap: () => _showLocationActions(
                              context,
                              title: 'Ubicacion del historial',
                              user: currentUser,
                              latitude: entry.latitude,
                              longitude: entry.longitude,
                              createdAt: entry.createdAt,
                            ),
                            title: Text(
                              entry.createdAt == null
                                  ? 'Sin fecha'
                                  : DateFormat(
                                      'dd/MM/yyyy HH:mm',
                                    ).format(entry.createdAt!),
                            ),
                            subtitle: Text(
                              '${entry.latitude.toStringAsFixed(5)}, '
                              '${entry.longitude.toStringAsFixed(5)}',
                            ),
                          );
                        })
                        .toList(growable: false),
                  );
                },
                loading: () => const Padding(
                  padding: EdgeInsets.symmetric(vertical: 24),
                  child: Center(child: CircularProgressIndicator()),
                ),
                error: (error, _) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  child: Text('No se pudo cargar el historial: $error'),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  UserLocationRecord _resolveCurrentUser(
    AsyncValue<List<UserLocationRecord>> usersAsync,
  ) {
    return usersAsync.maybeWhen(
      data: (users) {
        for (final candidate in users) {
          if (candidate.uid == user.uid) return candidate;
        }
        return user;
      },
      orElse: () => user,
    );
  }

  Future<void> _showLocationActions(
    BuildContext context, {
    required String title,
    required UserLocationRecord user,
    required double latitude,
    required double longitude,
    DateTime? createdAt,
  }) async {
    await showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      builder: (actionContext) {
        final theme = Theme.of(actionContext);
        final colors = theme.colorScheme;
        final coordinates =
            '${latitude.toStringAsFixed(5)}, ${longitude.toStringAsFixed(5)}';
        final dateLabel = createdAt == null
            ? null
            : DateFormat('dd/MM/yyyy HH:mm').format(createdAt);

        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 4),
                Text(coordinates, style: theme.textTheme.bodyMedium),
                if (dateLabel != null)
                  Text(dateLabel, style: theme.textTheme.bodySmall),
                const SizedBox(height: 12),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Icon(Icons.map_rounded, color: colors.primary),
                  title: const Text('Ver en el mapa'),
                  onTap: () {
                    Navigator.of(actionContext).pop();
                    Navigator.of(context).pop();
                    onShowLocation(
                      latitude: latitude,
                      longitude: longitude,
                      label: user.title,
                    );
                  },
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Icon(Icons.ios_share_rounded, color: colors.primary),
                  title: const Text('Compartir ubicacion'),
                  onTap: () {
                    Navigator.of(actionContext).pop();
                    _shareLocation(
                      context,
                      title: title,
                      latitude: latitude,
                      longitude: longitude,
                      createdAt: createdAt,
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _confirmDeleteHistoryEntry(
    BuildContext context,
    WidgetRef ref,
    UserLocationHistoryEntry entry,
  ) async {
    final confirmed = await _confirmDestructiveAction(
      context,
      title: 'Borrar ubicacion',
      message: 'Esta ubicacion se eliminara del historial de ${user.title}.',
      confirmLabel: 'Borrar',
    );
    if (!confirmed || !context.mounted) return;

    await ref
        .read(userLocationRepositoryProvider)
        .deleteLocationHistoryEntry(uid: user.uid, entryId: entry.id);
    if (!context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Ubicacion eliminada del historial.')),
    );
  }

  Future<void> _confirmDeleteAllHistory(
    BuildContext context,
    WidgetRef ref,
    List<UserLocationHistoryEntry> history,
  ) async {
    final confirmed = await _confirmDestructiveAction(
      context,
      title: 'Borrar historial',
      message:
          'Se eliminaran ${history.length} ubicaciones del historial de ${user.title}.',
      confirmLabel: 'Borrar todo',
    );
    if (!confirmed || !context.mounted) return;

    final deletedCount = await ref
        .read(userLocationRepositoryProvider)
        .deleteAllLocationHistory(user.uid);
    if (!context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('$deletedCount ubicaciones eliminadas.')),
    );
  }

  Future<bool> _confirmDestructiveAction(
    BuildContext context, {
    required String title,
    required String message,
    required String confirmLabel,
  }) async {
    return await showDialog<bool>(
          context: context,
          builder: (dialogContext) {
            final colors = Theme.of(dialogContext).colorScheme;
            return AlertDialog(
              title: Text(title),
              content: Text(message),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(dialogContext).pop(false),
                  child: const Text('Cancelar'),
                ),
                FilledButton(
                  style: FilledButton.styleFrom(
                    backgroundColor: colors.error,
                    foregroundColor: colors.onError,
                  ),
                  onPressed: () => Navigator.of(dialogContext).pop(true),
                  child: Text(confirmLabel),
                ),
              ],
            );
          },
        ) ??
        false;
  }

  Future<void> _shareLocation(
    BuildContext context, {
    required String title,
    required double latitude,
    required double longitude,
    DateTime? createdAt,
  }) async {
    final box = context.findRenderObject() as RenderBox?;
    final dateLabel = createdAt == null
        ? null
        : DateFormat('dd/MM/yyyy HH:mm').format(createdAt);
    final mapsUrl =
        'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    final text = [
      '$title de ${user.title}',
      ?dateLabel,
      '${latitude.toStringAsFixed(5)}, ${longitude.toStringAsFixed(5)}',
      mapsUrl,
    ].join('\n');

    await SharePlus.instance.share(
      ShareParams(
        text: text,
        subject: title,
        sharePositionOrigin: box != null
            ? box.localToGlobal(Offset.zero) & box.size
            : null,
      ),
    );
  }

  Future<void> _pickInterval(
    BuildContext context,
    WidgetRef ref,
    UserLocationRecord user,
  ) async {
    final selected = await showModalBottomSheet<Duration>(
      context: context,
      showDragHandle: true,
      isScrollControlled: true,
      builder: (context) =>
          _LocationIntervalPickerSheet(initialInterval: user.updateInterval),
    );
    if (selected == null) return;
    if (!context.mounted) return;

    await _setInterval(context, ref, user, selected);
  }

  Future<void> _setInterval(
    BuildContext context,
    WidgetRef ref,
    UserLocationRecord user,
    Duration interval,
  ) async {
    await ref
        .read(userLocationRepositoryProvider)
        .updateLocationUpdateInterval(uid: user.uid, interval: interval);
    if (!context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Frecuencia actualizada a ${_formatDuration(interval)}.'),
      ),
    );
  }
}

class _LocationIntervalPickerSheet extends StatefulWidget {
  const _LocationIntervalPickerSheet({required this.initialInterval});

  final Duration initialInterval;

  @override
  State<_LocationIntervalPickerSheet> createState() =>
      _LocationIntervalPickerSheetState();
}

class _LocationIntervalPickerSheetState
    extends State<_LocationIntervalPickerSheet> {
  late int _days;
  late int _hours;
  late int _minutes;
  late int _seconds;

  @override
  void initState() {
    super.initState();
    final totalSeconds = widget.initialInterval.inSeconds.clamp(
      minLocationUpdateInterval.inSeconds,
      maxLocationUpdateInterval.inSeconds,
    );
    _days = totalSeconds ~/ Duration.secondsPerDay;
    final secondsAfterDays = totalSeconds % Duration.secondsPerDay;
    _hours = secondsAfterDays ~/ Duration.secondsPerHour;
    final secondsAfterHours = secondsAfterDays % Duration.secondsPerHour;
    _minutes = secondsAfterHours ~/ Duration.secondsPerMinute;
    _seconds = secondsAfterHours % Duration.secondsPerMinute;
  }

  Duration get _selectedInterval => Duration(
    days: _days,
    hours: _hours,
    minutes: _minutes,
    seconds: _seconds,
  );

  bool get _canSave {
    final seconds = _selectedInterval.inSeconds;
    return seconds >= minLocationUpdateInterval.inSeconds &&
        seconds <= maxLocationUpdateInterval.inSeconds;
  }

  void _setPreset(Duration interval) {
    final totalSeconds = interval.inSeconds.clamp(
      minLocationUpdateInterval.inSeconds,
      maxLocationUpdateInterval.inSeconds,
    );
    setState(() {
      _days = totalSeconds ~/ Duration.secondsPerDay;
      final secondsAfterDays = totalSeconds % Duration.secondsPerDay;
      _hours = secondsAfterDays ~/ Duration.secondsPerHour;
      final secondsAfterHours = secondsAfterDays % Duration.secondsPerHour;
      _minutes = secondsAfterHours ~/ Duration.secondsPerMinute;
      _seconds = secondsAfterHours % Duration.secondsPerMinute;
    });
  }

  void _setDays(int value) {
    setState(() {
      _days = value;
      if (_days == maxLocationUpdateInterval.inDays) {
        _hours = 0;
        _minutes = 0;
        _seconds = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final maxDays = maxLocationUpdateInterval.inDays;

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          20,
          0,
          20,
          20 + MediaQuery.viewInsetsOf(context).bottom,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tiempo entre reportes',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 14),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _PresetChip(
                  label: '10 s',
                  onSelected: () => _setPreset(const Duration(seconds: 10)),
                ),
                _PresetChip(
                  label: '30 s',
                  onSelected: () => _setPreset(const Duration(seconds: 30)),
                ),
                _PresetChip(
                  label: '1 min',
                  onSelected: () => _setPreset(const Duration(minutes: 1)),
                ),
                _PresetChip(
                  label: '15 min',
                  onSelected: () => _setPreset(const Duration(minutes: 15)),
                ),
                _PresetChip(
                  label: '1 h',
                  onSelected: () => _setPreset(const Duration(hours: 1)),
                ),
                _PresetChip(
                  label: '6 h',
                  onSelected: () => _setPreset(const Duration(hours: 6)),
                ),
                _PresetChip(
                  label: '24 h',
                  onSelected: () => _setPreset(defaultLocationUpdateInterval),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _IntervalDropdown(
                    label: 'Dias',
                    value: _days,
                    max: maxDays,
                    onChanged: _setDays,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _IntervalDropdown(
                    label: 'Horas',
                    value: _hours,
                    max: 23,
                    enabled: _days < maxDays,
                    onChanged: (value) => setState(() => _hours = value),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _IntervalDropdown(
                    label: 'Min',
                    value: _minutes,
                    max: 59,
                    enabled: _days < maxDays,
                    onChanged: (value) => setState(() => _minutes = value),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _IntervalDropdown(
                    label: 'Seg',
                    value: _seconds,
                    max: 59,
                    enabled: _days < maxDays,
                    onChanged: (value) => setState(() => _seconds = value),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              _canSave
                  ? 'Frecuencia: ${_formatDuration(_selectedInterval)}'
                  : 'El intervalo minimo es de 10 segundos.',
              style: theme.textTheme.bodySmall?.copyWith(
                color: _canSave ? colors.onSurfaceVariant : colors.error,
              ),
            ),
            const SizedBox(height: 18),
            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: _canSave
                    ? () => Navigator.of(context).pop(_selectedInterval)
                    : null,
                icon: const Icon(Icons.check_rounded),
                label: const Text('Guardar frecuencia'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LocationHistoryCleanupScheduleSheet extends StatefulWidget {
  const _LocationHistoryCleanupScheduleSheet({required this.initialSchedule});

  final LocationHistoryCleanupSchedule initialSchedule;

  @override
  State<_LocationHistoryCleanupScheduleSheet> createState() =>
      _LocationHistoryCleanupScheduleSheetState();
}

class _LocationHistoryCleanupScheduleSheetState
    extends State<_LocationHistoryCleanupScheduleSheet> {
  late bool _enabled;
  late int _hour;
  late int _minute;

  @override
  void initState() {
    super.initState();
    _enabled = widget.initialSchedule.enabled;
    _hour = widget.initialSchedule.hour;
    _minute = widget.initialSchedule.minute;
  }

  LocationHistoryCleanupSchedule get _schedule {
    return widget.initialSchedule.copyWith(
      enabled: _enabled,
      hour: _hour,
      minute: _minute,
    );
  }

  void _setPreset(int hour, int minute) {
    setState(() {
      _enabled = true;
      _hour = hour;
      _minute = minute;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final lastRunAt = widget.initialSchedule.lastRunAt;
    final deletedCount = widget.initialSchedule.lastDeletedCount;

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          20,
          0,
          20,
          20 + MediaQuery.viewInsetsOf(context).bottom,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Limpieza automatica',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 8),
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              value: _enabled,
              onChanged: (value) => setState(() => _enabled = value),
              title: const Text('Borrar historiales automaticamente'),
              subtitle: Text(
                _enabled
                    ? 'Se ejecuta una vez al dia a la hora configurada.'
                    : 'La limpieza programada esta apagada.',
              ),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _PresetChip(
                  label: '6:00 AM',
                  onSelected: () => _setPreset(6, 0),
                ),
                _PresetChip(
                  label: '12:00 PM',
                  onSelected: () => _setPreset(12, 0),
                ),
                _PresetChip(
                  label: '6:00 PM',
                  onSelected: () => _setPreset(18, 0),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _IntervalDropdown(
                    label: 'Hora',
                    value: _hour,
                    max: 23,
                    enabled: _enabled,
                    onChanged: (value) => setState(() => _hour = value),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _SteppedMinuteDropdown(
                    value: _minute,
                    enabled: _enabled,
                    onChanged: (value) => setState(() => _minute = value),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              _enabled
                  ? 'Hora: ${_formatScheduleTime(_schedule)}'
                  : 'No se ejecutara ninguna limpieza automatica.',
              style: theme.textTheme.bodySmall?.copyWith(
                color: _enabled ? colors.onSurfaceVariant : colors.error,
              ),
            ),
            if (lastRunAt != null) ...[
              const SizedBox(height: 6),
              Text(
                'Ultima ejecucion: ${_formatDateTime(lastRunAt)}'
                '${deletedCount == null ? '' : ' · $deletedCount eliminadas'}',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: colors.onSurfaceVariant,
                ),
              ),
            ],
            const SizedBox(height: 18),
            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: () => Navigator.of(context).pop(_schedule),
                icon: const Icon(Icons.check_rounded),
                label: const Text('Guardar configuracion'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PresetChip extends StatelessWidget {
  const _PresetChip({required this.label, required this.onSelected});

  final String label;
  final VoidCallback onSelected;

  @override
  Widget build(BuildContext context) {
    return ActionChip(label: Text(label), onPressed: onSelected);
  }
}

class _SteppedMinuteDropdown extends StatelessWidget {
  const _SteppedMinuteDropdown({
    required this.value,
    required this.onChanged,
    this.enabled = true,
  });

  final int value;
  final ValueChanged<int> onChanged;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final normalizedValue = value.clamp(0, 59);
    final items = <int>{
      for (var minute = 0; minute < 60; minute += 5) minute,
      normalizedValue,
    }.toList()..sort();

    return DropdownButtonFormField<int>(
      initialValue: normalizedValue,
      isExpanded: true,
      decoration: const InputDecoration(labelText: 'Min'),
      items: [
        for (final minute in items)
          DropdownMenuItem<int>(
            value: minute,
            child: Text(minute.toString().padLeft(2, '0')),
          ),
      ],
      onChanged: enabled
          ? (value) {
              if (value == null) return;
              onChanged(value);
            }
          : null,
    );
  }
}

class _IntervalDropdown extends StatelessWidget {
  const _IntervalDropdown({
    required this.label,
    required this.value,
    required this.max,
    required this.onChanged,
    this.enabled = true,
  });

  final String label;
  final int value;
  final int max;
  final ValueChanged<int> onChanged;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<int>(
      initialValue: value,
      isExpanded: true,
      decoration: InputDecoration(labelText: label),
      items: [
        for (var index = 0; index <= max; index++)
          DropdownMenuItem<int>(value: index, child: Text('$index')),
      ],
      onChanged: enabled
          ? (value) {
              if (value == null) return;
              onChanged(value);
            }
          : null,
    );
  }
}

class _InfoTile extends StatelessWidget {
  const _InfoTile({
    required this.icon,
    required this.title,
    required this.value,
    this.onTap,
  });

  final IconData icon;
  final String title;
  final String value;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon, color: colors.primary),
      title: Text(title),
      subtitle: Text(value, style: theme.textTheme.bodyMedium),
      trailing: onTap == null ? null : const Icon(Icons.chevron_right_rounded),
      onTap: onTap,
    );
  }
}

String _formatDuration(Duration duration) {
  final totalSeconds = duration.inSeconds;
  if (totalSeconds < Duration.secondsPerMinute) {
    return 'cada $totalSeconds s';
  }
  if (totalSeconds < Duration.secondsPerHour &&
      totalSeconds % Duration.secondsPerMinute != 0) {
    final minutes = totalSeconds ~/ Duration.secondsPerMinute;
    final seconds = totalSeconds % Duration.secondsPerMinute;
    return 'cada $minutes min $seconds s';
  }
  final totalMinutes = duration.inMinutes;
  if (totalMinutes >= 1440 && totalMinutes % 1440 == 0) {
    final days = totalMinutes ~/ 1440;
    return days == 1 ? 'cada 24 horas' : 'cada $days dias';
  }
  final hours = totalMinutes ~/ 60;
  final minutes = totalMinutes % 60;
  if (hours == 0) return 'cada $minutes min';
  if (minutes == 0) return 'cada $hours h';
  return 'cada $hours h $minutes min';
}

String _locationStatusSummary(LocationTrackingStatus status) {
  final label = switch (status.status) {
    'saved' => 'Ubicacion guardada',
    'serviceDisabled' => 'GPS/ubicacion desactivada',
    'permissionDenied' => 'Permiso de ubicacion denegado',
    'permissionDeniedForever' => 'Permiso bloqueado en ajustes',
    'alwaysPermissionRequired' => 'Falta permiso siempre activo',
    'unavailable' => 'Ubicacion no disponible',
    _ => 'Estado desconocido',
  };
  final reason = switch (status.reason) {
    'last-known-fallback' => 'ultima conocida',
    'current' => 'actual',
    'service-disabled' => 'servicio apagado',
    'permission-denied' => 'sin permiso',
    'permission-denied-forever' => 'bloqueado',
    'current-unavailable' => 'sin lectura actual',
    'last-known-stale' => 'ultima conocida vieja',
    'unexpected-error' => 'error inesperado',
    _ => status.reason,
  };
  final updatedAt = status.updatedAt == null
      ? ''
      : ' · ${DateFormat('dd/MM/yyyy HH:mm').format(status.updatedAt!)}';
  return '$label · $reason$updatedAt';
}

String _formatCleanupSchedule(LocationHistoryCleanupSchedule schedule) {
  if (!schedule.enabled) return 'Limpieza apagada';
  return 'Limpieza ${_formatScheduleTime(schedule)}';
}

String _formatAnonymousCleanup(AnonymousUserCleanupConfig config) {
  if (!config.enabled) return 'Invitados sin limpieza';
  return 'Limpiar invitados ${config.inactivityDays} dias';
}

String _formatScheduleTime(LocationHistoryCleanupSchedule schedule) {
  final dateTime = DateTime(0, 1, 1, schedule.hour, schedule.minute);
  final time = DateFormat('h:mm a').format(dateTime);
  return '$time ${schedule.timezone}';
}

String _formatDateTime(DateTime value) {
  return DateFormat('dd/MM/yyyy HH:mm').format(value);
}

String _presenceSummary(UserLocationRecord user) {
  final state = user.appState?.trim();
  final lastSeen = user.lastSeenAt == null
      ? null
      : 'visto ${_formatDateTime(user.lastSeenAt!)}';
  final status = user.isEffectivelyOnline ? 'En linea' : 'Offline';
  return [
    status,
    if (state != null && state.isNotEmpty) state,
    ?lastSeen,
  ].join(' · ');
}

String _activitySummary(UserLocationRecord user) {
  final opened = user.lastOpenedAt == null
      ? null
      : 'abrió ${_formatDateTime(user.lastOpenedAt!)}';
  final online = user.lastOnlineAt == null
      ? null
      : 'online ${_formatDateTime(user.lastOnlineAt!)}';
  final offline = user.lastOfflineAt == null
      ? null
      : 'offline ${_formatDateTime(user.lastOfflineAt!)}';
  final count = user.openCount == null ? null : '${user.openCount} aperturas';
  final parts = [?opened, ?online, ?offline, ?count];
  return parts.isEmpty ? 'Sin actividad registrada' : parts.join(' · ');
}

String _deviceSummary(UserLocationRecord user) {
  final appLabel = _compactAppLabel(user);
  final timezone = _timezoneLabel(user);
  final locale = user.deviceLocale;
  final parts = [
    ?appLabel,
    if (locale != null && locale.isNotEmpty) locale,
    ?timezone,
  ];
  return parts.isEmpty ? 'Sin datos de dispositivo' : parts.join(' · ');
}

String? _compactAppLabel(UserLocationRecord user) {
  final platform = user.platform?.trim();
  final version = user.appVersion?.trim();
  final build = user.buildNumber?.trim();
  final parts = [
    if (platform != null && platform.isNotEmpty) platform,
    if (version != null && version.isNotEmpty)
      build != null && build.isNotEmpty ? 'v$version+$build' : 'v$version',
  ];
  return parts.isEmpty ? null : parts.join(' · ');
}

String? _compactProfileAppLabel(UserProfileRecord user) {
  final platform = user.platform?.trim();
  final version = user.appVersion?.trim();
  final build = user.buildNumber?.trim();
  final parts = [
    if (platform != null && platform.isNotEmpty) platform,
    if (version != null && version.isNotEmpty)
      build != null && build.isNotEmpty ? 'v$version+$build' : 'v$version',
  ];
  return parts.isEmpty ? null : parts.join(' · ');
}

String? _timezoneLabel(UserLocationRecord user) {
  final name = user.timezoneName?.trim();
  final offset = user.timezoneOffsetMinutes;
  if ((name == null || name.isEmpty) && offset == null) return null;
  if (offset == null) return name;

  final sign = offset >= 0 ? '+' : '-';
  final absolute = offset.abs();
  final hours = (absolute ~/ 60).toString().padLeft(2, '0');
  final minutes = (absolute % 60).toString().padLeft(2, '0');
  final gmt = 'GMT$sign$hours:$minutes';
  if (name == null || name.isEmpty) return gmt;
  return '$name · $gmt';
}

String _normalizeQuery(String value) {
  const replacements = {
    'á': 'a',
    'é': 'e',
    'í': 'i',
    'ó': 'o',
    'ú': 'u',
    'ü': 'u',
    'ñ': 'n',
  };
  var normalized = value.trim().toLowerCase();
  for (final entry in replacements.entries) {
    normalized = normalized.replaceAll(entry.key, entry.value);
  }
  return normalized;
}
