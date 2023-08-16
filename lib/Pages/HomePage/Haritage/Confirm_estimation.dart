


import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ride_sharing/Pages/HomePage/Haritage/alldone_Page.dart';

class ConformEstimation extends StatefulWidget{




  final String Starting_Date;
  final String returningDate;
  final String pickupPoint;
  final double pickupLat;
  final double pickupLong;
  final double Rate;
  final String carModel;

  final String Cost;
  final String TotalDistance;
  final List<dynamic>selectedItem;

   ConformEstimation({super.key, required this.Starting_Date, required this.returningDate, required this.Cost, required this.TotalDistance, required this.selectedItem, required this.pickupPoint, required this.pickupLat, required this.pickupLong, required this.Rate, required this.carModel});

  @override
  State<ConformEstimation> createState() => _ConformEstimationState();
}

class _ConformEstimationState extends State<ConformEstimation> {
  String RequestID="";
  double dist=0;

  DatabaseReference rf = FirebaseDatabase.instance.ref("Haritage_Tour_Request");

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [







            ListTile(
              title: Text("Total Distance : ",
                style: GoogleFonts.openSans(
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                ),
              ),
              subtitle: Text("${dist/1000} KM.",
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
              subtitle: Text("${(dist/1000)*widget.Rate} BDT",
                style: GoogleFonts.openSans(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),


            ListTile(
              title: Text("Starting date : ",
                style: GoogleFonts.openSans(
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                ),
              ),
              subtitle: Text("${widget.Starting_Date}",
                style: GoogleFonts.openSans(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
            ListTile(
              title: Text("Returning Date : ",
                style: GoogleFonts.openSans(
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                ),
              ),
              subtitle: Text("${widget.returningDate}",
                style: GoogleFonts.openSans(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),

            ListTile(
              title: Text("Pickup Point : ",
                style: GoogleFonts.openSans(
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                ),
              ),
              subtitle: Text("${widget.pickupPoint}",
                style: GoogleFonts.openSans(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),






            Text("your selected place : ",
              style: GoogleFonts.openSans(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),
            ),

            ListView.builder(
                shrinkWrap: true,
                itemCount: widget.selectedItem.length,
                physics: ScrollPhysics(),
                itemBuilder: (context,index){
                  return ListTile(
                    title: Text("${widget.selectedItem[index]["Name"]}",
                      style: GoogleFonts.openSans(
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                      ),
                    ),

                    subtitle: Text("${widget.selectedItem[index]["address"]}",
                      style: GoogleFonts.openSans(
                          fontSize: 14,
                          fontWeight: FontWeight.bold
                      ),
                    ),

                  );
                }
            ),





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






            // ElevatedButton(
            //     onPressed: (){
            //
            //
            //
            //   DatabaseReference senderPostRef = rf.child("ride_request").push();
            //   senderPostRef.set({
            //     "Destination":"ljedj",
            //     "Traveller_Name":"ledmmd",
            //     "Traveller_Phone_number": "01797609439",
            //     "PickUp": "e3ioje",
            //     "Cost":"${Cost}",
            //     "traveller_Phone":"01797609439",
            //     "Starting_date":"${Starting_Date}",
            //     "destinationLat": "dlwlmd3",
            //     "destinationLong": "flwelflf",
            //     "PickupLat": "lemdewdm",
            //     "PicupLong": "ehiweiewi",
            //     "Distance":"${TotalDistance}",
            //     "Fare":"edjoe3",
            //     "pickUpStat":false,
            //     "driver_name":"enknwkn",
            //     "Driver_Phone_Numb":"",
            //     "Driving_licese":"",
            //     "vehicle_reg":"",
            //     "pickupCode":"ljdk3kdn",
            //     "Traveller_Name":"nafim",
            //     "droppingCode":"jndk3dk"
            //   }).then((value) {
            //     RequestID=senderPostRef.key.toString();
            //
            //     Get.to(AllDone(),
            //         duration: Duration(milliseconds: 100), //duration of transitions, default 1 sec
            //         transition: Transition.rightToLeft );
            //
            //
            //     // setState(() {
            //     //
            //     // });
            //   });
            //
            //
            //
            //
            //   // Get.to(AllDone(),
            //   //     duration: Duration(milliseconds: 500), //duration of transitions, default 1 sec
            //   //     transition: Transition.rightToLeft );
            //   //
            //
            //
            // },
            //     child: Text("Send a booking request")),
            //



          ],
        ),
      ),


      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: Container(
        margin: EdgeInsets.fromLTRB(0, 0, 0, 21),
        child: FloatingActionButton.extended(

          onPressed: (){



            DatabaseReference senderPostRef = rf.child("ride_request").push();
            senderPostRef.set({
              "Destination":"ljedj",
              "Traveller_Name":"ledmmd",
              "Traveller_Phone_number": "01797609439",
              "PickUp": "e3ioje",
              "Cost":"${widget.Cost}",
              "traveller_Phone":"01797609439",
              "Starting_date":"${widget.Starting_Date}",
              "destinationLat": "dlwlmd3",
              "destinationLong": "flwelflf",
              "PickupLat": "lemdewdm",
              "PicupLong": "ehiweiewi",
              "Distance":"${widget.TotalDistance}",
              "Fare":"edjoe3",
              "pickUpStat":false,
              "driver_name":"enknwkn",
              "Driver_Phone_Numb":"",
              "Driving_licese":"",
              "vehicle_reg":"",
              "pickupCode":"ljdk3kdn",
              "Traveller_Name":"nafim",
              "droppingCode":"jndk3dk",
              "carModel":"${widget.carModel}"
            }).then((value) {
              RequestID=senderPostRef.key.toString();

              Get.to(AllDone(),
                  duration: Duration(milliseconds: 100), //duration of transitions, default 1 sec
                  transition: Transition.rightToLeft );


              // setState(() {
              //
              // });
            });




            // Get.to(AllDone(),
            //     duration: Duration(milliseconds: 500), //duration of transitions, default 1 sec
            //     transition: Transition.rightToLeft );
            //


          },
          label: Text("Send a booking request"),
          hoverElevation: 100,
          icon: Icon(Icons.done_all),
          splashColor: Colors.purple,

          backgroundColor: Colors.pink.shade500,
        ),
      ),


    );
  }

  Future<double> getDistance() async {




    double distanceInMetre=await Geolocator.distanceBetween(widget.pickupLat, widget.pickupLong,widget.selectedItem[0]['lat'],widget.selectedItem[0]["long"]);



    if(widget.selectedItem.length<2){

      setState(() {
        dist=distanceInMetre;
      });

    }else{

      for(int i=1;i<widget.selectedItem.length;i++){

        distanceInMetre=distanceInMetre+await Geolocator.distanceBetween(widget.selectedItem[i-1]['lat'],widget.selectedItem[i-1]["long"],widget.selectedItem[i]['lat'],widget.selectedItem[i]["long"]);

      }

      setState(() {
        dist=distanceInMetre;
      });


    }




    return distanceInMetre;

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getDistance();
  }


}