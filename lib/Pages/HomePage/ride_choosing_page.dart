

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Bike/BikePageView.dart';
import 'Car/CarPageView.dart';

class RideChoosingpage extends StatelessWidget{
  final fullname;
  final PhoneNumber;

  const RideChoosingpage({super.key, required this.fullname, required this.PhoneNumber});



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Choose your ride"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.all(3),
                height: 100,width: 104,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade200,width: 1),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: TextButton(
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return BikePageView(
                            name: fullname.toString(),
                            phoneNum: PhoneNumber.toString(),
                          );
                        },
                      ),
                    );
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.directions_bike,color: Colors.red.shade900,
                        size: 60,
                      ),
                      //Image.asset('assets/images/motor_bike.png',height: 58,),
                      const Text('Bike',style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500,color: Colors.black),)
                    ],
                  ),

                ),
              ),


              Container(
                margin: EdgeInsets.all(3),
                height: 100,width: 104,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade200,width: 1),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: TextButton(
                  onPressed: (){


                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return CarPageView(
                            Name: fullname,
                            phoneNumber: PhoneNumber,
                          );
                        },
                      ),
                    );



                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.airport_shuttle,color: Colors.red.shade900,
                        size: 60,
                      ),
                      //Image.asset('assets/images/motor_bike.png',height: 58,),
                      const Text('Car',style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500,color: Colors.black),)
                    ],
                  ),

                ),
              ),



            ],
          ),



        ],
      ),
    );
  }

}