

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:learncloud/Utls.dart';
import 'package:learncloud/firebase_services/Postscreen.dart';
class verification extends StatefulWidget {
final String id;
  verification({Key? key,required this.id}) : super(key: key);

  @override
  State<verification> createState() => _verificationState();
}

class _verificationState extends State<verification> {

  final auth=FirebaseAuth.instance;
  final textcontroller=TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title:Text('Enter Code'),centerTitle: true,),body:Column(

    children: [  SizedBox(height: 40,width: 10,),Row(
    children: [

    Text("Sms Code\n",style: TextStyle(fontSize: 22,
    fontWeight: FontWeight.bold,
    color: Colors.black45  ),),
    ],
    ),Container(width:400,child: TextFormField(keyboardType: TextInputType.number,
      controller:textcontroller,



    ),

    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),

    shape: BoxShape.rectangle,
    border: Border.all(color: Colors.black)


    ),
    ),Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    InkWell(child:Text('signin',style: TextStyle(fontSize: 20,
    fontWeight: FontWeight.bold,color: Colors.green),),
    onTap: () async {
      final credential=PhoneAuthProvider.credential(verificationId:widget.id,
          smsCode:textcontroller.text);
      try {
        await auth.signInWithCredential(credential);
        Navigator.push(context, MaterialPageRoute(builder: (context)=>PostScreen()));
      }
      catch(e){

        Utils().toastMessage(e.toString());
      }

    },),
    SizedBox(width: 15,),



    ],
    )],
    )    );
  }
}
