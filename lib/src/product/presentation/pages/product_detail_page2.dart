import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/common/widgets/custom_primary_button.dart';
import '../../../../core/common/widgets/custom_text_field.dart';
import '../../../auth/presentation/widgets/auth_text_field.dart';
import '../../../profile/presentation/pages/create_window.dart';

class ProductDetailPage2 extends StatefulWidget {
  const ProductDetailPage2({super.key});

  @override
  State<ProductDetailPage2> createState() => _ProductDetailPage2State();
}

class _ProductDetailPage2State extends State<ProductDetailPage2> {
  List<String> cities = ['حمص', "حماة", "الشام", "حلب"];
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_forward),
            color: theme.inversePrimary,
            onPressed: () {},
          ),
        ],
      ),
      backgroundColor: theme.surface,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const SizedBox(height: 30),

                Text(
                  "اسم المنتج",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: 15),
                CustomTextField(
                  title: "",
                  windowController: TextEditingController(),
                ),
                const SizedBox(height: 40),
                //THIS DROPDOWN MENU FOR PRODUCT TYPES (PHONES , CLOTHS ETC)
                Container(
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(color: theme.inversePrimary)),
                  width: width * 0.9,
                  height: 50,
                  child: Center(
                    child: DropdownButton<String>(
                      borderRadius: BorderRadius.circular(25),
                      hint: Text(
                        "نوع المنتج",
                        style: Theme.of(context).textTheme.bodySmall,
                        //  TextStyle(color: theme.inversePrimary),
                      ),
                      items: cities.map((category) {
                        return DropdownMenuItem<String>(
                          value: category,
                          child: Text(
                            category,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        );
                      }).toList(),
                      isExpanded: true,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      underline: const Text(
                        "",
                        style: TextStyle(color: Colors.black),
                      ),
                      onChanged: (String? val) {
                        if (val != null) {}
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                //THIS DROPDOWN WILL HAS BRANDS DEPENDING ON PRODUCT TYPE
                Container(
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(color: theme.inversePrimary)),
                  width: width * 0.9,
                  height: 50,
                  child: Center(
                    child: DropdownButton<String>(
                      borderRadius: BorderRadius.circular(25),
                      hint: Text(
                        "Samsung",
                        style: Theme.of(context).textTheme.bodySmall,
                        //  TextStyle(color: theme.inversePrimary),
                      ),
                      items: cities.map((category) {
                        return DropdownMenuItem<String>(
                          value: category,
                          child: Text(
                            category,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        );
                      }).toList(),
                      isExpanded: true,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      underline: const Text(
                        "",
                        style: TextStyle(color: Colors.black),
                      ),
                      onChanged: (String? val) {
                        if (val != null) {}
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(color: theme.inversePrimary)),
                  width: width * 0.9,
                  height: 50,
                  child: Center(
                    child: DropdownButton<String>(
                      borderRadius: BorderRadius.circular(25),
                      hint: Text(
                        "S فئة",
                        style: Theme.of(context).textTheme.bodySmall,
                        //  TextStyle(color: theme.inversePrimary),
                      ),
                      items: cities.map((category) {
                        return DropdownMenuItem<String>(
                          value: category,
                          child: Text(
                            category,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        );
                      }).toList(),
                      isExpanded: true,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      underline: const Text(
                        "",
                        style: TextStyle(color: Colors.black),
                      ),
                      onChanged: (String? val) {
                        if (val != null) {}
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SwitchListTile(
                  value: true,
                  onChanged: (val) {},
                  title: Text('إظهار رقم الهاتف',
                      style: TextStyle(color: theme.inversePrimary)),
                  activeColor: Theme.of(context).primaryColor,
                  inactiveThumbColor: Colors.white,
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  title: "",
                  windowController: TextEditingController(),
                ),
                const SizedBox(height: 20),
                SwitchListTile(
                  value: true,
                  onChanged: (val) {},
                  title: Text('تحديد السعر',
                      style: TextStyle(color: theme.inversePrimary)),
                  activeColor: Theme.of(context).primaryColor,
                  inactiveThumbColor: Colors.white,
                ),
                const SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(color: theme.inversePrimary)),
                  width: width * 0.9,
                  height: 50,
                  child: Center(
                    child: DropdownButton<String>(
                      borderRadius: BorderRadius.circular(25),
                      hint: Text(
                        "SYP",
                        style: Theme.of(context).textTheme.bodySmall,
                        //  TextStyle(color: theme.inversePrimary),
                      ),
                      items: cities.map((category) {
                        return DropdownMenuItem<String>(
                          value: category,
                          child: Text(
                            category,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        );
                      }).toList(),
                      isExpanded: true,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      underline: const Text(
                        "",
                        style: TextStyle(color: Colors.black),
                      ),
                      onChanged: (String? val) {
                        if (val != null) {}
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                Text(
                  "حالة المنتج",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: 15),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(color: theme.inversePrimary)),
                  width: width * 0.9,
                  height: 50,
                  child: Center(
                    child: DropdownButton<String>(
                      borderRadius: BorderRadius.circular(25),
                      hint: Text(
                        "New",
                        style: Theme.of(context).textTheme.bodySmall,
                        //  TextStyle(color: theme.inversePrimary),
                      ),
                      items: cities.map((category) {
                        return DropdownMenuItem<String>(
                          value: category,
                          child: Text(
                            category,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        );
                      }).toList(),
                      isExpanded: true,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      underline: const Text(
                        "",
                        style: TextStyle(color: Colors.black),
                      ),
                      onChanged: (String? val) {
                        if (val != null) {}
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                Text(
                  "tag إضافة",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: 15),
                Container(
                  width: width,
                  height: height * 0.2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: theme.inversePrimary),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 110,
                        right: 20,
                        left: 20,
                        //LATER WE WILL DISPLAY TAGS
                        child: Container(
                          padding: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: AuthTextField(
                            controller: TextEditingController(),
                            text: "",
                            sufIcon: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.arrow_forward,
                                  color: Colors.black,
                                )),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                CustomTextFieldArea(
                  hint: "التفاصيل",
                  windowController: TextEditingController(),
                ),
                SizedBox(height: height * 0.1),
                CustomPrimaryButton(
                  text: 'نشر',
                  color: Theme.of(context).primaryColor,
                  ontap: () {},
                  height: height * 0.05,
                  width: width * 0.9,
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
