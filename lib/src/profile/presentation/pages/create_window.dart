import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/common/widgets/custom_primary_button.dart';
import '../../../../core/configs/assets/app_image.dart';
import '../../../../core/configs/theme/app_text.dart';
import '../../../home/widgets/customCircularButton.dart';
import '../../../home/widgets/profile_tab.dart';
import '../widgets/inapp_info_tile.dart';
import '../widgets/more_button.dart';
import 'user_info_tab.dart';

class CreateWindow extends StatefulWidget {
  const CreateWindow({super.key});

  @override
  State<CreateWindow> createState() => _CreateWindowState();
}

class _CreateWindowState extends State<CreateWindow> {
  bool isClicked = true;
  final windowController = TextEditingController();
  final windowContentController = TextEditingController();
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
                  _header(height, context, () {
                    GoRouter.of(context).pop();
                  }, () {}),
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
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            SizedBox(height: height / 11),
                            //this is the status of this account
                            Center(
                              child: Text(
                                "متصل",
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w300,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ),
                            //this is the name of the user
                            Center(
                              child: Text(
                                "أغيد علوان",
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ),
                            const SizedBox(height: 8),
                            //this is the user tag
                            Center(
                              child: Text(
                                "@Aghiad _2Ex",
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                            ),
                            const SizedBox(height: 30),
                            Text(
                              "يمكنك إنشاءنوافذ خاصة بك التي ستعرف عن خدماتك و متجرك",
                              style: Theme.of(context).textTheme.bodyLarge,
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 30),
                            Padding(
                              padding: const EdgeInsets.only(right: 25),
                              child: Text(
                                "اسم النافذة",
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ),
                            const SizedBox(height: 20),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              child: Material(
                                child: CustomTextField(
                                    windowController: windowController),
                              ),
                            ),
                            const SizedBox(height: 30),
                            Padding(
                              padding: const EdgeInsets.only(right: 25),
                              child: Text(
                                "محتوى النافذة",
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ),
                            const SizedBox(height: 20),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              child: Material(
                                child: CustomTextFieldArea(
                                    windowController: windowContentController),
                              ),
                            ),
                            const SizedBox(height: 30),
                            Center(
                              child: CustomPrimaryButton(
                                text: "إنشاء نافذة",
                                color: Theme.of(context).primaryColor,
                                height: height / 18,
                                width: width / 1.1,
                                ontap: () {},
                              ),
                            ),
                            const SizedBox(height: 400),
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

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.windowController,
  });

  final TextEditingController windowController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: windowController,
      decoration: InputDecoration(
        hintText: "مثال عن المتجر",
        hintStyle: Theme.of(context).textTheme.bodySmall,
        hintTextDirection: TextDirection.rtl,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide:
              BorderSide(color: Theme.of(context).colorScheme.onSecondary),
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.onSecondary,
            )),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.onSecondary,
            )),
      ),
    );
  }
}

//======
class CustomTextFieldArea extends StatelessWidget {
  const CustomTextFieldArea({
    super.key,
    required this.windowController,
  });

  final TextEditingController windowController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: windowController,
      // maxLength: 4,
      maxLines: 6,
      decoration: InputDecoration(
        hintText: "اكتب تفاصيل النافذة",
        hintStyle: Theme.of(context).textTheme.bodySmall,
        hintTextDirection: TextDirection.rtl,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide:
              BorderSide(color: Theme.of(context).colorScheme.onSecondary),
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.onSecondary,
            )),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.onSecondary,
            )),
      ),
    );
  }
}
