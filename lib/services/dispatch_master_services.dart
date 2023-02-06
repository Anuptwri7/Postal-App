import 'dart:convert';
import 'dart:developer';

import 'package:postal_app/constant/api_constant.dart';
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
    Uri.parse(baseUrl+"/api/home/agenthandover"),
    headers: headers,
    body: msg,
  );

  try {
    if (response.statusCode == 200) {
      log("i have arrived");
      return dispatchMasterListFromJson(response.body);
    }else{
      log("i have not arrived");
    }
  } catch (e) {
    throw Exception(e);
  }
}
