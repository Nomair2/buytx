part of 'router.dart';

final GoRouter router = GoRouter(
  debugLogDiagnostics: true,
  initialLocation: '/',
  routes: [
    // GoRoute(
    //   path: '/',
    //   name: 'splash',
    //   builder: (context, state) => SplashPage(),
    // ),
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
    GoRoute(
      path: '/auth/login',
      name: 'login',
      builder: (context, state) => LoginPage(),
    ),
    GoRoute(
      path: '/auth/signup',
      name: 'register',
      builder: (context, state) => SignupPage(),
    ),
    GoRoute(
      path: '/auth/forgot-password',
      name: 'forgot-password',
      builder: (context, state) => ForgetPasswordPage(),
    ),
    GoRoute(
      path: '/auth/verify-otp',
      name: 'verify-otp',
      builder: (context, state) => VerificationCodePage(
        parameter: state.extra as VerifyOtpParameter,
      ),
    ),
    GoRoute(
      path: '/auth/new-password',
      name: 'new-password',
      builder: (context, state) {
        return NewPasswordPage();
      },
    ),
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
  ],
);

class VerifyOtpParameter {
  String email;
  bool isForgetPassword;
  VerifyOtpParameter(this.email, this.isForgetPassword);
}
