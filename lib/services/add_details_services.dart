import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:postal_app/camera/captured_photo.dart';
import 'package:postal_app/signature/signature_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future addDetailsPost() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  Map<String, String> headers = {
    'Content-Type': 'multipart/form-data',
  };

  Map<String, String> msg = {
    "OrganizationId": "${pref.get("organizationId")}",
    "DeliveryDate": DateFormat("yyyy-MM-dd").format(DateTime.now()),
    "DeliveryTime": DateFormat("HH:mm:ss").format(DateTime.now()),
    "ItemIdentifier": "7265847",
    "UniqueId": "${pref.get("uniqueUserId")}",
    "Name": "test user",
    "Location": "Bagmati",
    "signature":base64Encode(byteData!.buffer.asUint8List())
    // "NonDeliveryReasonId":"1",
    // "NonDeliveryMajorId":"1"
  };
  var request = http.MultipartRequest(
    "POST",
    Uri.parse("http://202.166.194.38:8080/api/home/deliver"),
  );
log("kdsjhfldkj"+base64Encode(byteData!.buffer.asUint8List()));
  request.headers.addAll(headers);
  request.fields.addAll(msg);
  request.files.add(
    http.MultipartFile.fromBytes(
      "Photo",
      File(imageFile!.path).readAsBytesSync(),
      filename: imageFile!.path,
    ),
  );
  request.send().then((response) {
    log(response.statusCode.toString());
    log(response.reasonPhrase.toString());
    try {
      if (response.statusCode == 200) {
        Fluttertoast.showToast(msg: "Sent Successfully");

        return const Text("data");
      }
    } catch (e) {
      throw Exception(e);
    }
  });
}
