import 'package:chef/features/meal/domain/use_case/get_meal_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/usecase/use_case.dart';
import 'get_meal_state.dart';

class GetMealCubit extends Cubit<GetMealState> {
  final GetMealUseCase getMealUseCase;

  GetMealCubit(this.getMealUseCase) : super(GetMealInitial());

  Future<void> getMeals() async {
    emit(GetMealLoading());
    final result = await getMealUseCase.call(const NoParams());

    result.fold(
      (failure) => emit(GetMealFailure(failure.msg)),
      (meals) => emit(GetMealSuccess(meals)),
    );
  }
}
