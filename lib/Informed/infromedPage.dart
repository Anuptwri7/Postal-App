import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:postal_app/Informed/reasonApi.dart';
import 'package:postal_app/Informed/reasonsModel.dart';
import 'package:postal_app/services/add_details_services.dart';
import 'package:postal_app/signature/signature_page.dart';
import 'package:search_choices/search_choices.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../camera/captured_photo.dart';

class InformedPage extends StatefulWidget {
  const InformedPage({Key? key}) : super(key: key);

  @override
  State<InformedPage> createState() => _InformedPageState();
}

class _InformedPageState extends State<InformedPage> {
  TextEditingController itemIdentifiertextEditingController =
  TextEditingController();
  TextEditingController reciverNametextEditingController =
  TextEditingController();
  TextEditingController reciverPhonetextEditingController =
  TextEditingController();
  TextEditingController locationtextEditingController = TextEditingController();


  String? _selectedReason;
  int? _selectedReasonId ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50.0),
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment(-1.0, -0.94),
                end: Alignment(0.968, 1.0),
                colors: [Color(0xff2557D2), Color(0xff6b88e8)],
                stops: [0.0, 1.0],
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(0.0),
                topRight: Radius.circular(0.0),
                bottomRight: Radius.circular(15.0),
                bottomLeft: Radius.circular(15.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Center(
                  //   child: InkWell(
                  //     onTap: () {
                  //       Navigator.pop(context);
                  //     },
                  //     child: Container(
                  //         height: 30,
                  //         width: 30,
                  //         decoration: const BoxDecoration(
                  //             color: Colors.white, shape: BoxShape.circle),
                  //         child: const Center(
                  //             child: FaIcon(FontAwesomeIcons.angleLeft))),
                  //   ),
                  // ),
                  const SizedBox(
                    width: 100,
                  ),
                  const Center(
                    child: Text(
                      "Add Details For Informed",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.only(top: 50, left: 10, right: 10),
            child: Column(
              children: [
                Container(
                  child: TextField(
                    controller: itemIdentifiertextEditingController,
                    decoration: InputDecoration(
                        label: const Text("Item Identifier"),
                        labelStyle:
                        const TextStyle(color: Colors.black, fontSize: 18),
                        contentPadding: const EdgeInsets.all(15),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                Container(
                  child: TextField(
                    controller: reciverNametextEditingController,
                    decoration: InputDecoration(
                        label: const Text("Reciver Name"),
                        labelStyle:
                        const TextStyle(color: Colors.black, fontSize: 18),
                        contentPadding: const EdgeInsets.all(15),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                Container(
                  child: TextField(
                    controller: reciverPhonetextEditingController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                        label: const Text("Receiver Contact"),
                        labelStyle:
                        const TextStyle(color: Colors.black, fontSize: 18),
                        contentPadding: const EdgeInsets.all(15),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),


                Container(
                  child: TextField(
                    controller: locationtextEditingController,
                    decoration: InputDecoration(
                        label: const Text("Location"),
                        labelStyle:
                        const TextStyle(color: Colors.black, fontSize: 18),
                        contentPadding: const EdgeInsets.all(15),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FutureBuilder(
                    future:fetchReasonsFromUrl(),
                    builder: (BuildContext context,
                        AsyncSnapshot snapshot) {
                      if (snapshot.data == null) {
                        return Opacity(
                            opacity: 0.8,
                            child: Container());
                      }
                      if (snapshot.hasData) {
                        try {
                          final List<NonDeliveryModel> snapshotData =
                              snapshot.data;

                          // customerServices.allCustomer = [];
                          return SearchChoices.single(
                            items: snapshotData
                                .map((NonDeliveryModel value) {
                              return (DropdownMenuItem(
                                child: Text(
                                    " ${value.nonDeliveryMeasureReason.toString()} ",
                                    style: const TextStyle(
                                        fontSize: 14)),
                                value: value.choiceId,
                                onTap: () {
                                  // setState(() {
                                  _selectedReasonId =
                                      value.choiceId;
                                  _selectedReason =
                                      value.nonDeliveryMeasureReason;
                                  log('selected Customer name : ${_selectedReason.toString()}');
                                  log('selected Customer id : ${_selectedReasonId.toString()}');
                                  // });
                                },
                              ));
                            }).toList(),
                            value: _selectedReason,
                            searchHint: "Select Reason",
                            icon: const Visibility(
                              visible: false,
                              child:
                              Icon(Icons.arrow_downward),
                            ),
                            onChanged: (NonDeliveryModel? value) {},
                            dialogBox: true,
                            keyboardType: TextInputType.text,
                            isExpanded: true,
                            clearIcon: const Icon(
                              Icons.close,
                              size: 0,
                            ),
                            padding: 0,
                            hint: const Padding(
                              padding: EdgeInsets.only(
                                  top: 15, left: 5),
                              child: Text(
                                "Select Reason",
                                style:
                                TextStyle(fontSize: 15),
                              ),
                            ),
                            // underline:
                            // DropdownButtonHideUnderline(
                            //     child: Container()),

                          );
                        } catch (e) {
                          throw Exception(e);
                        }
                      } else {
                        return Text(
                            snapshot.error.toString());
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FutureBuilder(
                    future:fetchReasonsFromUrl(),
                    builder: (BuildContext context,
                        AsyncSnapshot snapshot) {
                      if (snapshot.data == null) {
                        return Opacity(
                            opacity: 0.8,
                            child: Container());
                      }
                      if (snapshot.hasData) {
                        try {
                          final List<NonDeliveryModel> snapshotData =
                              snapshot.data;

                          // customerServices.allCustomer = [];
                          return SearchChoices.single(
                            items: snapshotData
                                .map((NonDeliveryModel value) {
                              return (DropdownMenuItem(
                                child: Text(
                                    " ${value.nonDeliveryMeasureReason.toString()} ",
                                    style: const TextStyle(
                                        fontSize: 14)),
                                value: value.choiceId,
                                onTap: () {
                                  // setState(() {
                                  _selectedReasonId =
                                      value.choiceId;
                                  _selectedReason =
                                      value.nonDeliveryMeasureReason;
                                  log('selected Customer name : ${_selectedReason.toString()}');
                                  log('selected Customer id : ${_selectedReasonId.toString()}');
                                  // });
                                },
                              ));
                            }).toList(),
                            value: _selectedReason,
                            searchHint: "Select Reason",
                            icon: const Visibility(
                              visible: false,
                              child:
                              Icon(Icons.arrow_downward),
                            ),
                            onChanged: (NonDeliveryModel? value) {},
                            dialogBox: true,
                            keyboardType: TextInputType.text,
                            isExpanded: true,
                            clearIcon: const Icon(
                              Icons.close,
                              size: 0,
                            ),
                            padding: 0,
                            hint: const Padding(
                              padding: EdgeInsets.only(
                                  top: 15, left: 5),
                              child: Text(
                                "Select Reason",
                                style:
                                TextStyle(fontSize: 15),
                              ),
                            ),
                            // underline:
                            // DropdownButtonHideUnderline(
                            //     child: Container()),

                          );
                        } catch (e) {
                          throw Exception(e);
                        }
                      } else {
                        return Text(
                            snapshot.error.toString());
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: 40.0,
                ),
                Center(
                  child: SizedBox(
                    height: 40,
                    width: 150,
                    child: ElevatedButton(
                      onPressed: () async {
                         await addDetailsPostAttempt();
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              const Color(0xff5073d9)),
                          shape:
                          MaterialStateProperty.all<RoundedRectangleBorder>(
                            const RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(10)),
                            ),
                          )),
                      child: const Text(
                        "Inform",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ));
  }
//   Future addDetailsPostAttempt() async {
//
//     log(jsonEncode(_selectedReasonId.toString()));
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     Map<String, String> headers = {
//       'Content-Type': 'multipart/form-data',
//     };
//
//     Map<String, String> msg = {
//     "OrganizationId": "${jsonEncode(pref.get("organizationId"))}",
//     // "DeliveryDate": DateFormat("yyyy-MM-dd").format(DateTime.now()),
//     // "DeliveryTime": DateFormat("HH:mm:ss").format(DateTime.now()),
//     "ItemIdentifier": jsonEncode(itemIdentifiertextEditingController.text.toString()),
//     // "UniqueId": "${pref.get("uniqueUserId")}",
//     "createdBy": "${jsonEncode(pref.get("uniqueUserId"))}",
//     "Name": jsonEncode(reciverNametextEditingController.text.toString()),
//     "Location": jsonEncode(locationtextEditingController.text.toString()),
//     // "CreatedDate":DateFormat("yyyy-MM-dd").format(DateTime.now()),
//     // "CreatedTime":DateFormat("HH:mm:ss").format(DateTime.now()),
//     "NonDeliveryReasonId":jsonEncode(_selectedReasonId.toString()) , // reason id
//     "NonDeliveryMeasureId":jsonEncode(_selectedReasonId.toString()), //measuer id
//     };
//     var request = http.MultipartRequest(
//     "POST",
//     Uri.parse("http://202.166.194.38:8080/api/home/attempt"),
//     );
//
//     request.send().then((response) {
// log(msg.toString());
//       log(response.request.toString());
//     log(response.statusCode.toString());
//     log(response.reasonPhrase.toString());
//     try {
//     if (response.statusCode == 200) {
//     return const Text("data");
//     }
// else if(response.statusCode==415){
//   log(response.toString());
//     }
//     } catch (e) {
//       log(e.toString());
//     throw Exception(e);
//     }
//     });
//   }

  Future addDetailsPostAttempt() async {
    final SharedPreferences sharedPreferences =
    await SharedPreferences.getInstance();

    final responseBody = {

      "OrganizationId": "${(sharedPreferences.get("organizationId"))}",
    "ItemIdentifier": (itemIdentifiertextEditingController.text.toString()),
    // "UniqueId": "${pref.get("uniqueUserId")}",
    "createdBy": "${(sharedPreferences.get("uniqueUserId"))}",
    // "Name": (reciverNametextEditingController.text.toString()),
    // "Location":(locationtextEditingController.text.toString()),
    "CreatedDate":DateFormat("dd/mm/yyyy").format(DateTime.now()),
    "CreatedTime":DateFormat("HH:mm").format(DateTime.now()),
    "NonDeliveryReasonId":(_selectedReasonId.toString()) , // reason id
    "NonDeliveryMeasureId":(_selectedReasonId.toString()), //measuer id

    };
    log(json.encode(responseBody));

    final response = await http.post(
        Uri.parse("http://202.166.194.38:8080/api/home/attempt"),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',

        },
        body: json.encode(responseBody));
    log(response.body);
    log(response.statusCode.toString());
    if (response.statusCode == 200) {
      // Fluttertoast.showToast(msg: "Done Successfully!",backgroundColor: Colors.red);

      log(responseBody.toString());
      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>DocumentMaster()));

    } else if (response.statusCode == 400) {
      // Fluttertoast.showToast(msg: json.decode(response.body)["message"],backgroundColor: Colors.red);
    }

    return response;
  }

}



