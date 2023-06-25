import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OngoingOffersView extends StatefulWidget {
  const OngoingOffersView({Key? key}) : super(key: key);

  @override
  State<OngoingOffersView> createState() => _OngoingOffersViewState();
}

class _OngoingOffersViewState extends State<OngoingOffersView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 12,horizontal: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [



              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("No Ongoing Offer"),
                ],
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Image.asset('assets/images/blaster.png',height: 42,width: 42,),
              //     Text('Ongoing Offers',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,),),
              //     Spacer(),
              //
              //     // GestureDetector(
              //     //   onTap: (){},
              //     //   child: Text('See All >',style: TextStyle(fontSize: 14,color: Colors.red,fontWeight: FontWeight.w500),),
              //     // )
              //   ],
              // ),
              // Image.asset('assets/images/offer_ongoing.jpg')

            ],
          ),
        )
    );
  }
}
