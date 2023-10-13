import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learncloud/Utls.dart';

import '../firebase_services/Postscreen.dart';
import 'otpclass.dart';

class Login {


 void login(BuildContext context,TextEditingController texteditingcontroller)async {
   final auth=FirebaseAuth.instance;
   if(texteditingcontroller.text.isEmpty==false){
     await auth.verifyPhoneNumber(
         phoneNumber: texteditingcontroller.text,

         verificationCompleted: (_){
           Utils().toastMessage('vefified');

         },
         verificationFailed: (e){   Utils().toastMessage(e.toString());

         },
         codeSent: (String verificationId , int? token){    Utils().toastMessage('code Send');
           Navigator.push(context,
               MaterialPageRoute(
                   builder: (context) => verification(id:verificationId,)));

         },
         codeAutoRetrievalTimeout: (e){
           Utils().toastMessage('Timeout hold a second');

         });}
   else Utils().toastMessage('Enter Mobile Number');
  }



}

