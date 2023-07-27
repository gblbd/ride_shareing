

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ride_sharing/Pages/HomePage/Haritage/heritage_list.dart';
import 'package:sizer/sizer.dart';

class HariTageHome extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

      body: Column(
        children: [



          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset("assets/images/travel.png",
              height: 30.h,
              width: 80.w,
            ),
          ),






          Container(
            margin: const EdgeInsets.only(left: 8,right: 8,top: 8),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: ListTile(
                  leading: Image.asset('assets/images/itinerary.png',),
                  title: const Text('Make a tour plan',
                      style: TextStyle(color: Colors.black,fontSize: 16,)),
                  subtitle: const Text('Make a easy, meaningful, efficient, hassle free and enjoyable tour',
                      style: TextStyle(color: Colors.grey,fontSize: 13,)),
                  trailing: const Icon(Icons.arrow_forward_ios_sharp,size: 14,),
                ),
              ),
            ),
          ),


          Container(
            margin: const EdgeInsets.only(left: 8,right: 8,top: 8),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: ListTile(
                  leading: Image.asset('assets/images/mountains.png',),
                  title: const Text('Our populer tourist destinations',
                      style: TextStyle(color: Colors.black,fontSize: 16,)),
                  subtitle: const Text('The natural and historical beauty of the Bangladesh',
                      style: TextStyle(color: Colors.grey,fontSize: 13,)),
                  trailing: const Icon(Icons.arrow_forward_ios_sharp,size: 14,),
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return HeritageList();
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
          ),



          Container(
            margin: const EdgeInsets.only(left: 8,right: 8,top: 8),

            child: Card(
              child: Padding(
                padding: EdgeInsets.all(8),
                child: ListTile(
                  leading: Image.asset('assets/images/customer-service.png',),
                  title: const Text('Help and Support',
                      style: TextStyle(color: Colors.black,fontSize: 16,)),
                  subtitle: const Text('always active for safe and hassle free travel',
                      style: TextStyle(color: Colors.grey,fontSize: 13,)),
                  trailing: const Icon(Icons.arrow_forward_ios_sharp,size: 14,),
                ),
              ),
            ),
          ),









        ],
      ),

    );
  }
  
}