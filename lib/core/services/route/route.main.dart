part of 'router.dart';

final GoRouter router = GoRouter(
  debugLogDiagnostics: true,
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'splash',
      // builder: (context, state) => SplashPage(),
      builder: (context, state) =>const UserProfileView(),
    ),
    //---
    GoRoute(
      path: '/auth/phone',
      name: 'phone',
      builder: (
        context,
        state,
      ) {
        UserEnity user = state.extra as UserEnity;

        return PhonePage(user);
      },
    ),
    //----
    GoRoute(
      path: '/auth/login',
      name: 'login',
      builder: (context, state) => LoginPage(),
    ),
    //----
    GoRoute(
      path: '/auth/signup',
      name: 'register',
      builder: (context, state) => SignupPage(),
    ),
    //-----
    GoRoute(
      path: '/auth/forgot-password',
      name: 'forgot-password',
      builder: (context, state) => const ForgetPasswordPage(),
    ),
    //-----
    GoRoute(
      path: '/auth/verify-otp',
      name: 'verify-otp',
      builder: (context, state) =>
          VerificationCodePage(email: state.extra as String),
    ),
    //----
    GoRoute(
      // path: '/auth/reset-password/:token',
      path: '/auth/new-password',
      name: 'new-password',
      builder: (context, state) {
        // final token = state.pathParameters['token']!;
        // return ResetPasswordPage(token: token);
        return NewPasswordPage();
      },
    ),
    //----
    // GoRoute(
    //   path: '/profile',
    //   name: "profile",
    //   builder: (context, state) => const ProfileView(),
    // ),
    //-----
    // GoRoute(
    //   path: '/user_info_tab',
    //   name: "user_info_tab",
    //   builder: (context, state) => const UserInfoTab(),
    // ),
    GoRoute(
      path: '/create_window',
      name: 'create_window',
      builder: (context, state) {
        // final token = state.pathParameters['token']!;
        // return ResetPasswordPage(token: token);
        return const CreateWindow();
      },
    ),
    //---
    GoRoute(
      path: '/edit_password',
      name: 'edit_password',
      builder: (context, state) {
        return const EditPasswordScreen();
      },
    ),
    //---
    GoRoute(
      path: '/follwer_page',
      name: 'follwer_page',
      builder: (context, state) {
        return const FollowersPage();
      },
    ),
    //---
  ],
);


// final router =
//     GoRouter(debugLogDiagnostics: true, initialLocation: '/', routes: [
//   GoRoute(
//     path: '/',
// redirect: (context, state) {
//   final cacheHelper = sl<CacheHelper>()
//     ..getSessionToken()
//     ..getUserId();
//   // isn't the first time but he log out
//   if ((Cache.instance.sessionToken == null ||
//           Cache.instance.idUser == null) &&
//       !cacheHelper.isFirstTime()) {
//     return LoginPage.path;
//   }
//   if (state.extra == 'home') return HomePage.path;
//   return null;
// },
// builder: (context, state) => SignupPage(),
// builder: (context, state) {
//   final cacheHelper = sl<CacheHelper>()
//     ..getSessionToken()
//     ..getUserId();
//   if (cacheHelper.isFirstTime()) {
//     return const SplashPage();
//   }
//   return const SplashPage();
// },
//   )
// ]);
