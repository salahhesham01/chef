class MealEntity {
  final String? mealId; // unique meal id (uuid)
  final String? userId; // foreign key -> auth.users.id
  final String name; // meal name
  final String category; // breakfast, lunch, dinner, snack
  final num price; // optional price
  final String desc; // optional description

  MealEntity({
    this.mealId,
    this.userId,
    required this.name,
    required this.category,
    required this.price,
    required this.desc,
  });
}
