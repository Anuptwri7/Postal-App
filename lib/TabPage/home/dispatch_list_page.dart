import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DispatchListScreen extends StatefulWidget {
  final agentId;

  const DispatchListScreen({Key? key, required this.agentId}) : super(key: key);

  @override
  State<DispatchListScreen> createState() => _DispatchListScreenState();
}

class _DispatchListScreenState extends State<DispatchListScreen> {
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
                      child:
                          const Center(child: FaIcon(FontAwesomeIcons.qrcode))),
                )
              ],
            ),
          ),
        ),
      ),
      body: ListView.builder(
          itemCount: 5,
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
                          const Text(
                            "Name:",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          const Text(
                            "DOC Code No:",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          const Text(
                            "Phone No.:",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
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
                                  onPressed: () async {
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //     builder: (context) => const DispatchListScreen(),
                                    //   ),
                                    // );
                                  },
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              const Color(0xff5073d9)),
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
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
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
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
          }),
    );
  }
}
