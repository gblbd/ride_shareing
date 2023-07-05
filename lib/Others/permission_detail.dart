

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'LoginWithPhoneNum.dart';

class PermissionDetail extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Permission Detail"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Location : ",

                style: GoogleFonts.openSans(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                ),


              ),
              Text("\nThis app will use your location data for app functionality and for best user experience."
                  " this location data will be collected only when you use the app."
                  " The location data collection doesn't run or work in the background. "
                  "It doesnt collect or share data when the app will remain idle. "
                  "This location data is used for the feature of finding your pickup point. "
                  " location, destinetion and calculating the distance and estimating fare of ride\n"
                  "this loction data is used in : \n # ride sharing with car feature\n # Ride sharing with bike feature"
                  "this app never provide any ads/support or advertising/support ads.",

                style: GoogleFonts.openSans(
                    fontSize: 16,
                    //fontWeight: FontWeight.bold
                ),

              ),


              Text("User Data Safty :",

                style: GoogleFonts.openSans(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                ),

              ),

              Text("\nMy road never use, analyze or share user data. "
                  "The data transfered through a encrypted channel with firebase security \n\n\n\n If you are agree with us please press the agree button and enjoy the best experience",

                style: GoogleFonts.openSans(
                  fontSize: 16,
                  //fontWeight: FontWeight.bold
                ),

              ),

              SizedBox(height: 25,),


              Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16,right: 16),
                  child: Container(
                    height: 45,
                    width: 350,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.0),
                        color:Colors.red
                    ),
                    child: TextButton(
                      onPressed: () {

                        Navigator.pop(context);


                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => LoginWithPhoneNum())
                            );







                      },
                      child: Text('Agree',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white
                        ),
                      ),
                    ),
                  ),
                ),
              ),




            ],
          ),
        ),
      ),
    );
  }

}