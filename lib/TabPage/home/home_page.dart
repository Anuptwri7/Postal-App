import 'package:battery_plus/battery_plus.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:postal_app/Attempt/atttempt_list_page.dart';
import 'package:postal_app/Deliver/deliver_list_page.dart';
// import "package:flutter_svg/flutter_svg.dart";
import 'dispatch_master_page.dart';

class HomeTabPage extends StatefulWidget {
  const HomeTabPage({Key? key}) : super(key: key);

  @override
  State<HomeTabPage> createState() => _HomeTabPageState();
}

class _HomeTabPageState extends State<HomeTabPage> {


  var battery = Battery();
  int percentage = 0;
  @override
  void initState() {

    // TODO: implement initState
    super.initState();
    getBatteryPercentage();
  }

  void getBatteryPercentage() async{
    final level = await battery.batteryLevel;
    percentage = level;
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

          appBar: MainAppBar(),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Welcome to Postal App",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.red,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text(
                    "Track Document.",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.red,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height/8,
                    margin: const EdgeInsets.only(right: 10, left: 10),
                    decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x155665df),
                          spreadRadius: 5,
                          blurRadius: 17,
                          offset: Offset(0, 3),
                        )
                      ],
                      borderRadius: BorderRadius.all(
                        Radius.circular(18.0),
                      ),
                      color: Color(0x155665df),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              child: const Text(
                                "Assigned: 20",
                                style:
                                    TextStyle(color: Colors.black, fontSize: 14),
                              ),
                            ),
                            Container(
                              child: const Text(
                                "Pending: 10",
                                style:
                                    TextStyle(color: Colors.black, fontSize: 14),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              child: const Text(
                                "Dispatch: 20",
                                style:
                                    TextStyle(color: Colors.black, fontSize: 14),
                              ),
                            ),
                            Container(
                              child: const Text(
                                "Informed: 20",
                                style:
                                    TextStyle(color: Colors.black, fontSize: 14),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),

                     Padding(
                       padding: const EdgeInsets.only(left:0.0,right: 0),
                       child: Row(
                         children: [
                           Container(
                            height: 40,
                            width: MediaQuery.of(context).size.width/4,
                            child: ElevatedButton(
                              onPressed: () async {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const DispatchMasterScreen(),
                                  ),
                                );
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
                                  fontSize: 14,
                                ),
                              ),
                            ),
                    ),
                           SizedBox(width: 10,),
                           Container(
                             height: 40,
                             width: MediaQuery.of(context).size.width/3,
                             child: ElevatedButton(
                               onPressed: () async {
                                 Navigator.push(
                                   context,
                                   MaterialPageRoute(
                                     builder: (context) => const AttemptListScreen(),
                                   ),
                                 );
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
                                 "Attempted",
                                 style: TextStyle(
                                   fontWeight: FontWeight.bold,
                                   fontSize: 18,
                                 ),
                               ),
                             ),
                           ),
                           SizedBox(width: 10,),
                           Container(
                             height: 40,
                             width: MediaQuery.of(context).size.width/4,
                             child: ElevatedButton(
                               onPressed: () async {
                                 Navigator.push(
                                   context,
                                   MaterialPageRoute(
                                     builder: (context) => const DeliverListScreen(),
                                   ),
                                 );
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
                                 "Delivered",
                                 style: TextStyle(
                                   fontWeight: FontWeight.bold,
                                   fontSize: 13,
                                 ),
                               ),
                             ),
                           ),
                         ],
                       ),
                     ),


                ],
              ),
            ),
          )),
    );
  }
}

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double barHeight = 50.0;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 200.0);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
        child: ClipPath(
          clipper: WaveClip(),
          child: Container(
              color: const Color.fromRGBO(33, 150, 243, 1),
              height: MediaQuery.of(context).size.height/3,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(
                          image: AssetImage("assets/images/Emblem.png"),
                          fit: BoxFit.contain,
                        ),
                      ),
                      // child: SvgPicture.asset(
                      //   "assets/images/Emblem.svg",
                      //   semanticsLabel: "Emblem logo",
                      //   fit: BoxFit.contain,
                      // ),
                    ),
                     Padding(
                      padding: EdgeInsets.only(top: 25),
                      child: Text(
                        " ${DateFormat('yyyy-MM-dd'+ '   hh:m').format(DateTime.now())}  ",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: InkWell(
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Center(
                              child: FaIcon(FontAwesomeIcons.qrcode)),
                        ),
                      ),
                    )
                  ],
                ),
              )),
        ),
        preferredSize: const Size.fromHeight(kToolbarHeight + 100));
  }
}

class WaveClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    final lowPoint = size.height - 30;
    final highPoint = size.height - 60;

    path.lineTo(0, size.height);
    path.quadraticBezierTo(size.width / 4, highPoint, size.width / 2, lowPoint);
    path.quadraticBezierTo(
        3 / 4 * size.width, size.height, size.width, lowPoint);
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
