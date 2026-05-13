import 'package:isar/isar.dart';
import '../models/dish.dart';

class DishRepository {
  final Isar isar;

  DishRepository(this.isar);

  Future<void> addDish(Dish dish) async {
    await isar.writeTxn(() async {
      await isar.dishs.put(dish);
      await dish.restaurant.save();
      await dish.flavorTags.save();
    });
  }

  Future<List<Dish>> getAllDishes() async {
    return await isar.dishs.where().findAll();
  }
}
