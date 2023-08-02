


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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

          Text("your selected place : "),

          Text("Total Distance"),

          Text("total cost : "),

          Text("Driver's name : "),

          ElevatedButton(onPressed: (){

            Get.to(AllDone(),
                duration: Duration(milliseconds: 500), //duration of transitions, default 1 sec
                transition: Transition.rightToLeft );



          }, child: Text("Confirm booking"))

        ],
      ),
    );
  }

}