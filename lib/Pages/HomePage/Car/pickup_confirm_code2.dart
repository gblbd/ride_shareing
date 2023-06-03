


import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PickupConfirmPage2 extends StatelessWidget{

  int randNumb(){

    int i=Random().nextInt(999999);
    if(i<100000){
      i=i+100000;
    }

    return i;
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
            Text("Your Pickup code is :",

              style: GoogleFonts.openSans(
                fontSize: 21,
                fontWeight: FontWeight.bold
              ),


            ),
            Text("${randNumb()}",

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