part of 'router.dart';

final GoRouter router = GoRouter(
  debugLogDiagnostics: true,
  initialLocation: '/',
  routes: [
<<<<<<< HEAD
    // GoRoute(
    //   path: '/',
    //   name: 'splash',
    //   builder: (context, state) => SplashPage(),
    // ),
=======
    GoRoute(
      path: '/',
      name: 'splash',
      // builder: (context, state) => SplashPage(),
<<<<<<< HEAD
      builder: (context, state) => const HomePage(),
    ),
    //---
>>>>>>> origin/master2
=======
      builder: (context, state) =>const UserProfileView(),
    ),
    //---
>>>>>>> c92adb2aaad40f2799e81c394ce719ead3ad6726
    GoRoute(
      path: '/auth/phone',
      name: 'phone',
      builder: (
        context,
        state,
      ) {
        UserRequestEnity user = state.extra as UserRequestEnity;

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
      builder: (context, state) => ForgetPasswordPage(),
    ),
    //-----
    GoRoute(
      path: '/auth/verify-otp',
      name: 'verify-otp',
      builder: (context, state) => VerificationCodePage(
        parameter: state.extra as VerifyOtpParameter,
      ),
    ),
    //----
    GoRoute(
      path: '/auth/new-password',
      name: 'new-password',
      builder: (context, state) {
        return NewPasswordPage();
      },
    ),
<<<<<<< HEAD
<<<<<<< HEAD
    GoRoute(
      path: '/',
      name: 'chatsScreen',
      builder: (context, state) => AllChatPage(),
    ),
    GoRoute(
        path: '/messges',
        name: 'messageScreen',
        builder: (context, state) => BlocProvider(
              create: (context) => SocketBloc()..add(ConnectSocket()),
              child: MessagesScreen(
                id: state.extra as String,
              ),
            )),
=======
=======
>>>>>>> c92adb2aaad40f2799e81c394ce719ead3ad6726
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
<<<<<<< HEAD
    GoRoute(
      path: '/dealer_profile',
      name: 'dealer_profile',
      builder: (context, state) {
        return const DealerProfileView();
      },
    ),
    //---
>>>>>>> origin/master2
=======
    //---
>>>>>>> c92adb2aaad40f2799e81c394ce719ead3ad6726
  ],
);

class VerifyOtpParameter {
  String email;
  bool isForgetPassword;
  VerifyOtpParameter(this.email, this.isForgetPassword);
}
