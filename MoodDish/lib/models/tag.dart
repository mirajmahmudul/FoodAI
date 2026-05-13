import 'package:isar/isar.dart';

part 'tag.g.dart';

@collection
class Tag {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  late String name;

  @enumerated
  late TagType type;
}

enum TagType { cuisine, flavor, mood }
