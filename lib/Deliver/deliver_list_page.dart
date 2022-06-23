import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:postal_app/Deliver/model/deliver_list_model.dart';
import 'package:shimmer/shimmer.dart';

import 'services/deliver_list_services.dart';

class DeliverListScreen extends StatefulWidget {
  const DeliverListScreen({Key? key}) : super(key: key);

  @override
  State<DeliverListScreen> createState() => _DeliverListScreenState();
}

class _DeliverListScreenState extends State<DeliverListScreen> {
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
                    "Deliver List",
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
                      child:
                          const Center(child: FaIcon(FontAwesomeIcons.qrcode))),
                )
              ],
            ),
          ),
        ),
      ),
      body: FutureBuilder(
        future: fetchDeliverList(),
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
              final List<DeliveredListModel> snapshotData = snapshot.data;

              return ListView.builder(
                itemCount: snapshotData.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          width: double.infinity,
                          height: 100,
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
                                  "Id:${snapshotData[index].organizationId}",
                                  style: const TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  "Item Identifier:${snapshotData[index].itemIdentifier}",
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
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
                },
              );
            } catch (e) {
              throw Exception(e);
            }
          } else {
            return const Text("data");
          }
        },
      ),
    );
  }
}
