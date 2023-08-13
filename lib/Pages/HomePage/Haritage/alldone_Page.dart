


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AllDone extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [



          Image.asset(
            "assets/images/done.gif",
            // height: 125.0,
            // width: 125.0,
          ),

          Text("Trip request sent...",
            style: GoogleFonts.openSans(
              fontSize: 18,
              fontWeight: FontWeight.bold
            ),
          ),

        ],
      ),
    );
  }

}