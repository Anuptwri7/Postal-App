// import 'dart:convert';
//
// import 'package:http/http.dart' as http;
//
// Future AddProductByBatch() async {
//
//   final responseBody = {
//     "status": 1,
//     "customer": _selectedCustomer,
//     "sub_total": subTotal,
//     "total_discount": totalDiscount,
//     "total_tax": 0,
//     "grand_total": x,
//     "remarks": "",
//     "total_discountable_amount": subTotal,
//     "total_taxable_amount": 0,
//     "total_non_taxable_amount": x,
//     "discount_scheme": '',
//     "discount_rate": 0,
//     "delivery_location": locationController.text,
//     "delivery_date_ad": dateController.text == ""?null:dateController.text,
//     "order_details": orderDetails,
//   };
//   log(json.encode(responseBody));
//   final response = await http.post(
//       Uri.parse('http://202.166.194.38:8080/api/home/attempt'),
//       headers: {
//         'Content-Type': 'application/json',
//         'Accept': 'application/json',
//         // 'Authorization': 'Bearer ${sharedPreferences.get("access_token")}'
//       },
//       //ApiConstant.baseUrl + ApiConstant.saveCustomerOrder
//       body: json.encode(responseBody));
//   log(response.body);
//   if (response.statusCode == 201) {
//     qtyController.clear();
//     pricecontroller.clear();
//     discountPercentageController.clear();
//     DataCell.empty;
//   } else if (response.statusCode == 400) {
//     Fluttertoast.showToast(msg: response.body.toString());
//   }
//
//   return response;
// }