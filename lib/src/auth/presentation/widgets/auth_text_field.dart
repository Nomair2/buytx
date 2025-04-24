import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  bool? scure;
  final String text;
  final TextEditingController controller;
  Widget? preIcon;
  Widget? sufIcon;
  String? Function(String?)? validtor;
  AuthTextField(
      {super.key,
      // required this.size,
      required this.text,
      required this.controller,
      this.scure,
      this.validtor,
      this.preIcon,
      this.sufIcon});

  OutlineInputBorder _inputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(30),
    borderSide: BorderSide(color: Colors.green, width: 2),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.circular(18),
      //   boxShadow: [
      //     BoxShadow(
      //       blurRadius: 3,
      //       offset: Offset(0, 5),
      //       spreadRadius: -1,
      //       color: Colors.black.withOpacity(0.2),
      //     ),
      //   ],
      // ),
      child: TextFormField(
        obscureText: scure ?? false,
        controller: controller,
        cursorColor: Color(0xff919296),
        validator: validtor,
        keyboardType: TextInputType.emailAddress,
        style: TextStyle(
            color: Color(0xff919296),
            fontWeight: FontWeight.w400,
            fontSize: 16),
        decoration: InputDecoration(
          hintText: text,
          hintStyle: TextStyle(
              color: Color(0xff919296),
              fontWeight: FontWeight.w400,
              fontSize: 16),
          errorStyle: TextStyle(
            color: Colors.redAccent,
            fontSize: 11,
            fontWeight: FontWeight.w400,
          ),
          prefixIcon: preIcon,
          suffixIcon: sufIcon,
          hintMaxLines: 1,
          contentPadding: EdgeInsets.only(left: 14, top: 0, bottom: 0),
          filled: true,
          fillColor: Theme.of(context).colorScheme.onBackground,
          border: _inputBorder,
          // enabledBorder: _inputBorder,
          focusedBorder: _inputBorder,
        ),
      ),
    );
  }
}

      // width: size.width,
      // width: double.infinity,
      // height: 36,
      // decoration: BoxDecoration(
      //     boxShadow: [
      //       BoxShadow(
      //         blurRadius: 2,
      //         offset: Offset(0, 6),
      //         spreadRadius: -1,
      //         color: Colors.black.withOpacity(0.2),
      //       ),
      //     ],
      //     color: Theme.of(context).colorScheme.onBackground,
      //     border: Border.all(color: Color(0xff72B745), width: 1),
      //     borderRadius: BorderRadius.circular(18)),