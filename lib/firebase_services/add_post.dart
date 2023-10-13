import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:learncloud/Utls.dart';

class AddPosts extends StatefulWidget {
  const AddPosts({Key? key}) : super(key: key);

  @override
  State<AddPosts> createState() => _AddPostsState();
}

class _AddPostsState extends State<AddPosts> {

  final _controller=TextEditingController();
  final auth=FirebaseAuth.instance;

  final ref=FirebaseDatabase.instance.ref('Posts');

  bool loading =false;
  @override

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('Addposts'),centerTitle: true,),
    body: Center(child: Column(
      children: [TextFormField(
controller: _controller,
        maxLength: 250,
        maxLines: 4,
        decoration: const InputDecoration(
            hintText: 'What is in your mind?' ,
            border: OutlineInputBorder()
        ),
    ),
        InkWell(onTap: ()  {
          setState((){
          loading=true;
        });

        String id  = DateTime.now().millisecondsSinceEpoch.toString() ;
        ref.child(id).set({

          'title' : _controller.text.toString() ,
          'id' :id,


        }).then((value){
          Utils().toastMessage('Post added');
          setState(() {
            loading = false ;
          });
        }).onError((error, stackTrace){
          Utils().toastMessage(error.toString());
          setState(() {
            loading = false ;
          });
        });
      Timer(const Duration(seconds: 1),(){Navigator.pop(context);});

          },
          child: Container(width: 150,height: 40,
            color:Colors.pink,
            child: Center(child: loading?const CircularProgressIndicator(strokeWidth: 3,color: Colors.white,):
            const Text('Add',style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold),)),
              ),
        )


      ],
    ),),
    );

  }
}


