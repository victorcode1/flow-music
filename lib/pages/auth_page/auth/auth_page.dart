import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_ui_localizations/firebase_ui_localizations.dart';
import 'package:firebase_ui_oauth_apple/firebase_ui_oauth_apple.dart';
import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';
import 'package:flow_music/controller/main_controller.dart';
import 'package:flow_music/pages/auth_page/profile/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AuthPage extends ConsumerWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(mainController);
    // final buttonStyle = ButtonStyle(
    //   padding: WidgetStateProperty.all(const EdgeInsets.all(12)),
    //   shape: WidgetStateProperty.all(
    //     RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    //   ),
    // );

    return StreamBuilder<User?>(
        stream: controller.user,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // WidgetsBinding.instance.addPostFrameCallback(
            //     (_) => context.go(Rutas.profile.rootValue));
            return const ProfilePage();
          }
          // return switch (snapshot.data) {

          //   User(emailVerified: false, email: final String _) =>
          //     EmailVerificationScreen(
          //       headerBuilder: headerIcon(Icons.verified),
          //       sideBuilder: sideIcon(Icons.verified),
          //       actionCodeSettings: actionCodeSettings,
          //       actions: [
          //         EmailVerifiedAction(() {
          //           Navigator.pushReplacementNamed(context, '/profile');
          //         }),
          //         AuthCancelledAction((context) {
          //           FirebaseUIAuth.signOut(context: context);
          //           Navigator.pushReplacementNamed(context, '/');
          //         }),
          //       ],
          //     ),
          //   null => SignInScreen(
          //       actions: [
          //         ForgotPasswordAction((context, email) {
          //           Navigator.pushNamed(
          //             context,
          //             '/forgot-password',
          //             arguments: {'email': email},
          //           );
          //         }),
          //         VerifyPhoneAction((context, _) {
          //           Navigator.pushNamed(context, '/phone');
          //         }),
          //         AuthStateChangeAction((context, state) {
          //           final user = switch (state) {
          //             SignedIn(user: final user) => user,
          //             CredentialLinked(user: final user) => user,
          //             UserCreated(credential: final cred) => cred.user,
          //             _ => null,
          //           };

          //           switch (user) {
          //             case User(emailVerified: true):
          //               Navigator.pushReplacementNamed(context, '/profile');
          //             case User(emailVerified: false, email: final String _):
          //               Navigator.pushNamed(context, '/verify-email');
          //           }
          //         }),
          //         mfaAction,
          //         EmailLinkSignInAction((context) {
          //           Navigator.pushReplacementNamed(
          //               context, '/email-link-sign-in');
          //         }),
          //       ],
          //       styles: const {
          //         EmailFormStyle(signInButtonVariant: ButtonVariant.filled),
          //       },
          //       headerBuilder: headerImage(),
          //       sideBuilder: sideImage(),
          //       subtitleBuilder: (context, action) {
          //         final actionText = switch (action) {
          //           AuthAction.signIn => 'Please sign in to continue.',
          //           AuthAction.signUp => 'Please create an account to continue',
          //           _ => throw Exception('Invalid action: $action'),
          //         };

          //         return Padding(
          //           padding: const EdgeInsets.only(bottom: 8),
          //           child: Text('Welcome to Flow Music ! $actionText.'),
          //         );
          //       },
          //       footerBuilder: (context, action) {
          //         final actionText = switch (action) {
          //           AuthAction.signIn => 'signing in',
          //           AuthAction.signUp => 'registering',
          //           _ => throw Exception('Invalid action: $action'),
          //         };

          //         return Center(
          //           child: Padding(
          //             padding: const EdgeInsets.only(top: 16),
          //             child: Text(
          //               'By $actionText, you agree to our terms and conditions.',
          //               style: const TextStyle(color: Colors.grey),
          //             ),
          //           ),
          //         );
          //       },
          //     ),
          //   _ => ProfileScreen(
          //       actions: [
          //         SignedOutAction((context) {
          //           Navigator.pushReplacementNamed(context, '/');
          //         }),
          //         mfaAction,
          //       ],
          //       actionCodeSettings: actionCodeSettings,
          //       showMFATile: kIsWeb ||
          //           platform == TargetPlatform.iOS ||
          //           platform == TargetPlatform.android,
          //       showUnlinkConfirmationDialog: true,
          //       showDeleteConfirmationDialog: true,
          //     ),

          return SignInScreen(
              showAuthActionSwitch: false,
              sideBuilder: (context, constraints) {
                return const Padding(
                    padding: EdgeInsets.all(20),
                    child: AspectRatio(aspectRatio: 1, child: FlutterLogo()));
              },
              headerBuilder: (context, constraints, _) {
                return const Padding(
                    padding: EdgeInsets.all(20),
                    child: AspectRatio(aspectRatio: 1, child: FlutterLogo()));
              },
              providers: [
                EmailAuthProvider(),
                GoogleProvider(
                    iOSPreferPlist: true,
                    redirectUri: 'https://flow-music-1.web.app/__/auth/handler',
                    clientId:
                        'com.googleusercontent.apps.387031162675-9k2k34p0h19a0ldni8gj55b5u5j42lq0'),
                AppleProvider(),
              ]);
        }

        // MaterialApp(
        //   theme: ThemeData(
        //     brightness: Brightness.light,
        //     visualDensity: VisualDensity.standard,
        //     useMaterial3: true,
        //     inputDecorationTheme: const InputDecorationTheme(
        //       border: OutlineInputBorder(),
        //     ),
        //     elevatedButtonTheme: ElevatedButtonThemeData(style: buttonStyle),
        //     textButtonTheme: TextButtonThemeData(style: buttonStyle),
        //     outlinedButtonTheme: OutlinedButtonThemeData(style: buttonStyle),
        //   ),
        //   initialRoute: switch (snapshot.data) {
        //     User(emailVerified: false, email: final String _) =>
        //       '/verify-email',
        //     null => '/',
        //     _ => '/profile',
        //   },
        //   routes: {
        //     '/': (context) {
        //       return SignInScreen(
        //         actions: [
        //           ForgotPasswordAction((context, email) {
        //             Navigator.pushNamed(
        //               context,
        //               '/forgot-password',
        //               arguments: {'email': email},
        //             );
        //           }),
        //           VerifyPhoneAction((context, _) {
        //             Navigator.pushNamed(context, '/phone');
        //           }),
        //           AuthStateChangeAction((context, state) {
        //             final user = switch (state) {
        //               SignedIn(user: final user) => user,
        //               CredentialLinked(user: final user) => user,
        //               UserCreated(credential: final cred) => cred.user,
        //               _ => null,
        //             };

        //             switch (user) {
        //               case User(emailVerified: true):
        //                 Navigator.pushReplacementNamed(context, '/profile');
        //               case User(emailVerified: false, email: final String _):
        //                 Navigator.pushNamed(context, '/verify-email');
        //             }
        //           }),
        //           mfaAction,
        //           EmailLinkSignInAction((context) {
        //             Navigator.pushReplacementNamed(
        //                 context, '/email-link-sign-in');
        //           }),
        //         ],
        //         styles: const {
        //           EmailFormStyle(signInButtonVariant: ButtonVariant.filled),
        //         },
        //         headerBuilder: headerImage(),
        //         sideBuilder: sideImage(),
        //         subtitleBuilder: (context, action) {
        //           final actionText = switch (action) {
        //             AuthAction.signIn => 'Please sign in to continue.',
        //             AuthAction.signUp => 'Please create an account to continue',
        //             _ => throw Exception('Invalid action: $action'),
        //           };

        //           return Padding(
        //             padding: const EdgeInsets.only(bottom: 8),
        //             child: Text('Welcome to Flow Music ! $actionText.'),
        //           );
        //         },
        //         footerBuilder: (context, action) {
        //           final actionText = switch (action) {
        //             AuthAction.signIn => 'signing in',
        //             AuthAction.signUp => 'registering',
        //             _ => throw Exception('Invalid action: $action'),
        //           };

        //           return Center(
        //             child: Padding(
        //               padding: const EdgeInsets.only(top: 16),
        //               child: Text(
        //                 'By $actionText, you agree to our terms and conditions.',
        //                 style: const TextStyle(color: Colors.grey),
        //               ),
        //             ),
        //           );
        //         },
        //       );
        //     },
        //     '/verify-email': (context) {
        //       return EmailVerificationScreen(
        //         headerBuilder: headerIcon(Icons.verified),
        //         sideBuilder: sideIcon(Icons.verified),
        //         actionCodeSettings: actionCodeSettings,
        //         actions: [
        //           EmailVerifiedAction(() {
        //             Navigator.pushReplacementNamed(context, '/profile');
        //           }),
        //           AuthCancelledAction((context) {
        //             FirebaseUIAuth.signOut(context: context);
        //             Navigator.pushReplacementNamed(context, '/');
        //           }),
        //         ],
        //       );
        //     },
        //     '/phone': (context) {
        //       return PhoneInputScreen(
        //         actions: [
        //           SMSCodeRequestedAction((context, action, flowKey, phone) {
        //             Navigator.of(context).pushReplacementNamed(
        //               '/sms',
        //               arguments: {
        //                 'action': action,
        //                 'flowKey': flowKey,
        //                 'phone': phone,
        //               },
        //             );
        //           }),
        //         ],
        //         headerBuilder: headerIcon(Icons.phone),
        //         sideBuilder: sideIcon(Icons.phone),
        //       );
        //     },
        //     '/sms': (context) {
        //       final arguments = ModalRoute.of(context)?.settings.arguments
        //           as Map<String, dynamic>?;

        //       return SMSCodeInputScreen(
        //         actions: [
        //           AuthStateChangeAction<SignedIn>((context, state) {
        //             Navigator.of(context).pushReplacementNamed('/profile');
        //           })
        //         ],
        //         flowKey: arguments?['flowKey'],
        //         action: arguments?['action'],
        //         headerBuilder: headerIcon(Icons.sms_outlined),
        //         sideBuilder: sideIcon(Icons.sms_outlined),
        //       );
        //     },
        //     '/forgot-password': (context) {
        //       final arguments = ModalRoute.of(context)?.settings.arguments
        //           as Map<String, dynamic>?;

        //       return ForgotPasswordScreen(
        //         email: arguments?['email'],
        //         headerMaxExtent: 200,
        //         headerBuilder: headerIcon(Icons.lock),
        //         sideBuilder: sideIcon(Icons.lock),
        //       );
        //     },
        //     '/email-link-sign-in': (context) {
        //       return EmailLinkSignInScreen(
        //         actions: [
        //           AuthStateChangeAction<SignedIn>((context, state) {
        //             Navigator.pushReplacementNamed(context, '/');
        //           }),
        //         ],
        //         provider: emailLinkProviderConfig,
        //         headerMaxExtent: 200,
        //         headerBuilder: headerIcon(Icons.link),
        //         sideBuilder: sideIcon(Icons.link),
        //       );
        //     },
        //     '/profile': (context) {
        //       final platform = Theme.of(context).platform;

        //       return ProfileScreen(
        //         actions: [
        //           SignedOutAction((context) {
        //             Navigator.pushReplacementNamed(context, '/');
        //           }),
        //           mfaAction,
        //         ],
        //         actionCodeSettings: actionCodeSettings,
        //         showMFATile: kIsWeb ||
        //             platform == TargetPlatform.iOS ||
        //             platform == TargetPlatform.android,
        //         showUnlinkConfirmationDialog: true,
        //         showDeleteConfirmationDialog: true,
        //       );
        //     },
        //   },
        //   title: 'Firebase UI demo',
        //   debugShowCheckedModeBanner: false,
        //   supportedLocales: const [Locale('en')],
        //   localizationsDelegates: [
        //     FirebaseUILocalizations.withDefaultOverrides(
        //         const LabelOverrides()),
        //     GlobalMaterialLocalizations.delegate,
        //     GlobalWidgetsLocalizations.delegate,
        //     FirebaseUILocalizations.delegate,
        //   ],
        // );
        // if (snapshot.hasData) {
        //   WidgetsBinding.instance
        //       .addPostFrameCallback((_) => context.go(Rutas.profile.rootValue));
        // }
        // return SignInScreen(
        //     showAuthActionSwitch: false,
        //     sideBuilder: (context, constraints) {
        //       return const Padding(
        //           padding: EdgeInsets.all(20),
        //           child: AspectRatio(aspectRatio: 1, child: FlutterLogo()));
        //     },
        //     headerBuilder: (context, constraints, _) {
        //       return const Padding(
        //           padding: EdgeInsets.all(20),
        //           child: AspectRatio(aspectRatio: 1, child: FlutterLogo()));
        //     },
        //     providers: [EmailAuthProvider()]);

        );
  }
}

class LabelOverrides extends DefaultLocalizations {
  const LabelOverrides();

  @override
  String get emailInputLabel => 'Enter your email';
}
