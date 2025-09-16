import 'package:chef/features/meal/presentation/view/cubit/get_meal_cubit.dart';
import 'package:chef/features/meal/presentation/view/cubit/get_meal_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/delete_meal_cubit.dart';
import '../cubit/delete_meal_state.dart';
import 'meal_list_view_item.dart';

class MealListView extends StatelessWidget {
  const MealListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<DeleteMealCubit, DeleteMealState>(
      listener: (context, state) {
        if (state is DeleteMealSuccess) {
          // 👇 أول ما يحصل delete نحدث meals
          context.read<GetMealCubit>().removeMeal(state.mealId);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Meal deleted successfully")),
          );
        }
      },
      child: BlocBuilder<GetMealCubit, GetMealState>(
        builder: (context, state) {
          if (state is GetMealLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is GetMealFailure) {
            return Center(child: Text(state.msg));
          } else if (state is GetMealSuccess) {
            final meals = state.meals;
            return Expanded(
              child: ListView.builder(
                itemCount: meals.length,
                itemBuilder: (context, index) {
                  final meal = meals[index];
                  return MealListViewItem(meal: meal);
                },
              ),
            );
          } else {
            return const Center(child: Text("No meals found"));
          }
        },
      ),
    );
  }
}
