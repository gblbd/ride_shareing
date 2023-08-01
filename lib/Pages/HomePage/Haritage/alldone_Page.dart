


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AllDone extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(
        children: [

          Text("Trip booking done..."),

          Image.asset(
            "assets/images/done.gif",
            // height: 125.0,
            // width: 125.0,
          ),

        ],
      ),
    );
  }

}