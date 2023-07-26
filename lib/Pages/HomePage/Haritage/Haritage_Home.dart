

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HariTageHome extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

      body: Column(
        children: [

          ListTile(
            leading: Image.asset('assets/images/itinerary.png',),
            title: const Text('Make a tour plan',
                style: TextStyle(color: Colors.black,fontSize: 16,)),
            subtitle: const Text('Make a easy, meaningful, efficient, hassle free and enjoyable tour',
                style: TextStyle(color: Colors.grey,fontSize: 13,)),
            trailing: const Icon(Icons.arrow_forward_ios_sharp,size: 14,),
          ),


          ListTile(
            leading: Image.asset('assets/images/mountains.png',),
            title: const Text('Our populer tourist destinations',
                style: TextStyle(color: Colors.black,fontSize: 16,)),
            subtitle: const Text('The natural and historical beauty of the Bangladesh',
                style: TextStyle(color: Colors.grey,fontSize: 13,)),
            trailing: const Icon(Icons.arrow_forward_ios_sharp,size: 14,),
          ),



          ListTile(
            leading: Image.asset('assets/images/customer-service.png',),
            title: const Text('Help and Support',
                style: TextStyle(color: Colors.black,fontSize: 16,)),
            subtitle: const Text('always active for safe and hassle free travel',
                style: TextStyle(color: Colors.grey,fontSize: 13,)),
            trailing: const Icon(Icons.arrow_forward_ios_sharp,size: 14,),
          ),









        ],
      ),

    );
  }
  
}