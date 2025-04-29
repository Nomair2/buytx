import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:marabh/src/profile/presentation/pages/windows_tab.dart';

import '../../../../core/configs/assets/app_image.dart';
import '../widgets/profile_tab.dart';
import '../widgets/more_button.dart';
import 'dealer_info_tab.dart';

class DealerProfileView extends StatefulWidget {
  const DealerProfileView({super.key});

  @override
  State<DealerProfileView> createState() => _DealerProfileViewState();
}

class _DealerProfileViewState extends State<DealerProfileView> {
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
                            ZoomInDown(
                              duration: const Duration(milliseconds: 750),
                              child: Text(
                                "متصل",
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ),
                            //this is the name of the user
                            ZoomInDown(
                              duration: const Duration(milliseconds: 800),
                              child: Text(
                                "أغيد علوان",
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ),
                            const SizedBox(height: 8),
                            //this is the user tag
                            ZoomInDown(
                              delay: const Duration(milliseconds: 850),
                              child: Text(
                                "@Aghiad _2Ex",
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                            ),
                            const SizedBox(height: 30),
                            Material(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  FadeInLeftBig(
                                    duration: const Duration(milliseconds: 900),
                                    curve: Curves.linearToEaseOut,
                                    child: ProfileTabButton(
                                      title: "النوافذ",
                                      isActive: !isClicked,
                                      onpressed: () {
                                        setState(() {
                                          isClicked = !isClicked;
                                        });
                                      },
                                    ),
                                  ),
                                  FadeInRightBig(
                                    duration: const Duration(milliseconds: 900),
                                    curve: Curves.linearToEaseOut,
                                    child: ProfileTabButton(
                                      title: "معلوماتي",
                                      isActive: isClicked,
                                      onpressed: () {
                                        setState(() {
                                          isClicked = !isClicked;
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 30),
                            //in this condition we display the user info
                            if (isClicked) const DealerInfoTab(),

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
      child: ZoomInDown(
        duration: const Duration(milliseconds: 700),
        child: Container(
          padding: const EdgeInsets.all(2),
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: const CircleAvatar(
            backgroundImage:
                //later we bring the image from the api
                AssetImage("assets/images/person.png"),
            radius: 70,
          ),
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
          FadeInLeft(
            duration: const Duration(milliseconds: 800),
            curve: Curves.linearToEaseOut,
            child: IconButton(
              onPressed: backFunction,
              icon: Icon(
                Icons.arrow_back,
                color: Theme.of(context).colorScheme.onSecondary,
                size: 30,
              ),
            ),
          ),
          FadeInRight(
            duration: const Duration(milliseconds: 800),
            curve: Curves.linearToEaseOut,
            child: MoreButton(
              colorIcon: Theme.of(context).colorScheme.primaryContainer,
              colors: Theme.of(context).colorScheme.onSecondary,
              icons: Icons.more_vert,
              onPressed: moreFunction,
              size: 22,
            ),
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
