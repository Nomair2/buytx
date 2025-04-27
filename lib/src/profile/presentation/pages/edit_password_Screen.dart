import 'package:flutter/material.dart';
import 'package:marabh/src/auth/presentation/widgets/auth_text_field.dart';

import '../../../../core/common/widgets/custom_primary_button.dart';
import '../../../../core/configs/assets/app_image.dart';

class EditPasswordScreen extends StatefulWidget {
  const EditPasswordScreen({super.key});

  @override
  State<EditPasswordScreen> createState() => _EditPasswordScreenState();
}

class _EditPasswordScreenState extends State<EditPasswordScreen> {
  final oldPass = TextEditingController();
  final newPass = TextEditingController();
  final confirmPass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 50),
                Text(
                  "تعديل كلمة السر",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 50),
                SizedBox(
                  child: Image.asset(AppImage.newPasswordImage),
                ),
                const SizedBox(height: 60),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: AuthTextField(
                    text: "Old Password",
                    controller: oldPass,
                    preIcon: Icon(
                      Icons.key,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: AuthTextField(
                    text: "New Password",
                    controller: newPass,
                    preIcon: Icon(
                      Icons.key,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: AuthTextField(
                    text: "Confirm Password",
                    controller: confirmPass,
                    preIcon: Icon(
                      Icons.key,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                CustomPrimaryButton(
                  text: "إنشاء نافذة",
                  color: Theme.of(context).primaryColor,
                  height: height / 18,
                  width: width / 1.1,
                  ontap: () {},
                ),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
