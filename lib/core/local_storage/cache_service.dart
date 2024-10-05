import 'dart:convert';
import 'dart:io';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class CacheService {
  static late Box _cacheBox;
  static Future<void> init() async {
    Directory appDocDirectory = await getApplicationDocumentsDirectory();
    var path = '${appDocDirectory.path}/';
    Hive.init(path);
    _cacheBox = await Hive.openBox('requests');
  }

  static Future<Map<String, dynamic>>? getRequest({required String request}) async {
    String encodedMap = await _cacheBox.get(request);
    return jsonDecode(encodedMap);
  }

  static Future<void> cacheRequest({required String request, required Map<String, dynamic> lastResponse}) async {
    String encodedMap = jsonEncode(lastResponse);
    await _cacheBox.put(request, encodedMap);
  }
}
