import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecase/use_case.dart';
import '../repo/meal_repo.dart';

class DeleteMealUseCase extends UseCase<void, String> {
  final MealRepo mealRepo;

  DeleteMealUseCase(this.mealRepo);

  @override
  Future<Either<Failure, void>> call(String params) {
    return mealRepo.deleteMeal(params);
  }
}
