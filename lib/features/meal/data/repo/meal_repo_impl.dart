import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../domain/entity/meal_entity.dart';
import '../../domain/repo/meal_repo.dart';
import '../data_source/meal_remote_data_source.dart';
import '../model/meal_model.dart';

class MealRepoImpl implements MealRepo {
  final MealRemoteDataSource remoteDataSource;

  MealRepoImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<MealEntity>>> getMeals() async {
    try {
      final meals = await remoteDataSource.getMeals();
      return Right(meals);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> addMeal(MealEntity mealEntity) async {
    try {
      final mealModel = MealModel(
        mealId: mealEntity.mealId,
        name: mealEntity.name,
        desc: mealEntity.desc,
        price: mealEntity.price,
        userId: mealEntity.userId,
        category: mealEntity.category,
      );

      await remoteDataSource.addMeal(mealModel);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteMeal(String mealId) async {
    try {
      await remoteDataSource.deleteMeal(mealId);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
