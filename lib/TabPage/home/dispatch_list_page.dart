import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:postal_app/model/dispatch_list_model.dart';
import 'package:postal_app/services/dispatch_list_services.dart';
import 'package:shimmer/shimmer.dart';

class DispatchListScreen extends StatefulWidget {
  final agentId;
  final agentName;

  const DispatchListScreen(
      {Key? key, required this.agentId, required this.agentName})
      : super(key: key);

  @override
  State<DispatchListScreen> createState() => _DispatchListScreenState();
}

class _DispatchListScreenState extends State<DispatchListScreen> {
  String barcode = 'Scan to get result';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(130.0),
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                          height: 30,
                          width: 30,
                          decoration: const BoxDecoration(
                              color: Colors.white, shape: BoxShape.circle),
                          child: const Center(
                              child: FaIcon(FontAwesomeIcons.angleLeft))),
                    ),
                  ),
                  const Center(
                    child: Text(
                      "Dispatch List",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Center(
                    child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(10)),
                        child: const Center(
                            child: FaIcon(FontAwesomeIcons.qrcode))),
                  )
                ],
              ),
            ),
          ),
        ),
        body: FutureBuilder(
          future: fetchDispatchList(widget.agentId),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Opacity(
                opacity: 0.5,
                child: Shimmer.fromColors(
                  child: Container(
                      padding: const EdgeInsets.only(top: 5),
                      child: ListView.builder(
                          itemCount: 12,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 130,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(30),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Colors.blue,
                                          offset: Offset(0.0, 1.0),
                                          blurRadius: 10.0,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                )
                              ],
                            );
                          })),
                  baseColor: Colors.black12,
                  highlightColor: Colors.white,
                ),
              );
            }
            if (snapshot.hasData) {
              try {
                final List<DispatchListModel> snapshotData = snapshot.data;
                return ListView.builder(
                    itemCount: snapshotData.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Container(
                              width: double.infinity,
                              height: 180,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.blue,
                                    offset: Offset(0.0, 1.0),
                                    blurRadius: 10.0,
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Name:${widget.agentName}",
                                      style: const TextStyle(
                                          fontSize: 20,
                                          overflow: TextOverflow.ellipsis,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      "DOC Code No:${snapshotData[index].itemIdentifier}",
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    const Text(
                                      "Phone No.:9818331720",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        SizedBox(
                                          height: 40,
                                          width: 80,
                                          child: ElevatedButton(
                                            onPressed: () {
                                              scanBarcode();
                                              // .whenComplete(() => {
                                              //       if (barcode == -1)
                                              //         {
                                              //           Navigator.push(
                                              //             context,
                                              //             MaterialPageRoute(
                                              //               builder: (context) =>
                                              //                   const AddDetailsPage(),
                                              //             ),
                                              //           ),
                                              //         }
                                              //     });
                                            },
                                            style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all(
                                                        const Color(
                                                            0xff5073d9)),
                                                shape:
                                                    MaterialStateProperty.all<
                                                        RoundedRectangleBorder>(
                                                  const RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10)),
                                                  ),
                                                )),
                                            child: const Text(
                                              "scan",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        SizedBox(
                                          height: 40,
                                          width: 150,
                                          child: ElevatedButton(
                                            onPressed: () async {},
                                            style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all(
                                                        const Color.fromARGB(
                                                            255, 231, 4, 4)),
                                                shape:
                                                    MaterialStateProperty.all<
                                                        RoundedRectangleBorder>(
                                                  const RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10)),
                                                  ),
                                                )),
                                            child: const Text(
                                              "Informed",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          )
                        ],
                      );
                    });
              } catch (e) {
                throw Exception(e);
              }
            } else {
              return const Text("data");
            }
          },
        ));
  }

  Future<void> scanBarcode() async {
    try {
      final barcode = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666',
        'Cancel',
        true,
        ScanMode.BARCODE,
      );
      log(barcode);

      if (!mounted) return;

      setState(() {
        this.barcode = barcode;
      });
    } on PlatformException {
      barcode = 'Failed to get platform version.';
    }
  }
}
