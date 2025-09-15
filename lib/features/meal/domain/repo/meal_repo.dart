import 'package:chef/core/errors/failure.dart';
import 'package:chef/features/meal/domain/entity/meal_entity.dart';
import 'package:dartz/dartz.dart';

abstract class MealRepo {
  Future<Either<Failure, List<MealEntity>>> getMeals();
  Future<Either<Failure, void>> addMeal(MealEntity meal);
  Future<Either<Failure, void>> deleteMeal(String mealId);
}
