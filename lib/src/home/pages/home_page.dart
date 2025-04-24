import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marabh/core/common/widgets/custom_choose_button.dart';
import 'package:marabh/core/common/widgets/product_card.dart';
import 'package:marabh/core/configs/theme/app_colors.dart';
import 'package:marabh/src/home/widgets/bottom_nav_bar.dart';
import 'package:marabh/src/home/widgets/customCircularButton.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const path = '/home';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: size.height,
          width: size.width,
          padding: EdgeInsets.only(
              top: size.height * 0.01, bottom: 15, left: 20, right: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      _header(context),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      _searching(context),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      _categories(context, size),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      _seeAll(context),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Container(
                          height: size.height * 0.61,
                          width: size.width,
                          child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 10,
                                    childAspectRatio: 0.6),
                            itemCount: 4,
                            itemBuilder: (context, index) {
                              return ProductCard();
                            },
                          )),
                    ],
                  ),
                ),
                const BottomNavBar()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _seeAll(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CustomSmallButton(
                icons: Icons.keyboard_double_arrow_left_rounded,
                onPressed: () {},
                colorIcon: Colors.black,
                colors: Colors.white,
                size: 20),
            const SizedBox(
              width: 5,
            ),
            Text(
              'رؤية الكل',
              style: Theme.of(context).textTheme.bodySmall,
            )
          ],
        ),
        Text(
          'الأحدث',
          style: Theme.of(context).textTheme.labelMedium,
        )
      ],
    );
  }

  Widget _categories(BuildContext context, Size size) {
    List<String> items = ["عقارات للبيع", 'عقارات للأجار'];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 2,
          child: CustomChooseButton(
            // flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PopupMenuButton(
                  icon: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                  itemBuilder: (context) => items.map((String item) {
                    return PopupMenuItem<String>(
                      value: item,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(item),
                        ],
                      ),
                    );
                  }).toList(),
                ),
                const Text('عقارات')
              ],
            ),
            color: AppColors.backgroundCategories,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          flex: 1,
          child: const CustomChooseButton(
            // flex: 1,
            child: Text('سيارات'),
            color: AppColors.backgroundCategories,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          flex: 1,
          child: const CustomChooseButton(
            // flex: 1,
            child: Text('هواتف'),
            color: AppColors.backgroundCategories,
          ),
        ),
      ],
    );
  }

  Widget _searching(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            // width: size.width,
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 2,
                    offset: const Offset(0, 6),
                    spreadRadius: -1,
                    color: Colors.black.withOpacity(0.2),
                  ),
                ],
                color: Theme.of(context).colorScheme.onSecondary,
                borderRadius: BorderRadius.circular(18)),
            child: TextFormField(
              // validator: validate,
              controller: TextEditingController(),
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.end,
              decoration: const InputDecoration(
                hintText: "أبحث في مرابح",
                hintStyle: TextStyle(
                    color: Color(0xff919296),
                    fontWeight: FontWeight.w400,
                    fontSize: 16),
                border: InputBorder.none,
                suffixIcon: Icon(
                  // Ionicons.ios_search,
                  CupertinoIcons.arrow_2_squarepath,
                  color: Color(0xff919296),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        CustomSmallButton(
          colorIcon: Colors.grey,
          colors: Theme.of(context).colorScheme.onSecondary,
          icons: Icons.flip_camera_android_rounded,
          onPressed: () {},
          radius: 8,
          size: 30,
        ),
      ],
    );
  }

  Widget _header(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomSmallButton(
          colorIcon: Colors.black,
          colors: Colors.white,
          icons: Icons.notifications_outlined,
          onPressed: () {},
          size: 30,
        ),
        Row(
          children: [
            Icon(
              Icons.location_pin,
              color: Theme.of(context).primaryColor,
            ),
            DropdownButton(
                underline: const SizedBox(),
                icon: Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
                items: [
                  DropdownMenuItem(
                      child: Text(
                    "Homs",
                    style: Theme.of(context).textTheme.bodySmall,
                  ))
                ],
                onChanged: (value) {})
          ],
        ),
        CustomSmallButton(
          colorIcon: Colors.black,
          colors: Colors.white,
          icons: CupertinoIcons.line_horizontal_3_decrease,
          onPressed: () {},
          size: 30,
        ),
      ],
    );
  }
}

// -----------------------------------------------------------------------------

// -----------------------------------------------------------------------------

class CustomPainterTape extends CustomPainter {
  final double width;
  final Color color;
  final String direction;

  CustomPainterTape({
    required this.width,
    required this.color,
    required this.direction,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = width
      ..color = color;

    Offset startOffset = Offset(width / 2, 0);
    Offset endOffset = Offset(0, 0);

    // switch (direction) {
    //   case 'right':
    //     startOffset = Offset(size.width - width / 2, 0);
    //     endOffset = Offset(size.width, 0);
    //     break;
    //   case 'left':
    //     startOffset = Offset(width / 2, 0);
    //     endOffset = Offset(0, 0);
    //     break;
    // }

    canvas.drawLine(startOffset, endOffset, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class RibbonClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width * 0.2, 0);
    path.lineTo(size.width * 0.3, size.height * 0.2);
    path.lineTo(size.width * 0.8, size.height * 0.2);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
