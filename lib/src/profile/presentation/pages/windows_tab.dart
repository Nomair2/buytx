// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';

import '../widgets/window_card.dart';

class WindowsTab extends StatefulWidget {
  const WindowsTab({super.key});

  @override
  State<WindowsTab> createState() => _WindowsTabState();
}

class _WindowsTabState extends State<WindowsTab> {
  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Material(
            elevation: 4,
            borderRadius: BorderRadius.circular(20),
            child: CustomTextField(
              controller: searchController,
            ),
          ),
        ),
        //====
        // in this listView we will display the offers the user add from 
        //create window page
        ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 2,
            itemBuilder: (context, index) {
              return WindowCard(
                title: "عن المتجر",
                content:
                    " تاجر محترف و موثوق متخصص في بيع القطع الإلكترونية ذات جودة عالية و أسعار تنافسية , خدمة عملاء مميزة , مع إلتزام بالمواعيد و الاحترام ذات جودة عالية و أسعار تنافسية , خدمة عملاء مميزة ",
                editOnTap: () {},
                deleteOnTap: () {},
              );
            }),
        const SizedBox(height: 400),
      ],
    );
  }
}

//====
class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: "بحث",
        hintStyle: Theme.of(context).textTheme.bodySmall,
        hintTextDirection: TextDirection.rtl,
        fillColor: Theme.of(context).colorScheme.primaryContainer,
        filled: true,
        suffixIcon: Icon(Icons.search,
            color: Theme.of(context).colorScheme.onSecondary),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.primaryContainer,
            )),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.primaryContainer,
            )),
      ),
    );
  }
}
