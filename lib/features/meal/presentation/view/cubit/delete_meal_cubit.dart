import 'package:chef/features/meal/domain/use_case/delete_meal_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'delete_meal_state.dart';

class DeleteMealCubit extends Cubit<DeleteMealState> {
  final DeleteMealUseCase mealRepo;
  DeleteMealCubit(this.mealRepo) : super(DeleteMealInitial());

  Future<void> deleteMeal(String mealId) async {
    emit(DeleteMealLoading());
    try {
      await mealRepo.call(mealId);
      emit(DeleteMealSuccess(mealId)); // 👈 نرجع mealId
    } catch (e) {
      emit(DeleteMealFailure(e.toString()));
    }
  }
}
