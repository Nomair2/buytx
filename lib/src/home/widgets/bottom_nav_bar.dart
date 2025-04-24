import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height * 0.09,
      child: Stack(
        children: [
          Container(
            height: size.height * 0.06,
            margin: EdgeInsets.only(top: 25),
            decoration: BoxDecoration(
                color: Colors.black, borderRadius: BorderRadius.circular(30)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(
                  Icons.email_outlined,
                  size: 28,
                ),
                Icon(
                  Icons.notifications_outlined,
                  size: 28,
                ),
                Container(
                  width: 30,
                ),
                Icon(
                  Icons.favorite_border_outlined,
                  size: 28,
                ),
                Icon(
                  FluentIcons.home_32_regular,
                  size: 28,
                ),
              ],
            ),
          ),
          Center(
            // left: size.width * 0.4,
            child: Container(
              height: size.height * 0.07,
              width: size.width * 0.14,
              margin: EdgeInsets.only(bottom: 15),
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(60)),
              child: Icon(
                Icons.add,
                size: 40,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
