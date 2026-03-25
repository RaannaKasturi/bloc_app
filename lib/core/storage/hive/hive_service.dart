import 'package:hive_flutter/hive_flutter.dart';

class HiveService {
  static Future<void> init() async {
    await Hive.initFlutter();
  }

  static Future<Box> openBox(String name) async {
    return await Hive.openBox(name);
  }
}
