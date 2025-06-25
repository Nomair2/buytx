import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/common/widgets/custom_primary_button.dart';
import '../../../../core/common/widgets/custom_text_field.dart';

class ProductDetailPage1 extends StatefulWidget {
  const ProductDetailPage1({super.key});

  @override
  State<ProductDetailPage1> createState() => _ProductDetailPage1State();
}

class _ProductDetailPage1State extends State<ProductDetailPage1> {
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
                  "اختر المدينة",
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
                        "اختر المدينة",
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
                const SizedBox(height: 30),
                Text(
                  "اختر الحي",
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
                        "اختر الحي",
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
                const SizedBox(height: 30),
                Text(
                  "تفاصيل أكثر عن العنوان",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: 15),
                CustomTextField(
                  title: "",
                  windowController: TextEditingController(),
                ),
                SizedBox(height: height * 0.1),
                CustomPrimaryButton(
                  text: 'التالي',
                  color: Theme.of(context).primaryColor,
                  ontap: () {
                    context.pushNamed('productImage');
                  },
                  height: height * 0.05,
                  width: width * 0.9,
                ),
              ],
            ),
          ),
        ),
      ),
    
    );
  }
}
