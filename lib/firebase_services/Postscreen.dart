import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:learncloud/firebase_services/add_post.dart';
import 'package:learncloud/loginmaini.dart';
import '../Utls.dart';
class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final auth=FirebaseAuth.instance;
  final ref = FirebaseDatabase.instance.ref('Posts');
  final boxcontoller=TextEditingController();
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    ref.onValue.listen((event) { });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text('Posts'),
      centerTitle: true,


    actions: [IconButton(onPressed: (){
    auth.signOut().then((value){    Utils().toastMessage('logout ');
    Navigator.push(context,
    MaterialPageRoute(builder: (context) => const loginmain()));
    }).onError((error, stackTrace){
      Utils().toastMessage(error.toString());
    });
    }, icon: const Icon(Icons.logout_outlined),),
    const SizedBox(width: 10,),]),
      floatingActionButton: FloatingActionButton(child: const Icon(Icons.add),
      onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) =>const AddPosts()));},),
      body: Column(
        children: [
          TextFormField(
            controller: boxcontoller,
            onChanged: (value){setState(() {

            });},
            decoration: InputDecoration(
                hintText: 'Search something here' ,
                border: OutlineInputBorder()
            ),
          ),
          Expanded(
            child: FirebaseAnimatedList(
                query: ref,
                defaultChild: Text('Loading'),
                itemBuilder: (context, snapshot, animation, index){

                final filter = snapshot.child('title').value.toString();
                if (filter.toLowerCase().contains(
                    boxcontoller.text.toLowerCase().toString())) {
                  return ListTile(
                    title: Text(filter),
                    subtitle: Text(snapshot
                        .child('id')
                        .value
                        .toString()),
                    trailing: PopupMenuButton(
                        color: Colors.white,
                        elevation: 4,
                        padding: EdgeInsets.zero,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(2))),
                        icon: Icon(Icons.more_vert,color: Colors.black,),
                        itemBuilder: (context) =>
                        [
                          PopupMenuItem(
                            value: 1,
                            child: PopupMenuItem(
                              value: 2,
                              child: ListTile(
                                onTap: () {

                                  ref.child(snapshot.child('id').value.toString()).update(
                                      {
                                        'title' : 'hello world'
                                      }).then((value){

                                  }).onError((error, stackTrace){
                                    Utils().toastMessage(error.toString());
                                  });  Navigator.pop(context);


                                },
                                leading: Icon(Icons.edit),
                                title: Text('Edit'),
                              ),
                            ),
                          ),
                          PopupMenuItem(
                            value: 2,
                            child: ListTile(
                              onTap: () {
                                Navigator.pop(context);

                                // ref.child(snapshot.child('id').value.toString()).update(
                                //     {
                                //       'ttitle' : 'hello world'
                                //     }).then((value){
                                //
                                // }).onError((error, stackTrace){
                                //   Utils().toastMessage(error.toString());
                                // });
                                ref.child(snapshot
                                    .child('id')
                                    .value
                                    .toString()).remove().then((value) {

                                }).onError((error, stackTrace) {
                                  Utils().toastMessage(error.toString());
                                });
                              },
                              leading: Icon(Icons.delete_outline),
                              title: Text('Delete'),
                            ),
                          ),
                        ]),
                  );
                }
                else if (boxcontoller.text.isEmpty) {
                  ListTile(
                    title: Text(filter),
                    subtitle: Text(snapshot
                        .child('id')
                        .value
                        .toString()),
                    trailing: PopupMenuButton(
                        color: Colors.black,
                        elevation: 4,
                        padding: EdgeInsets.zero,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(2))),
                        icon: Icon(Icons.more_vert,),
                        itemBuilder: (context) =>
                        [
                          PopupMenuItem(
                            value: 1,
                            child: PopupMenuItem(
                              value: 2,
                              child: ListTile(
                                onTap: () {
                                  ref.child(snapshot.child('id').value.toString()).update(
                                           {
                                             'title' : 'hello world'
                                           }).then((value){

                                       }).onError((error, stackTrace){
                                         Utils().toastMessage(error.toString());
                                       });
                               setState(() {

                               });

                                },
                                leading: Icon(Icons.edit),
                                title: Text('Edit'),
                              ),
                            ),
                          ),
                          PopupMenuItem(
                            value: 2,
                            child: ListTile(
                              onTap: () {
                                Navigator.pop(context);

                                // ref.child(snapshot.child('id').value.toString()).update(
                                //     {
                                //       'ttitle' : 'hello world'
                                //     }).then((value){
                                //
                                // }).onError((error, stackTrace){
                                //   Utils().toastMessage(error.toString());
                                // });
                                ref.child(snapshot
                                    .child('id')
                                    .value
                                    .toString()).remove().then((value) {

                                }).onError((error, stackTrace) {
                                  Utils().toastMessage(error.toString());
                                });
                              },
                              leading: Icon(Icons.delete_outline),
                              title: Text('Delete'),
                            ),
                          ),
                        ]),
                  );
                }

                  return Container();



    }

            ),
          ),
        ],
      ),

    );
  }

}


/*  ref.child(snapshot
    .child('id')
.value
    .toString()).update(
{
'title': 'Awesome World'
}).then((value) {

}).onError((error, stackTrace) {
Utils().toastMessage(error.toString());
});

 */

