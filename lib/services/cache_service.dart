import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_elearning_app/core/app_export.dart';

class CacheService extends GetxService {
  late Box _courseBox;

  Future<CacheService> init() async {
    _courseBox = await Hive.openBox('courseCache');
    return this;
  }

  void cacheData(String key, dynamic value) {
    _courseBox.put(key, value);
  }

  dynamic getCachedData(String key) {
    return _courseBox.get(key);
  }

  void cacheLastUpdated(String timestamp) {
    _courseBox.put('lastUpdated', timestamp);
  }

  String? getLastUpdated() {
    return _courseBox.get('lastUpdated');
  }
}
