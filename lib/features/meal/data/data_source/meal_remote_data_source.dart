import 'package:supabase_flutter/supabase_flutter.dart';

import '../model/meal_model.dart';

abstract class MealRemoteDataSource {
  Future<List<MealModel>> getMeals();
  Future<void> addMeal(MealModel meal);
  Future<void> deleteMeal(String mealId);
}

class MealRemoteDataSourceImpl implements MealRemoteDataSource {
  final SupabaseClient client;

  MealRemoteDataSourceImpl(this.client);

  @override
  Future<List<MealModel>> getMeals() async {
    final userId = client.auth.currentUser?.id;
    if (userId == null) throw Exception("No logged in user");

    final response = await client
        .from('meals')
        .select()
        .eq('id', userId); // filter by current user id

    return response.map<MealModel>((json) => MealModel.fromJson(json)).toList();
  }

  @override
  Future<void> addMeal(MealModel meal) async {
    final userId = client.auth.currentUser?.id;
    if (userId == null) throw Exception("No logged in user");

    final data = meal.toJson()..['id'] = userId;

    await client.from('meals').insert(data);
  }

  @override
  Future<void> deleteMeal(String mealId) async {
    await client.from('meals').delete().eq('meal_id', mealId);
  }
}
