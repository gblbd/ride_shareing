


import 'dart:math';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PickupConfirmPage extends StatefulWidget{


  final String PickUpCode;
  final String DroppingCode;
  final String PickedBy;
  final String RequestID;

   PickupConfirmPage({super.key, required this.PickUpCode, required this.DroppingCode, required this.PickedBy, required this.RequestID});

  @override
  State<PickupConfirmPage> createState() => _PickupConfirmPageState();
}

class _PickupConfirmPageState extends State<PickupConfirmPage> {
  FirebaseDatabase database = FirebaseDatabase.instance;

  DatabaseReference ref = FirebaseDatabase.instance.ref("Driver_profile");



  String Drivername="";

  String Vehicle_Registration_Number="";

  String DrivingLicenceNo="";

  Future<void> getDriverdt() async {

     Drivername="${await ref.child(widget.PickedBy).child("Dprofile").child("Dfull_Name").get()}";
     Vehicle_Registration_Number="${await ref.child(widget.PickedBy).child("Dprofile").child("Vehicle_Registration_Number").get()}";
     DrivingLicenceNo="${await ref.child(widget.PickedBy).child("Dprofile").child("Driving_licence_Number").get()}";


     setState(() {

     });

  }



  @override
  void initState() {

    getDriverdt();
    // TODO: implement initState
    super.initState();
  }






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


            Container(


              decoration: BoxDecoration(
                color: Colors.red.shade100,
                borderRadius: BorderRadius.circular(10)
              ),


              child: Column(
                children: [
                  Text("Driver : ${Drivername}",

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



                ],
              ),
            ),





            // Text("Registration Number : ${Vehicle_Registration_Number}",
            //
            //   style: GoogleFonts.openSans(
            //       fontSize: 21,
            //       fontWeight: FontWeight.bold
            //   ),
            //
            //
            // ),





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