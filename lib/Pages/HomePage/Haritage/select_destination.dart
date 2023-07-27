



import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:google_fonts/google_fonts.dart';

class SelectDestinetion extends StatefulWidget{
  @override
  State<SelectDestinetion> createState() => _SelectDestinetionState();
}

class _SelectDestinetionState extends State<SelectDestinetion> {


  final database = FirebaseDatabase.instance.reference();

    List<dynamic> itemlist=[];


   void addlist(){
     itemlist.addAll([

       false,
       false,
       false

     ]);
   }



  @override
  Widget build(BuildContext context) {

    Query dbref=FirebaseDatabase.instance.ref("Heritage");







    // TODO: implement build
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [



            ListView.builder(
              physics: ScrollPhysics(),
              shrinkWrap: true,
              itemCount: itemlist.length,
                itemBuilder: (context,index){

                return CheckboxListTile(
                  title:  Text('${itemlist[index]['Name']}'),
                  value: itemlist[index]['checked'],
                  onChanged: (bool? value) {
                    setState(() {
                      itemlist[index]['checked'] = value!;
                    });
                  },
                  //secondary: Icon(Icons.hourglass_empty),
                );




                }


                )





          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    database.child("Heritage").onChildAdded.listen((event) {
      setState(() {
        itemlist.add(event.snapshot.value);
      });
    });
  }


}