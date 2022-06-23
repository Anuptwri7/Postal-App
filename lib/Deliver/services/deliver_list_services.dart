// import 'dart:developer';

// import 'package:http/http.dart' as http;


// Future fetchAttemptList(String agentId) async {
//   Map<String, String> headers = {
//     'Content-Type': 'application/json',
//   };

//   final response = await http.post(
//     Uri.parse("http://202.51.74.57/api/home/deliverlist"),
//     headers: headers,
//   );
//   log(response.body);
//   try {
//     if (response.statusCode == 200) {
//       return attemptListModelFromJson(response.body);
//     }
//   } catch (e) {
//     throw Exception(e);
//   }
// }
