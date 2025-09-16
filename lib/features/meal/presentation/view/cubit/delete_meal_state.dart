abstract class DeleteMealState {}

class DeleteMealInitial extends DeleteMealState {}

class DeleteMealLoading extends DeleteMealState {}

class DeleteMealSuccess extends DeleteMealState {
  final String mealId;
  DeleteMealSuccess(this.mealId);
}

class DeleteMealFailure extends DeleteMealState {
  final String message;
  DeleteMealFailure(this.message);
}
