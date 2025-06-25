import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/common/widgets/custom_primary_button.dart';

class PolicyPage extends StatefulWidget {
  const PolicyPage({super.key});

  @override
  State<PolicyPage> createState() => _PolicyPageState();
}

class _PolicyPageState extends State<PolicyPage> {
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
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 20),
                Text(
                  "إتفاقية الرسوم",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Divider(
                  color: theme.inversePrimary,
                  endIndent: 20,
                  indent: 20,
                  thickness: 2,
                ),
                const SizedBox(height: 200),
                Divider(
                  color: theme.inversePrimary,
                  endIndent: 20,
                  indent: 20,
                  thickness: 2,
                ),
                const SizedBox(height: 300),
                CustomPrimaryButton(
                  text: 'التالي',
                  color: Theme.of(context).primaryColor,
                  ontap: () {
                    context.pushNamed('productDetail1');
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
