import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:learncloud/Firebase_Auth/otpclass.dart';
import 'package:learncloud/Utls.dart';

import 'Firebase_Auth/loginscreen.dart';
class loginmain extends StatefulWidget {
  const loginmain({Key? key}) : super(key: key);

  @override
  State<loginmain> createState() => _loginmainState();
}

class _loginmainState extends State<loginmain> {
  final texteditingcontroller= TextEditingController();
  final auth=FirebaseAuth.instance;
  Widget build(BuildContext context) {
  return WillPopScope(
 onWillPop: () async {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content:
        Text('Enter the mobile number'),
        backgroundColor: Colors.red,
      ),
    );
    return false;} ,
    child: Scaffold(appBar: AppBar(title:Text('MyDB'),centerTitle: true,
      automaticallyImplyLeading: false,),body:Column(

     children: [  SizedBox(height: 40,width: 10,),Row(
       children: [

         Text("Enter the Mobile Number\n",style: TextStyle(fontSize: 22,
         fontWeight: FontWeight.bold,
         color: Colors.black45  ),),
       ],
     ),Container(width:400,child: TextFormField(keyboardType: TextInputType.number,


       controller:texteditingcontroller,
     ),

       decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),

         shape: BoxShape.rectangle,
         border: Border.all(color: Colors.black)


       ),
     ),Row(
       mainAxisAlignment: MainAxisAlignment.center,
       children: [
         InkWell(child:Text('LogIn',style: TextStyle(fontSize: 20,
         fontWeight: FontWeight.bold,color: Colors.green),),
           onTap: ()async{
             Login().login(context, texteditingcontroller);
           })

       ],
    ),

        SizedBox(width: 15,),




     ],
 )
      ),
  );
  }
}
