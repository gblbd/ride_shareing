


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ConfirmLocation extends StatelessWidget{

  final List<dynamic>selectedItem;

  const ConfirmLocation({super.key, required this.selectedItem});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
              itemCount: selectedItem.length,
              itemBuilder: (context,index){

            return Text("${selectedItem[index]["Name"]}");

          }),
        ],
      ),
    );
  }
  
}