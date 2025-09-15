import 'package:chef/features/meal/domain/entity/meal_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecase/use_case.dart';
import '../repo/meal_repo.dart';

class AddMealUseCase extends UseCase<void, MealEntity> {
  final MealRepo mealRepo;

  AddMealUseCase(this.mealRepo);

  @override
  Future<Either<Failure, void>> call(MealEntity params) {
    return mealRepo.addMeal(params);
  }
}
