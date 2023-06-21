


import 'dart:math';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PickupConfirmPage2 extends StatelessWidget{


  final PickUpCode;
  final DroppingCode;
  final PickedBy;
  final RequestID;

   PickupConfirmPage2({super.key, required this.PickUpCode,required this.DroppingCode,required this.PickedBy,required this.RequestID});


  FirebaseDatabase database = FirebaseDatabase.instance;
  DatabaseReference ref = FirebaseDatabase.instance.ref("Driver_profile");


  // int randNumb(){
  //
  //   int i=Random().nextInt(999999);
  //   if(i<100000){
  //     i=i+100000;
  //   }
  //
  //   return i;
  // }


  @override
  Widget build(BuildContext context) {



    String Drivername="${ref.child(PickedBy).child("Dprofile").child("Dfull_Name").get()}";
    String Vehicle_Registration_Number="${ref.child(PickedBy).child("Dprofile").child("Vehicle_Registration_Number").get()}";
    String DrivingLicenceNo="${ref.child(PickedBy).child("Dprofile").child("Driving_licence_Number").get()}";





    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Confirm picKup"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Text("Driver : ${Drivername}",

              style: GoogleFonts.openSans(
                  fontSize: 21,
                  fontWeight: FontWeight.bold
              ),


            ),

            Text("Driver Phone Number : ${PickedBy}",

              style: GoogleFonts.openSans(
                  fontSize: 21,
                  fontWeight: FontWeight.bold
              ),


            ),

            Text("Registration Number : ${Vehicle_Registration_Number}",

              style: GoogleFonts.openSans(
                  fontSize: 21,
                  fontWeight: FontWeight.bold
              ),


            ),

            Text("Registration Number : ${Vehicle_Registration_Number}",

              style: GoogleFonts.openSans(
                  fontSize: 21,
                  fontWeight: FontWeight.bold
              ),


            ),

            Text("Driving License  No : ${DrivingLicenceNo}",

              style: GoogleFonts.openSans(
                  fontSize: 21,
                  fontWeight: FontWeight.bold
              ),


            ),



            Text("Your Pickup code is :",

              style: GoogleFonts.openSans(
                fontSize: 21,
                fontWeight: FontWeight.bold
              ),


            ),
            Text("${PickUpCode}",

              style: GoogleFonts.openSans(
                fontSize: 30,
                fontWeight: FontWeight.bold
              ),

            ),





            Text("Your Dropping code is :",

              style: GoogleFonts.openSans(
                  fontSize: 21,
                  fontWeight: FontWeight.bold
              ),


            ),
            Text("${DroppingCode}",

              style: GoogleFonts.openSans(
                  fontSize: 30,
                  fontWeight: FontWeight.bold
              ),

            ),





          ],
        ),
      ),
    );
  }

}