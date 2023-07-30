



import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ride_sharing/Pages/HomePage/Haritage/ConfirmLocation.dart';

class SelectDestinetion extends StatefulWidget{
  @override
  State<SelectDestinetion> createState() => _SelectDestinetionState();
}

class _SelectDestinetionState extends State<SelectDestinetion> {


  final database = FirebaseDatabase.instance.reference();

    List<dynamic> itemlist=[];
    List<dynamic> selectedItem=[];


   // void addlist(){
   //   itemlist.addAll([
   //
   //     false,
   //     false,
   //     false
   //
   //   ]);
   // }



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
                      if(value==true){
                        selectedItem.add(itemlist[index]);
                      }
                      else{
                        selectedItem.remove(itemlist[index]);

                      }

                    });
                  },
                  //secondary: Icon(Icons.hourglass_empty),
                );




                }


                ),


            SizedBox(
              height: 70,
            )





          ],
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: Container(
        margin: EdgeInsets.fromLTRB(0, 0, 0, 21),
        child: FloatingActionButton.extended(

          onPressed: (){

            Get.to(ConfirmLocation(selectedItem: selectedItem),
                duration: Duration(milliseconds: 500), //duration of transitions, default 1 sec
                transition: Transition.rightToLeft );


          },
          label: Text("Submit"),
          hoverElevation: 100,
          icon: Icon(Icons.done_all),
          splashColor: Colors.purple,

          backgroundColor: Colors.pink.shade500,
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