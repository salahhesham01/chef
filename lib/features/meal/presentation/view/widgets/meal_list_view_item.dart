import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // 👈 add this
import '../../../../../core/utils/assets/app_assets.dart';
import '../../../domain/entity/meal_entity.dart';
import '../cubit/delete_meal_cubit.dart';
import '../cubit/get_meal_cubit.dart';

class MealListViewItem extends StatelessWidget {
  final MealEntity meal;

  const MealListViewItem({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8),
      child: SizedBox(
        height: 100,
        child: Row(
          children: [
            // Meal Image (دلوقتي ثابتة، بعدين ممكن تجيبها من Supabase)
            SizedBox(
              width: 60,
              height: 60,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: const DecorationImage(
                    image: AssetImage(AppAssets.food),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),

            // Meal details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    meal.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  ...[
                    const SizedBox(height: 6),
                    Text(
                      meal.desc,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                  ],
                  const SizedBox(height: 6),
                  Text(
                    "${meal.price} LE",
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(width: 12),

            // Delete button
            GestureDetector(
              onTap: () {
                context.read<DeleteMealCubit>().deleteMeal(meal.mealId!);
              },
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  CupertinoIcons.xmark,
                  color: Colors.white,
                  size: 22,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
