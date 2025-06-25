import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/common/widgets/custom_primary_button.dart';
import '../../../../core/common/widgets/custom_text_field.dart';
import '../../../../core/configs/assets/app_image.dart';
import '../widgets/more_button.dart';

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
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: height / 2.6,
            // stretch: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  _buildBg(height, width),
                  //-----
                  _header(height, context, () {}, () {}),
                  _userImage(height, width),
                ],
              ),
            ),
          ),
          //=====
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                //this is the status of this account
                ZoomInDown(
                  duration: const Duration(milliseconds: 850),
                  child: Center(
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
                ),
                //this is the name of the user
                ZoomInDown(
                  duration: const Duration(milliseconds: 900),
                  child: Center(
                    child: Text(
                      "أغيد علوان",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                //this is the user tag
                ZoomInDown(
                  duration: const Duration(milliseconds: 950),
                  child: Center(
                    child: Text(
                      "@Aghiad _2Ex",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                ZoomInDown(
                  duration: const Duration(milliseconds: 1000),
                  child: Text(
                    "يمكنك إنشاءنوافذ خاصة بك التي ستعرف عن خدماتك و متجرك",
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 30),
                SlideInRight(
                  curve: Curves.easeInOut,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 25),
                    child: Text(
                      "اسم النافذة",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SlideInRight(
                  curve: Curves.easeInOut,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Material(
                      child: CustomTextField(
                        windowController: windowController,
                        title: "مثال عن المتجر",
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                SlideInRight(
                  curve: Curves.easeInOut,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 25),
                    child: Text(
                      "محتوى النافذة",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                SlideInRight(
                  curve: Curves.easeInOut,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Material(
                      child: CustomTextFieldArea(
                          hint: "اكتب تفاصيل النافذة",
                          windowController: windowContentController),
                    ),
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
          )
        ],
      ),
    );
  }

  Positioned _userImage(double height, double width) {
    return Positioned(
      top: height / 4.9,
      left: width / 2.9,
      child: ZoomInDown(
        duration: const Duration(milliseconds: 800),
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
      top: height / 15,
      right: 10,
      left: 10,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // FadeInLeft(
          //   duration: const Duration(milliseconds: 800),
          //   curve: Curves.linearToEaseOut,
          //   child: IconButton(
          //     onPressed: backFunction,
          //     icon: Icon(
          //       Icons.arrow_back,
          //       color: Theme.of(context).colorScheme.onSecondary,
          //       size: 30,
          //     ),
          //   ),
          // ),
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

//======
class CustomTextFieldArea extends StatelessWidget {
  const CustomTextFieldArea({
    super.key,
    required this.windowController,
    required this.hint,
  });

  final TextEditingController windowController;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: windowController,
      style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
      // maxLength: 4,
      maxLines: 6,
      decoration: InputDecoration(
        hintText: hint,
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
