import 'package:isar/isar.dart';
import 'tag.dart';

part 'user_preference.g.dart';

@collection
class UserPreference {
  Id id = Isar.autoIncrement;

  late String name;

  List<String> dietaryRestrictions = [];

  final favoriteCuisines = IsarLinks<Tag>();
}
