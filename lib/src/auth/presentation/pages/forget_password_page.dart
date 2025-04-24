import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:marabh/core/common/widgets/custom_primary_button.dart';
import 'package:marabh/core/common/widgets/custom_second_button.dart';
import 'package:marabh/core/configs/assets/app_image.dart';
import 'package:marabh/core/error/show_error.dart';
import 'package:marabh/src/auth/domain/usercase/validator/signup_validator.dart';
import 'package:marabh/src/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:marabh/src/auth/presentation/bloc/auth/auth_event.dart';
import 'package:marabh/src/auth/presentation/bloc/auth/auth_state.dart';
import 'package:marabh/src/auth/presentation/widgets/auth_text_field.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({super.key});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  late TextEditingController email;

  GlobalKey<FormState> _keyPassword = GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    email = TextEditingController();
  }

  @override
  void dispose() {
    email.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 42.81),
          child: Form(
            key: _keyPassword,
            child: Column(
              children: [
                SizedBox(height: size.height * 0.1),
                _buildTitle(context),
                SizedBox(height: size.height * 0.01),
                _buildImage(),
                // SizedBox(height: size.height * 0.04),
                // _emailField(size, context),
                SizedBox(height: size.height * 0.015),
                _interEmail(context, 'أدخل البريد الإلكتروني'),
                SizedBox(height: size.height * 0.04),
                AuthTextField(
                    controller: email,
                    text: 'Enter Your Email Address',
                    validtor: (value) => SignupValidator.validateEmail(value),
                    preIcon: Icon(
                      Icons.email,
                      color: Theme.of(context).primaryColor,
                    )),
                SizedBox(height: size.height * 0.025),
                _text(context, 'العودة إلى تسجيل الدخول'),
                SizedBox(height: size.height * 0.05),
                BlocConsumer<AuthBloc, AuthState>(
                  builder: (context, state) {
                    print("we started ");
                    if (state is AuthLoading) {
                      print("we loading ");
                      return CustomPrimaryButton(
                        ontap: () {},
                        color: Theme.of(context).primaryColor,
                        height: 39.23431396484375,
                        width: size.width,
                        text: '',
                      );
                    }
                    return CustomPrimaryButton(
                      ontap: () {
                        if (_keyPassword.currentState!.validate()) {
                          context
                              .read<AuthBloc>()
                              .add(AuthVerifyAccountEvent(email.text));
                        }
                      },
                      color: Theme.of(context).primaryColor,
                      height: 39.23431396484375,
                      width: size.width,
                      text: 'التالي',
                    );
                  },
                  listener: (context, state) {
                    if (state is AuthError) {
                      context.read<AuthBloc>().add(AuthInitEvent());
                      showError(state.message);
                    } else if (state is AuthSuccess) {
                      context.goNamed('verify-otp', extra: email.text);
                    }
                  },
                ),
                // CustomPrimaryButton(
                //   ontap: () {
                //     print("1");
                //     if (key.currentState!.validate()) {
                //       print("2");
                //       context.pushNamed('verify-otp', extra: email.text);
                //     }
                //     print("3");
                //   },
                //   color: Theme.of(context).primaryColor,
                //   height: 39.23431396484375,
                //   width: size.width,
                //   text: 'التالي',
                // ),
                SizedBox(height: size.height * 0.02),
                _haveAccount(context),
                SizedBox(height: size.height * 0.04),
                SizedBox(height: size.height * 0.02),
                // CustomPrimaryButton(
                //   color: Theme.of(context).colorScheme.primaryContainer,
                //   width: 226,
                //   height: 40,
                //   text: 'Google تسجيل باستخدام ',
                // ),
                SizedBox(height: size.height * 0.03),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildTitle(context) {
    return Text('نسيت كلمة المرور',
        style: Theme.of(context).textTheme.titleLarge);
  }

  _buildImage() {
    return Image.asset(AppImage.forgetPasswordImage);
  }

  Widget _interEmail(context, text) {
    return Text(text,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 14,
            fontWeight: FontWeight.w600));
  }

  Widget _text(context, text) {
    return GestureDetector(
      onTap: () => GoRouter.of(context).go('/auth/login'),
      child: Text(text,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 14,
              fontWeight: FontWeight.w600)),
    );
  }

  Widget _haveAccount(context) {
    return GestureDetector(
      onTap: () => GoRouter.of(context).go('/auth/signup'),
      child: Text('ليس لديك حساب؟',
          textAlign: TextAlign.left,
          style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 14,
              fontWeight: FontWeight.w600)),
    );
  }
}
