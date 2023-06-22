


import 'dart:math';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PickupConfirmPage2 extends StatefulWidget{


  final String PickUpCode;
  final String DroppingCode;
  final String PickedBy;
  final String RequestID;
  final String Drivername;
  final String DrivingLicenseNumb;
  final String VehicleReg;


   PickupConfirmPage2({super.key, required this.PickUpCode,required this.DroppingCode,required this.PickedBy,required this.RequestID, required this.Drivername, required this.DrivingLicenseNumb, required this.VehicleReg});

  @override
  State<PickupConfirmPage2> createState() => _PickupConfirmPage2State();
}

class _PickupConfirmPage2State extends State<PickupConfirmPage2> {
  FirebaseDatabase database = FirebaseDatabase.instance;

  DatabaseReference ref = FirebaseDatabase.instance.ref("Driver_profile");




  // int randNumb(){
  @override
  Widget build(BuildContext context) {








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

            Text("Driver : ${widget.Drivername}",

              style: GoogleFonts.openSans(
                  fontSize: 21,
                  fontWeight: FontWeight.bold
              ),


            ),

            Text("Driver Phone Number : ${widget.PickedBy}",

              style: GoogleFonts.openSans(
                  fontSize: 21,
                  fontWeight: FontWeight.bold
              ),


            ),

            Text("Registration Number : ${widget.VehicleReg}",

              style: GoogleFonts.openSans(
                  fontSize: 21,
                  fontWeight: FontWeight.bold
              ),


            ),



            Text("Driving License  No : ${widget.DrivingLicenseNumb}",

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
            Text("${widget.PickUpCode}",

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
            Text("${widget.DroppingCode}",

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