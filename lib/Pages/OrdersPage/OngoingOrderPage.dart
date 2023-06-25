import 'package:flutter/material.dart';

class OngoingOrderPage extends StatelessWidget {
  const OngoingOrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
Center(child: Image.asset('assets/images/oorder.png',height: 150,width: 300,)),
Padding(
  padding: const EdgeInsets.all(8.0),
  child:   Text('No ongoing orders',
  style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18,color: Colors.black),
  ),
),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RichText(text: TextSpan(
              text: 'You have no ongoing orders but you can order for ride,parcel etc',
    style: TextStyle(fontWeight: FontWeight.w400,color: Colors.black),

    ),textAlign: TextAlign.center,
            ),
          ),



          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Container(
          //     height: 30,width: 100,
          //     decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(7.0),
          //       color: Colors.red
          //     ),
          //     child: TextButton(
          //         onPressed: (){
          //          // Navigator.pop(context);
          //         },
          //         child: Text('Order Now',style: TextStyle(color: Colors.white),)),
          //   ),
          // )





        ],
      ),
    );
  }
}
