import 'package:chef/features/meal/domain/entity/meal_entity.dart';

abstract class AddMealState {}

final class AddMealInitial extends AddMealState {}

final class AddMealSuccess extends AddMealState {
  final MealEntity meal;
  AddMealSuccess(this.meal);
}

final class AddMealLoading extends AddMealState {}

final class AddMealFailure extends AddMealState {
  final String msg;
  AddMealFailure(this.msg);
}
