import 'package:flutter/material.dart';
import 'package:marabh/core/configs/theme/app_colors.dart';

class ProductCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      // height: size.height * 0.1,
      width: size.width * 0.44,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: size.height * 0.24,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/images/Rectangle.png'), // Replace with your image path
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Text(
                      'New',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Positioned(
                  top: 5,
                  right: 5,
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      // width: 35,
                      padding: const EdgeInsets.all(5),
                      // height: 35,
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(90)),
                      child: const Center(
                        child: Icon(
                          Icons.favorite_border,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  bottom: 23,
                  child: Container(
                    width: size.width * 0.5,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                      // Colors.white,
                      const Color(0xffF6921E).withOpacity(0),
                      const Color(0xffF6921E),
                    ], begin: Alignment.topCenter, end: Alignment.bottomRight)),
                    child: const Text(
                      'Homs',
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: AppColors.lightBackground),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    width: size.width * 0.5,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                      // Colors.white,
                      const Color(0xff72B745),
                      const Color(0xff72B745).withOpacity(0),
                    ], begin: Alignment.topCenter, end: Alignment.bottomRight)),
                    child: const Text(
                      ' iphone 16 ',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: AppColors.lightBackground),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          width: 60,
                          height: 24,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              color: const Color(0xff72B745),
                              borderRadius: BorderRadius.circular(4)),
                          child: const Center(
                            child: Text(
                              '30 قطعة', // Replace with your text
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
                            ),
                          ),
                        ),
                        Positioned(
                          left: -7,
                          top: 6,
                          child: Container(
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(100)),
                          ),
                        ),
                        Positioned(
                          right: -7,
                          top: 6,
                          child: Container(
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(100)),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          width: size.width * 0.13,
                          child: const Flexible(
                            child: Text(
                              'أغيد علوان', // Replace with your text
                              overflow: TextOverflow.ellipsis,
                              softWrap: true,
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                  overflow: TextOverflow.ellipsis),
                            ),
                          ),
                        ),
                        const Icon(Icons.person, color: Color(0xff72B745))
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 8),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'غير موجود',
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Colors.red),
                    ),
                    Row(
                      children: [
                        Text(
                          '10' + 'دقائق',
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(width: 4),
                        Icon(Icons.access_time, color: Color(0xff72B745)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
