import '../../domain/entity/meal_entity.dart';

class MealModel extends MealEntity {
  MealModel({
    super.mealId,
    super.userId,
    required super.name,
    required super.category,
    required super.price,
    required super.desc,
  });

  /// Factory to create MealModel from Supabase JSON
  factory MealModel.fromJson(Map<String, dynamic> json) {
    return MealModel(
      mealId: json['meal_id'] as String?,
      userId: json['id'] as String?,
      name: json['name'] as String,
      category: json['category'] as String,
      price: json['price'] as num,
      desc: json['desc'] as String,
    );
  }

  /// Convert MealModel to JSON (for insert)
  Map<String, dynamic> toJson() {
    return {
      'id': userId,
      'name': name,
      'category': category,
      'price': price,
      'desc': desc,
    };
  }
}
