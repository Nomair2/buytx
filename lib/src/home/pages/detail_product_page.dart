// ignore_for_file: prefer_const_constructors

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icons_flutter/icons_flutter.dart';
import 'package:marabh/core/common/widgets/custom_choose_button.dart';
import 'package:marabh/core/common/widgets/product_card.dart';
import 'package:marabh/core/configs/theme/app_colors.dart';
import 'package:marabh/src/home/widgets/customCircularButton.dart';

class DetailProductPage extends StatelessWidget {
  const DetailProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 25, left: 19, right: 19),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _appBar(),
              SizedBox(
                height: size.height * 0.05,
              ),
              _info(context, size),
              SizedBox(
                height: size.height * 0.05,
              ),
              _images(size),
              SizedBox(
                height: size.height * 0.05,
              ),
              _description(context),
              SizedBox(
                height: size.height * 0.05,
              ),
              _comments(context, size),
              SizedBox(
                height: size.height * 0.08,
              ),
              _similar(size, context),
              SizedBox(
                height: size.height * 0.05,
              ),
              _connectButton(size, context),
              SizedBox(
                height: size.height * 0.05,
              ),
            ],
          ),
        ),
      ),
    );
  }

  _connectButton(Size size, BuildContext context) {
    return Container(
      width: size.width,
      padding: EdgeInsets.symmetric(horizontal: 20),
      height: 56,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30), color: Colors.black),
      child: Row(
        children: [
          CustomChooseButton(
            child: Row(
              children: [
                Text(
                  'تواصل',
                ),
                SizedBox(
                  width: 10,
                ),
                Image.asset('assets/icons/call.png'),
              ],
            ),
            color: Theme.of(context).primaryColor,
          ),
          Spacer(),
          Text(
            '1500\$',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
          )
        ],
      ),
    );
  }

  _info(BuildContext context, Size size) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            'لابتوب Asus',
            textDirection: TextDirection.rtl,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(
            height: size.height * 0.015,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "Homs",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Icon(
                Icons.location_pin,
                color: Theme.of(context).primaryColor,
              ),
              SizedBox(
                width: size.width * 0.05,
              ),
              Text('10' + 'دقائق',
                  textDirection: TextDirection.rtl,
                  style: Theme.of(context).textTheme.bodySmall),
              SizedBox(width: 4),
              Icon(Icons.access_time, color: Color(0xff72B745)),
            ],
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomChooseButton(
                // flex: 1,
                child: Text('سيارات'),
                color: Theme.of(context).primaryColor,
              ),
              SizedBox(
                width: size.width * 0.01,
              ),
              Text(
                '(9 تقييم)5.0',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              SizedBox(
                width: 5,
              ),
              Icon(
                Icons.star,
                color: Color(0xff72B745),
              ),
              SizedBox(
                width: size.width * 0.01,
              ),
              Container(
                width: size.width * 0.15,
                child: Flexible(
                  child: Text(
                    'أغيد علوان', // Replace with your text
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    textDirection: TextDirection.rtl,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                height: 49,
                width: 49,
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(60)),
                child: Icon(
                  Icons.person,
                  size: 30,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  _comments(BuildContext context, Size size) {
    return Container(
      width: size.width,
      //  height: size.height * 0.3,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).colorScheme.primaryContainer),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'التعليقات (2 تعليق)',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(CupertinoIcons.chat_bubble_2_fill)
              ],
            ),
            Padding(
              padding: EdgeInsets.only(right: 25, top: 10, bottom: 20),
              child: Column(
                children: List.generate(
                  2,
                  (index) => Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        padding:
                            EdgeInsets.symmetric(horizontal: 4, vertical: 5),
                        constraints:
                            BoxConstraints(minWidth: size.width * 0.35),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                                color:
                                    Theme.of(context).colorScheme.onSecondary)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "محمد الأحمد",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium!
                                  .copyWith(fontSize: 10),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 10),
                              child: Column(
                                children: [
                                  Text(
                                    "بالتوفيق",
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelMedium!
                                        .copyWith(fontSize: 10),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        'الرد',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium!
                                            .copyWith(fontSize: 8),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Icon(
                                        CupertinoIcons
                                            .arrowshape_turn_up_left_fill,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .inversePrimary,
                                        size: 10,
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5, top: 5),
                        child: CircleAvatar(
                          child: Image.asset('assets/static/Ellipse5.png'),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: 40,
              margin: EdgeInsets.only(left: 20, right: 5),
              padding: EdgeInsets.only(right: 20, top: 5, bottom: 5, left: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(
                      color: Theme.of(context).colorScheme.onSecondary)),
              child: Center(
                child: TextFormField(
                  textAlign: TextAlign.end,
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                      hintText: 'أكتب تعليقك هنا...',
                      hintStyle: TextStyle(
                          color: Color(0xff919296),
                          fontWeight: FontWeight.w400,
                          fontSize: 16),
                      border: InputBorder.none,
                      prefixIcon: Image.asset('assets/icons/sent_message.png')),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _similar(Size size, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          'العروض المشابهة',
          style: Theme.of(context).textTheme.labelMedium,
        ),
        SizedBox(
          height: size.height * 0.05,
        ),
        Container(
            height: size.height,
            width: size.width,
            child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
    );
  }

  _images(
    Size size,
  ) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: size.height * 0.6,
              width: size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        'assets/static/Rectangle20.png',
                      ))),
            ),
            Positioned(
              top: size.height * 0.03,
              right: size.width * 0.05,
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  // width: 35,
                  padding: EdgeInsets.all(5),
                  // height: 35,
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(90)),
                  child: Center(
                    child: Icon(
                      Icons.favorite,
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: size.height * 0.02,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            children: List.generate(
              4,
              (index) {
                return Expanded(
                    child: index != 0
                        ? Container(
                            height: size.height * 0.18,
                            width: size.width * 0.25,
                            margin: EdgeInsets.symmetric(horizontal: 4),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                        'assets/static/Rectangle20.png'))),
                          )
                        : Stack(
                            children: [
                              Container(
                                height: size.height * 0.18,
                                width: size.width * 0.25,
                                margin: EdgeInsets.symmetric(horizontal: 4),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    // color: Colors.black.,
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        colorFilter: ColorFilter.mode(
                                            Colors.black.withOpacity(0.6),
                                            BlendMode.darken),
                                        image: AssetImage(
                                            'assets/static/Rectangle20.png'))),
                                child: Center(
                                  child: Text('+5'),
                                ),
                              ),
                            ],
                          ));
              },
            ),
          ),
        )
      ],
    );
  }

  _description(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'وصف عن المنتج',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            SizedBox(
              width: 10,
            ),
            Icon(Icons.api_sharp),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                'المعالج: core i7v10',
                textDirection: TextDirection.rtl,
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      fontSize: 14,
                    ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'الرامات: 16GB',
                textDirection: TextDirection.rtl,
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      fontSize: 14,
                    ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'الكرت الخارجي: Nvidia GTX 1650TI',
                textDirection: TextDirection.rtl,
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      fontSize: 14,
                    ),
              ),
            ],
          ),
        )
      ],
    );
  }

  _appBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomSmallButton(
          colorIcon: Colors.black,
          colors: Colors.white,
          icons: CupertinoIcons.back,
          onPressed: () {},
          size: 30,
        ),
        CustomSmallButton(
          colorIcon: Colors.black,
          colors: Colors.white,
          icons: FluentIcons.edit_12_filled,
          onPressed: () {},
          size: 30,
        ),
      ],
    );
  }
}
