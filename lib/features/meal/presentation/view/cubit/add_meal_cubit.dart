import 'package:chef/features/meal/domain/use_case/add_meal_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entity/meal_entity.dart';
import 'add_meal_state.dart';

class AddMealCubit extends Cubit<AddMealState> {
  AddMealCubit(this.addMealUseCase) : super(AddMealInitial());
  AddMealUseCase addMealUseCase;

  String? name;
  String? description;
  double? price;
  String? category;
  Future<void> addMeal() async {
    if (name == null || price == null || category == null) {
      emit(AddMealFailure("Please fill all required fields"));
      return;
    }

    emit(AddMealLoading());

    final meal = MealEntity(
      name: name!,
      category: category!,
      price: price!,
      desc: description!,
      userId: '', // leave empty, RLS + Supabase will fill
    );

    final result = await addMealUseCase(meal);

    result.fold(
      (failure) => emit(AddMealFailure(failure.msg)),
      (_) => emit(AddMealSuccess(meal)),
    );
  }
}
