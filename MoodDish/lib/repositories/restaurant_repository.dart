import 'package:isar/isar.dart';
import '../models/restaurant.dart';

class RestaurantRepository {
  final Isar isar;

  RestaurantRepository(this.isar);

  Future<void> addRestaurant(Restaurant restaurant) async {
    await isar.writeTxn(() async {
      await isar.restaurants.put(restaurant);
      await restaurant.cuisineTags.save();
    });
  }

  Future<List<Restaurant>> getAllRestaurants() async {
    return await isar.restaurants.where().findAll();
  }
}
