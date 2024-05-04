import 'package:flow_music/provider/list_result.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


class ListSearch extends ConsumerWidget {
  const ListSearch({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
        child: ref.watch(searchDataReqProvider).when(
            data: (data) => data == null
                ? null
                : ListView.builder(
                    itemCount: data. contents?.first
                        .searchSuggestionsSectionRenderer?.contents?.length,
                    itemBuilder: (context, index) {
                      final dataRes = data
                          .contents
                          ?.first
                          .searchSuggestionsSectionRenderer
                          ?.contents![index]
                          .searchSuggestionRenderer!
                          .navigationEndpoint!
                          .searchEndpoint
                          ?.query;
                      return ListTile(
                          onTap: () {
                            context.go('/songs', extra: dataRes);
                          },
                          title: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Icon(Icons.search),
                              Expanded(
                                child: Text(dataRes ?? '',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500)),
                              ),
                            ],
                          ));
                    },
                  ),
            error: (error, stack) => Center(
                  child: Column(
                    children: [
                      Flexible(
                        child: Text(
                            'Error loading data! ${kDebugMode ? error : null} \n ${kDebugMode ? stack : null}',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500)),
                      ),
                      TextButton(
                          onPressed: () => ref.read(searchDataReqProvider.notifier).reload(),
                          child: const Text('Retry'))
                    ],
                  ),
                ),
            loading: () => const Center(
                  child: CircularProgressIndicator(strokeWidth: 2),
                )));
  }
}
