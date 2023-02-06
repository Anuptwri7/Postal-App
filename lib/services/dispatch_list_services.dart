import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:postal_app/constant/api_constant.dart';
import '../model/dispatch_list_model.dart';

Future fetchDispatchList(String agentId) async {
  Map<String, String> headers = {
    'Content-Type': 'application/json',
  };
  final msg = jsonEncode({
    "agentHandOverId": agentId,
  });
  final response = await http.post(
    Uri.parse(baseUrl+"/api/home/agenthandoveritem"),
    headers: headers,
    body: msg,
  );

  try {
    if (response.statusCode == 200) {
      log("i came");
      return dispatchListModelFromJson(response.body);

    }else{
      log("i didnt come");
    }
  } catch (e) {
    throw Exception(e);
  }
}
