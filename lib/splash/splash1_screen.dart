import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learncloud/splash/spalash2_screen.dart';

class splash1 extends StatefulWidget {
  const splash1({Key? key}) : super(key: key);

  @override
  State<splash1> createState() => _splash1State();
}

class _splash1State extends State<splash1> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashchecklogin.login(context);
  }

  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Splash1'),centerTitle: true,automaticallyImplyLeading: false,),
    body: Center(child: Text('welcome to splash'),),);
  }
}



