import 'package:chef/features/meal/domain/entity/meal_entity.dart';

abstract class GetMealState {}

final class GetMealInitial extends GetMealState {}

final class GetMealLoading extends GetMealState {}

final class GetMealSuccess extends GetMealState {
  final List<MealEntity> meals;
  GetMealSuccess(this.meals);
}

final class GetMealFailure extends GetMealState {
  final String msg;
  GetMealFailure(this.msg);
}
