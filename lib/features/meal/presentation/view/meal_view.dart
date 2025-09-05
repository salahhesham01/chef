import 'package:chef/core/utils/app_routes.dart';
import 'package:chef/core/utils/widgets/custom_btn.dart';
import 'package:chef/features/meal/presentation/view/widgets/meal_list_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MealView extends StatelessWidget {
  const MealView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.only(top: 24),
        child: Column(
          children: [
            CustomBtn(
                text: 'Add Meal',
                onPressed: () {
                  GoRouter.of(context).push(AppRoutes.kAddMealView);
                }),
            const SizedBox(
              height: 24,
            ),
            const MealListView(),
          ],
        ),
      )),
    );
  }
}
