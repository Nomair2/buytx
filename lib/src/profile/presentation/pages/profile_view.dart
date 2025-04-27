import 'package:flutter/material.dart';
import 'package:marabh/src/profile/presentation/pages/windows_tab.dart';

import '../../../../core/configs/assets/app_image.dart';
import '../../../home/widgets/profile_tab.dart';
import '../widgets/more_button.dart';
import 'user_info_tab.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  bool isClicked = true;
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: SingleChildScrollView(
        // physics: NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              width: width,
              height: height,
              child: Stack(
                children: [
                  _buildBg(height, width),
                  _header(height, context, () {}, () {}),
                  Positioned(
                    top: height / 3.5,
                    child: Container(
                      height: height,
                      width: width,
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.surface,
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(50),
                              topRight: Radius.circular(50))),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(height: height / 11),
                            //this is the status of this account
                            Text(
                              "متصل",
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w300,
                                decoration: TextDecoration.none,
                              ),
                            ),
                            //this is the name of the user
                            Text(
                              "أغيد علوان",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            const SizedBox(height: 8),
                            //this is the user tag
                            Text(
                              "@Aghiad _2Ex",
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            const SizedBox(height: 30),
                            Material(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  ProfileTabButton(
                                    title: "النوافذ",
                                    isActive: !isClicked,
                                    onpressed: () {
                                      setState(() {
                                        isClicked = !isClicked;
                                      });
                                    },
                                  ),
                                  ProfileTabButton(
                                    title: "معلوماتي",
                                    isActive: isClicked,
                                    onpressed: () {
                                      setState(() {
                                        isClicked = !isClicked;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 30),
                            //in this condition we display the user info
                            if (isClicked) const UserInfoTab(),

                            if (!isClicked) const WindowsTab(),
                          ],
                        ),
                      ),
                    ),
                  ),
                  //======image
                  _userImage(height, width),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Positioned _userImage(double height, double width) {
    return Positioned(
      top: height / 4.9,
      left: width / 2.9,
      child: Container(
        padding: const EdgeInsets.all(2),
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: const CircleAvatar(
          backgroundImage:
              //later we bring the image from the api
              AssetImage("assets/images/Rectangle.png"),
          radius: 70,
        ),
      ),
    );
  }

//======
  Positioned _header(double height, BuildContext context,
      Function() backFunction, Function() moreFunction) {
    return Positioned(
      top: height / 13,
      right: 10,
      left: 10,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: backFunction,
            icon: Icon(
              Icons.arrow_back,
              color: Theme.of(context).colorScheme.onSecondary,
              size: 30,
            ),
          ),
          MoreButton(
            colorIcon: Theme.of(context).colorScheme.primaryContainer,
            colors: Theme.of(context).colorScheme.onSecondary,
            icons: Icons.more_vert,
            onPressed: moreFunction,
            size: 22,
          ),
        ],
      ),
    );
  }

  //=========
  Positioned _buildBg(double height, double width) {
    return Positioned(
      child: SizedBox(
          height: height / 3,
          width: width,
          child: Image.asset(
            AppImage.profileBg,
            fit: BoxFit.fill,
          )),
    );
  }

//=======
}
