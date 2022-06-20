import 'dart:convert';

import 'package:postal_app/model/dispatch_master_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

Future fetchDispatchMasterList() async {
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  Map<String, String> headers = {
    'Content-Type': 'application/json',
  };
  final msg = jsonEncode({
    "userId": sharedPreferences.get("user_id"),
  });
  final response = await http.post(
    Uri.parse("http://202.51.74.57/api/home/agenthandover"),
    headers: headers,
    body: msg,
  );

  try {
    if (response.statusCode == 200) {
      return dispatchMasterListFromJson(response.body);
    }
  } catch (e) {
    throw Exception(e);
  }
}
