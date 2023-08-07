



import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class tourList extends StatelessWidget{

  Query dbref=FirebaseDatabase.instance.ref("Haritage_Tour_Request").child("ride_request");


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(
        children: [


          FirebaseAnimatedList(
            physics: ScrollPhysics(),
            shrinkWrap: true,
            query: dbref,
            reverse: false,
            itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double> animation, int index) {

              return Container(
                margin: EdgeInsets.all(8),
                child: Card(
                  child: ListTile(
                    title: Text("${snapshot.child("Starting_date").value.toString()}"),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Driver : ${snapshot.child("driver_name").value.toString()}"),
                        Text("Phone : ${snapshot.child("Driver_Phone_Numb").value.toString()}"),

                      ],
                    ),

                  )

                ),
              );
            },
          )






        ],
      ),
    );
  }

}