import 'package:hive_flutter/hive_flutter.dart';

class HiveService {
  static const String _boxName = 'app_box';

  static late Box _box;

  static Future<void> init() async {
    await Hive.initFlutter();

    _box = await Hive.openBox(_boxName);
  }

  static Future<void> set(
    String key,
    dynamic value,
  ) async {
    await _box.put(key, value);
  }

  static T? get<T>(String key) {
    return _box.get(key) as T?;
  }

  static Future<void> delete(String key) async {
    await _box.delete(key);
  }

  static Future<void> clear() async {
    await _box.clear();
  }

  static bool contains(String key) {
    return _box.containsKey(key);
  }
}