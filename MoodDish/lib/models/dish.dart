import 'package:isar/isar.dart';
import 'restaurant.dart';
import 'tag.dart';

part 'dish.g.dart';

@collection
class Dish {
  Id id = Isar.autoIncrement;

  @Index()
  late int restaurantId;

  final restaurant = IsarLink<Restaurant>();

  late String name;
  
  late String description;
  
  late double price;

  final flavorTags = IsarLinks<Tag>();
  
  String? imagePath;
}
