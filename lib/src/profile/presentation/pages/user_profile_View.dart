import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import '../../../../core/configs/assets/app_image.dart';
import '../widgets/inapp_info_tile.dart';
import '../widgets/more_button.dart';

class UserProfileView extends StatefulWidget {
  const UserProfileView({super.key});

  @override
  State<UserProfileView> createState() => _UserProfileViewState();
}

class _UserProfileViewState extends State<UserProfileView> {
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
                            const LoactionRateTile(),
                            const SizedBox(height: 40),
                            const UserSocialInfo(),
                            const SizedBox(height: 40),
                            Material(
                                child:
                                    FollowBtn(title: "متابعة", onTap: () {})),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  // margin: EdgeInsets.symmetric(horizontal: 120),
                                  // padding: EdgeInsets.symmetric(vertical: 5),
                                  height: 46,
                                  width: 150,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "دردشة",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium,
                                      ),
                                      const SizedBox(width: 8),
                                      Icon(
                                        Icons.chat_outlined,
                                        color: Colors.white,
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  // margin: EdgeInsets.symmetric(horizontal: 120),
                                  // padding: EdgeInsets.symmetric(vertical: 5),
                                  height: 46,
                                  width: 150,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "دردشة",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium,
                                      ),
                                      const SizedBox(width: 8),
                                      Icon(
                                        Icons.chat_outlined,
                                        color: Colors.white,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
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

  //=====
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
                AssetImage("assets/images/Rectangle.png"),
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

  //=====
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

class FollowBtn extends StatelessWidget {
  const FollowBtn({
    super.key,
    required this.title,
    required this.onTap,
  });
  final String title;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 30),
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 40),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          gradient: const LinearGradient(colors: [
            Color(0XFF9EACB7),
            Color(0XFF90DA5F),
          ]),
        ),
        child: Center(
            child: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        )),
      ),
    );
  }
}

//=====
class UserSocialInfo extends StatelessWidget {
  const UserSocialInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ZoomInDown(
        // delay: Duration(milliseconds: 1000),
        duration: const Duration(milliseconds: 1000),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InappInfoTile(title: "المتابعين", value: "350", onTap: () {}),
            InappInfoTile(title: "يتابع", value: "150", onTap: () {}),
            InappInfoTile(title: "المبيعات", value: "50", onTap: () {}),
          ],
        ),
      ),
    );
  }
}

//=====
class LoactionRateTile extends StatelessWidget {
  const LoactionRateTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FadeInLeftBig(
            duration: const Duration(milliseconds: 1000),
            curve: Curves.linearToEaseOut,
            child: Row(
              children: [
                Text(
                  "9.5 تقييم",
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                Icon(
                  Icons.star,
                  color: Theme.of(context).primaryColor,
                ),
              ],
            ),
          ),
          FadeInRightBig(
            duration: const Duration(milliseconds: 1000),
            curve: Curves.linearToEaseOut,
            child: Row(
              children: [
                Text(
                  "سوريا - حمص",
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                Icon(
                  Icons.location_on,
                  color: Theme.of(context).primaryColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
