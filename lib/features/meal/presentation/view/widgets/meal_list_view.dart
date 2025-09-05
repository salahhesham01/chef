import 'package:flutter/material.dart';

import 'meal_list_view_item.dart';

class MealListView extends StatelessWidget {
  const MealListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return const MealListViewItem();
          }),
    );
  }
}
