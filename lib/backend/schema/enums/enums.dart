import 'package:collection/collection.dart';

enum KSKartingCategory {
  Micro,
  Mini,
  Junior,
  Senior,
}

enum UserRole {
  Driver,
  Scruitneer,
  Organiser,
  Organiser_Office,
  Sporting,
}

extension FFEnumExtensions<T extends Enum> on T {
  String serialize() => name;
}

extension FFEnumListExtensions<T extends Enum> on Iterable<T> {
  T? deserialize(String? value) =>
      firstWhereOrNull((e) => e.serialize() == value);
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (KSKartingCategory):
      return KSKartingCategory.values.deserialize(value) as T?;
    case (UserRole):
      return UserRole.values.deserialize(value) as T?;
    default:
      return null;
  }
}
