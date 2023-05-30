

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'OrderConfirmationHomePickup.dart';

class PickUpPointManual extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        child: Column(
          children: [




            ElevatedButton(onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return OrderConfirmation();//const AddPickUpPage();
                  },
                ),
              );
            }, child: Text("Confirm PicKup")),




          ],
        ),
      ),
    );
  }

}