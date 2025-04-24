import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marabh/core/configs/theme/app_colors.dart';

class CustomChooseButton extends StatelessWidget {
  final Widget child;
  final Color color;
  // final int flex;
  const CustomChooseButton({
    super.key,
    required this.child,
    required this.color,
    // required this.flex
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 36,
      constraints: BoxConstraints(minWidth: 155),
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(16)),
      child: Center(
        child: child,
      ),
    );
  }
}
