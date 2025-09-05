import 'package:chef/core/utils/widgets/custom_btn.dart';
import 'package:chef/features/auth/presentation/views/widgets/custom_text_field.dart';
import 'package:chef/features/profile/presentation/view/widgets/custom_profile_image.dart';
import 'package:flutter/material.dart';

import '../../../../../constants.dart';

class AddMeal extends StatelessWidget {
  const AddMeal({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: const Text(
                'Add Meal',
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: primaryColor,
            ),
            body: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      const CustomProfileImage(),
                      const SizedBox(
                        height: 24,
                      ),
                      CustomTextField(hintText: 'Name'),
                      const SizedBox(
                        height: 24,
                      ),
                      CustomTextField(hintText: 'Price'),
                      const SizedBox(
                        height: 24,
                      ),
                      CustomTextField(hintText: 'Category'),
                      const SizedBox(
                        height: 24,
                      ),
                      CustomTextField(hintText: 'Description'),
                      const SizedBox(
                        height: 33,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 23.0, left: 10),
                        child: Row(
                          children: [
                            RadioSelecter(
                              text: "Number",
                              group: "Number",
                            ),
                            Spacer(),
                            RadioSelecter(
                              text: "Quantity",
                              group: "Quantity",
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 80,
                      ),
                      CustomBtn(text: 'Add Meal', onPressed: () {}),
                      const SizedBox(
                        height: 11,
                      ),
                    ],
                  ),
                )
              ],
            )));
  }
}

class RadioSelecter extends StatelessWidget {
  const RadioSelecter({
    super.key,
    required this.text,
    required this.group,
  });
  final String text;
  final String group;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio(
          value: text,
          groupValue: group,
          activeColor: primaryColor,
          onChanged: (String? value) {},
        ),
        const Text(
          "Number",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
