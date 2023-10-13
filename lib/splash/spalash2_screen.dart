import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learncloud/firebase_services/Postscreen.dart';
import '../loginmaini.dart';
class splashchecklogin{

  splashchecklogin.login(BuildContext context){

    final auth=FirebaseAuth.instance;
    final user=auth.currentUser;
    if(user!=null){
      Timer(const Duration(seconds: 3),
              ()=> Navigator.push(context, MaterialPageRoute(builder: (context) =>PostScreen())) );
    }
    else {
      Timer(const Duration(seconds: 3),
              ()=> Navigator.push(context, MaterialPageRoute(builder: (context) =>loginmain())) );
    }
    }
  }


