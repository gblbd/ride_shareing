


import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ride_sharing/Pages/HomePage/Haritage/Confirm_estimation.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class EstimationPage extends StatefulWidget{





  @override
  State<EstimationPage> createState() => _EstimationPageState();
}

class _EstimationPageState extends State<EstimationPage> {


  @override
  Widget build(BuildContext context) {

    Query dbref=FirebaseDatabase.instance.ref("Heritage_Driver").child("Driver");

    // TODO: implement build
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [


            ListTile(
              title: Text("Total Estimated distance: "),
              subtitle: Text("1570 KM "),
            ),

            ListTile(
              title: Text("Starting Date : "),

              onTap: (){
                CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.date,
                  initialDateTime: DateTime(1969, 1, 1),
                  onDateTimeChanged: (DateTime newDateTime) {
                    // Do something
                  },
                );
              },
            ),

            SizedBox(
              height: 200,
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.date,
                initialDateTime: DateTime.now(),
                onDateTimeChanged: (DateTime newDateTime) {
                  // Do something
                },
              ),
            ),


            ListTile(
              title: Text("Total Cost : "),

            ),



            Text("Available Driver :"),



            FirebaseAnimatedList(
              physics: ScrollPhysics(),
              shrinkWrap: true,
              query: dbref,
              reverse: false,
              itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double> animation, int index) {

                return Container(
                  margin: EdgeInsets.all(8),
                  child: ListTile(

                    onTap: (){
                      Get.to(ConformEstimation(),
                          duration: Duration(milliseconds: 500), //duration of transitions, default 1 sec
                          transition: Transition.rightToLeft );

                    },

                      title: Text("Driver's Name : ${snapshot.child("Driver_Name").value.toString()}"),
                    subtitle: Column(
                      children: [
                        Text("Car Model : ${snapshot.child("carModel").value.toString()} ${snapshot.child("Car_Seat").value.toString()} Seater"),
                        Text("Phone : ${snapshot.child("phone").value.toString()}")
                      ],
                    ),
                  ),

                );
              },
            )









          ],
        ),
      ),
    );
  }
}