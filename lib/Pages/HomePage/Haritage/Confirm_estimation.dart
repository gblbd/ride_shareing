


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ride_sharing/Pages/HomePage/Haritage/alldone_Page.dart';

class ConformEstimation extends StatelessWidget{

  final String Starting_Date;
  final String returningDate;

  final String Cost;
  final String TotalDistance;
  final List<dynamic>selectedItem;

  const ConformEstimation({super.key, required this.Starting_Date, required this.returningDate, required this.Cost, required this.TotalDistance, required this.selectedItem});


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(
        children: [




          Text("your selected place : ",
            style: GoogleFonts.openSans(
                fontSize: 20,
                fontWeight: FontWeight.bold
            ),
          ),

          ListView.builder(
            shrinkWrap: true,
              itemCount: selectedItem.length,
              itemBuilder: (context,index){
                return ListTile(
                  title: Text("${selectedItem[index]["Name"]}",
                    style: GoogleFonts.openSans(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                    ),
                  ),

                  subtitle: Text("${selectedItem[index]["address"]}",
                    style: GoogleFonts.openSans(
                        fontSize: 14,
                        fontWeight: FontWeight.bold
                    ),
                  ),

                );
              }
          ),



          ListTile(
            title: Text("Total Distance : ",
              style: GoogleFonts.openSans(
                  fontSize: 18,
                  fontWeight: FontWeight.bold
              ),
            ),
            subtitle: Text("1002 KM",
              style: GoogleFonts.openSans(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
          ),

          ListTile(
            title: Text("total cost : ",
              style: GoogleFonts.openSans(
                  fontSize: 18,
                  fontWeight: FontWeight.bold
              ),
            ),
            subtitle: Text("19500",
              style: GoogleFonts.openSans(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),


          Text("Driver's name : "),






          // FirebaseAnimatedList(
          //   physics: ScrollPhysics(),
          //   shrinkWrap: true,
          //   query: dbref,
          //   reverse: false,
          //   itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double> animation, int index) {
          //
          //     return Container(
          //       margin: EdgeInsets.all(8),
          //       child: ListTile(
          //
          //         onTap: (){
          //           Get.to(ConformEstimation(),
          //               duration: Duration(milliseconds: 500), //duration of transitions, default 1 sec
          //               transition: Transition.rightToLeft );
          //
          //         },
          //
          //         title: Text("Driver's Name : ${snapshot.child("Driver_Name").value.toString()}"),
          //         subtitle: Column(
          //           children: [
          //             Text("Car Model : ${snapshot.child("carModel").value.toString()} ${snapshot.child("Car_Seat").value.toString()} Seater"),
          //             Text("Phone : ${snapshot.child("phone").value.toString()}")
          //           ],
          //         ),
          //       ),
          //
          //     );
          //   },
          // ),


          ElevatedButton(onPressed: (){




            // Get.to(AllDone(),
            //     duration: Duration(milliseconds: 500), //duration of transitions, default 1 sec
            //     transition: Transition.rightToLeft );
            //


          }, child: Text("Send a booking request")),





        ],
      ),
    );
  }

}