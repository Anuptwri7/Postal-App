import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AddDetailsPage extends StatefulWidget {
  const AddDetailsPage({Key? key}) : super(key: key);

  @override
  State<AddDetailsPage> createState() => _AddDetailsPageState();
}

class _AddDetailsPageState extends State<AddDetailsPage> {
  TextEditingController reciverNametextEditingController =
      TextEditingController();
  TextEditingController reciverPhonetextEditingController =
      TextEditingController();
  TextEditingController remarkstextEditingController = TextEditingController();

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
                mainAxisAlignment: MainAxisAlignment.start,
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
                  const SizedBox(
                    width: 100,
                  ),
                  const Center(
                    child: Text(
                      "Add Details",
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
            padding: const EdgeInsets.only(top: 50, left: 50, right: 50),
            child: Column(
              children: [
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
                        label: const Text("Reciver Contact"),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 100,
                      width: 130,
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          FaIcon(FontAwesomeIcons.signature),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Take Sign",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 100,
                      width: 130,
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          FaIcon(FontAwesomeIcons.camera),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Take Photo",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                Container(
                  child: TextField(
                    controller: remarkstextEditingController,
                    decoration: InputDecoration(
                        label: const Text("Remarks"),
                        labelStyle:
                            const TextStyle(color: Colors.black, fontSize: 18),
                        contentPadding: const EdgeInsets.all(15),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
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
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => const DispatchListScreen(),
                        //   ),
                        // );
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
                        "Dispatch",
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
}
