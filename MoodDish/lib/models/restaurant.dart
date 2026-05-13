import 'package:isar/isar.dart';
import 'tag.dart';

part 'restaurant.g.dart';

@collection
class Restaurant {
  Id id = Isar.autoIncrement;

  late String name;
  
  late String address;
  
  late double lat;
  late double lon;

  final cuisineTags = IsarLinks<Tag>();
}
