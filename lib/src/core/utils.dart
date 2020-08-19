import 'dart:convert';

import 'package:flutter/services.dart';

Future<Map<String, dynamic>> parseJsonFromAssets(String assetsPath) async {
  final String jsonStr = await rootBundle.loadString(assetsPath);
  return json.decode(jsonStr);
}
