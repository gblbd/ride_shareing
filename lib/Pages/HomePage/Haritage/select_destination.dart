



import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ride_sharing/Pages/HomePage/Haritage/ConfirmLocation.dart';

import 'ExampleConfirmLocation.dart';

class SelectDestinetion extends StatefulWidget{
  final double Rate;

  const SelectDestinetion({super.key, required this.Rate});
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
      appBar: AppBar(
        backgroundColor: Colors.red.shade100,
        title: Text('Tour Place Selection',style: TextStyle(color: Colors.black),),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
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
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: Container(
        margin: EdgeInsets.fromLTRB(0, 0, 0, 21),
        child: FloatingActionButton.extended(

          onPressed: (){

            if(selectedItem.length>=0)
              {
                Get.to(ExampleConfirmLocation(
                  selectedItem: selectedItem,
                  Rate: widget.Rate,
                ),
                    duration: Duration(milliseconds: 500), //duration of transitions, default 1 sec
                    transition: Transition.rightToLeft );
              }
            else{

            }




          },


          label: Text("Submit"),
          hoverElevation: 100,
          icon: Icon(Icons.done_all),
          splashColor: Colors.purple.shade200,

          backgroundColor: Colors.red.shade200,
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