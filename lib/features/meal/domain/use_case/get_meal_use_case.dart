import 'package:chef/features/meal/domain/entity/meal_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecase/use_case.dart';
import '../repo/meal_repo.dart';

class GetMealUseCase extends UseCase<List<MealEntity>, NoParams> {
  final MealRepo mealRepo;

  GetMealUseCase(this.mealRepo);

  @override
  Future<Either<Failure, List<MealEntity>>> call(NoParams params) {
    return mealRepo.getMeals();
  }
}
