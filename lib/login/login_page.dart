import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:postal_app/TabPage/tab_pages.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../constant/api_constant.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController nametextEditingController = TextEditingController();
  TextEditingController passwordtextEditingController = TextEditingController();

  bool isChecked = false;
  bool _passwordVisible = false;

  void validateForm() async {
    if (kDebugMode) {}
    if (nametextEditingController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Username Required");
    } else {
      login();
    }
  }

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.white;
    }

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xff86a2d7),
                  Color.fromARGB(255, 78, 49, 206),
                ],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 100, left: 35),
                  child: const Text(
                    "Welcome! ",
                    style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 42),
                  child: const Text(
                    "Sign in to Continue.",
                    style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Container(
                  width: 250,
                  margin: const EdgeInsets.only(left: 50),
                  child: TextField(
                    controller: nametextEditingController,
                    decoration: InputDecoration(
                        label: const Text("Username"),
                        labelStyle:
                            const TextStyle(color: Colors.white, fontSize: 18),
                        contentPadding: const EdgeInsets.all(15),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                  ),
                ),
                const SizedBox(
                  height: 25.0,
                ),
                Container(
                  width: 250,
                  margin: const EdgeInsets.only(left: 50),
                  child: TextField(
                    obscureText: !_passwordVisible,
                    enableSuggestions: false,
                    autocorrect: false,
                    controller: passwordtextEditingController,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(
                            _passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Theme.of(context).canvasColor,
                          ),
                          onPressed: () {
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          },
                        ),
                        label: const Text("Password"),
                        labelStyle:
                            const TextStyle(color: Colors.white, fontSize: 18),
                        contentPadding: const EdgeInsets.all(15),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Forget Password?",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 35),
                  child: Row(
                    children: [
                      Checkbox(
                        shape: const CircleBorder(),
                        //tristate: true,
                        checkColor: Colors.black,
                        fillColor: MaterialStateProperty.resolveWith(getColor),
                        value: isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked = value!;
                          });
                        },
                      ),
                      Container(
                        child: const Text(
                          "Remember me",
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Center(
                  child: Container(
                    width: 90,
                    decoration: BoxDecoration(
                        color: Colors.blue[800],
                        borderRadius: BorderRadius.circular(20)),
                    child: ElevatedButton(
                        onPressed: () async {
                          validateForm();
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => const TabPage()));
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 10,
                          // primary: Colors.white,
                          minimumSize: const Size.fromHeight(45),
                          maximumSize: const Size.fromHeight(45),
                        ),
                        child: const Text(
                          "Sign In",
                          style: TextStyle(
                            color: Colors.black,
                            // fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> login() async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      //   'Content-Length': '122',
      //   'Host': '',
      //   'User-Agent': '',
      //   'Connection': 'keep-alive',
    };
    final msg = jsonEncode({
      "username": nametextEditingController.text,
    });
    var response = await http.post(
      Uri.parse(baseUrl + "/login"),
      headers: headers,
      body: msg,
    );
    log(response.body);

    try {
      if (response.statusCode == 200) {
        final SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        sharedPreferences.setInt(
            "user_id", json.decode(response.body)['userId']);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const TabPage()));
      } else {
        Fluttertoast.showToast(msg: "Something went error");
        // Navigator.push(context,
        //     MaterialPageRoute(builder: (context) => const LoginScreen()));

      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
