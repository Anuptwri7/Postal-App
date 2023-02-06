
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:postal_app/TabPage/tab_pages.dart';
import 'package:postal_app/login/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class AuthCheckPage extends StatefulWidget {
  const AuthCheckPage({Key? key}) : super(key: key);

  @override
  _AuthCheckPageState createState() => _AuthCheckPageState();
}

class _AuthCheckPageState extends State<AuthCheckPage> {

  @override
  void initState() {
    checkRefresh();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(

        ),
      ),

    );

  }
  Future<void> checkRefresh() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    log(pref.getString("name").toString());
    // log(response.body);
    String name = pref.getString("organizationId").toString();
    if(name=='null'){
      Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=>LoginScreen()));
    }else{
      Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=>TabPage()));
    }
  }
}

