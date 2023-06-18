import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ride_sharing/Pages/HomePage/Car/CarPageView.dart';
import '../OffersPage/views/MyRoadPoints.dart';
import '../OffersPage/views/PaymentAllView.dart';
import '../OffersPage/views/PointDealsView.dart';
import 'Account&Settings/Account&SettingsPage.dart';
import 'Bike/BikePageView.dart';
import 'Bike/searchAndPickupDestinationPage.dart';
import 'Courier/PathaoCourierPage.dart';

class HomeScreen extends StatefulWidget {
  final String phoneNumber;
  final String fullname;
  final String pin;
  final String email;
  final String gender;
  final String dateOfBirth;




  const HomeScreen({Key? key, required this.phoneNumber, required this.fullname, required this.pin, required this.email, required this.gender, required this.dateOfBirth}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


 static List offers=[
   Image.asset('assets/images/offer.PNG'),
   Image.asset('assets/images/offers.PNG'),
   Image.asset('assets/images/offers.PNG'),
   Image.asset('assets/images/offers.PNG'),
   Image.asset('assets/images/offers.PNG'),
 ];
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.all(4.0),
          child: TextButton(
            style: ButtonStyle(
              shadowColor: MaterialStateProperty.all(Colors.transparent),
              overlayColor: MaterialStateProperty.all(Colors.transparent),
            ),
            onPressed: (){},
            child: Row(
              children: [
                Icon(Icons.location_on,color: Colors.grey,size: 14,),
                SizedBox(width: 5,),
                Text('29, Shah Magdum Aven... >',style: TextStyle(fontSize: 13,fontWeight: FontWeight.normal,color: Colors.grey),),
              ],
            ),
          ),
        ),
        leadingWidth: 200,
        actions: <Widget>[
          Padding(padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 8),
              child: MaterialButton(
                elevation: 0.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)
                ),
                color: Colors.red.shade50,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return MyRoadPointsPage();
                      },
                    ),
                  );
                },
                child: Row(
                  children: [
                    Icon(Icons.stars,color: Colors.red.shade600,size: 14,),
                    Text(' 0 PTS',style: TextStyle(fontSize: 11,fontWeight: FontWeight.normal,color: Colors.red.shade600),)
                  ],
                ),
              )
          ),
          Padding(padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: (){

              },
              child: Row(
                children: [
                  IconButton(
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return AccountAndSettingsPage(
                                fullname1: widget.fullname,
                                email1: widget.email,
                                phoneNumber1: widget.phoneNumber,
                                gender1: widget.gender,
                                dateOfBirth1: widget.dateOfBirth,);
                            },
                          ),
                        );
                      },
                      icon: Icon(Icons.account_circle_rounded,color: Colors.grey.shade400,size: 34,))
                ],
              ),
            ),
          ),
        ],
      ),



      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [

                    Container(
                      height: 50,width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),

                      ),
                      child: Image.asset("assets/images/My_Road_Logo.png",fit: BoxFit.cover,),
                    ),

                     SizedBox(height: 8,),
                    SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
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
                                      return BikePageView();
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
                                borderRadius: BorderRadius.circular(10.0),),
                            child: TextButton(
                              onPressed: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return CarPageView(
                                        Name: widget.fullname,
                                        phoneNumber: widget.phoneNumber,
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
                                 // Image.asset('assets/images/Carr.png',height: 58,),
                                  const Text('Car',style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500,color: Colors.black))
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
                                      return PathaoCourierPage(
                                        phoneNumbers: widget.phoneNumber,
                                        pin: widget.pin,
                                        fullname: widget.fullname,

                                      );
                                    },
                                  ),
                                );

                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [

                                  Icon(Icons.local_shipping,color: Colors.red.shade900,

                                    size: 60,

                                  ),
                                  //Image.asset('assets/images/CourierIcon.png',height: 58,),
                                  Text('Courier',style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500,color: Colors.black),)
                                ],
                              ),

                            ),
                          ),


                        ],
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [


                    SizedBox(height: 8,),
                    SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
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
                                      return BikePageView();
                                    },
                                  ),
                                );
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.airplane_ticket,color: Colors.red.shade900,

                                    size: 60,

                                  ),
                                 // Image.asset('assets/images/motor_bike.png',height: 58,),
                                  const Text('Air Ticket',style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500,color: Colors.black),)
                                ],
                              ),

                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(3),
                            height: 100,width: 104,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade200,width: 1),
                              borderRadius: BorderRadius.circular(10.0),),
                            child: TextButton(
                              onPressed: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return CarPageView(
                                        Name: widget.fullname,
                                        phoneNumber: widget.phoneNumber,
                                      );
                                    },
                                  ),
                                );
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.hotel,color: Colors.red.shade900,
                                    size: 60,
                                  ),
                                  //Image.asset('assets/images/Carr.png',height: 58,),
                                  const Text('Hotel Booking',style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500,color: Colors.black))
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
                                      return PathaoCourierPage(
                                        phoneNumbers: widget.phoneNumber,
                                        pin: widget.pin,
                                        fullname: widget.fullname,

                                      );
                                    },
                                  ),
                                );

                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.fastfood,color: Colors.red.shade900,
                                    size: 60,
                                  ),
                                  //Image.asset('assets/images/CourierIcon.png',height: 58,),
                                  Text('Food',style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500,color: Colors.black),)
                                ],
                              ),

                            ),
                          ),


                        ],
                      ),
                    ),
                  ],
                ),
              ),

              Divider(thickness: 8,color: Colors.blueGrey.shade50,),


              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 80,
                  //width: 350,
                  //color: Colors.pinkAccent.shade100,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: offers.length,
                      itemBuilder: (BuildContext context,int index){
                        return Container(
                          child: offers[index],
                        );
                      }

                  ),
                ),
              ),
              Divider(thickness: 8,color: Colors.blueGrey.shade50,),





              Padding(
                padding: const EdgeInsets.only(left: 10,right: 10,top: 8,bottom: 0),
                child: const Text('Take A ride to',style: TextStyle(
                    color: Colors.black,fontSize: 15,fontWeight: FontWeight.w500)),
              ),
              const SizedBox(
                height: 6,
              ),

              Padding(
                padding: const EdgeInsets.only(top: 8,left: 8,right: 8),
                child: Container(
                  height: 40,
                  //width: 330,
                  decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(6.0),
                      color: Colors.white
                  ),
                  child: Center(
                    child: TextButton(
                      style: ButtonStyle(
                        shadowColor: MaterialStateProperty.all(Colors.transparent),
                        overlayColor: MaterialStateProperty.all(Colors.transparent),
                      ),
                      onPressed: (){

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return SearchAndPickupDestinationPage();
                            },
                          ),
                        );

                      },
                      child: Row(
                        children: [
                          Icon(Icons.location_on,color: Colors.red,),
                          SizedBox(width: 4,),
                          Text('Search Destination',style: TextStyle(color: Colors.grey),),
                          Spacer(),
                          Icon(Icons.search,color: Colors.black,),
                        ],
                      ),
                    ),
                  ),

                ),
              ),


              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Container(
              //     height: 60,
              //     width: 330,
              //     decoration: BoxDecoration(
              //        borderRadius: BorderRadius.circular(10.0),
              //       color: Color(0xFFF5F7F8)
              //     ),
              //     child: Row(
              //       children: [
              //         TextButton(
              //           style: ButtonStyle(
              //             shadowColor: MaterialStateProperty.all(Colors.transparent),
              //             overlayColor: MaterialStateProperty.all(Colors.transparent),
              //           ),
              //
              //           onPressed: (){
              //
              //             Navigator.push(
              //               context,
              //               MaterialPageRoute(
              //                 builder: (context) {
              //                   return MyScreen();
              //                 },
              //               ),
              //             );
              //           },
              //           child: Row(
              //             crossAxisAlignment: CrossAxisAlignment.center,
              //             children: [
              //               CircleAvatar(
              //                 radius: 15,
              //                 backgroundColor: Colors.white,
              //                   child: Icon(Icons.home,
              //                   color: Colors.grey,
              //                     size: 20,
              //                   )
              //               ),
              //               SizedBox(width: 6,),
              //
              //               Column(
              //                 crossAxisAlignment: CrossAxisAlignment.start,
              //                 children: [
              //                   SizedBox(height: 6,),
              //                   Text('Home',style: TextStyle(
              //                       color: Colors.black,fontSize: 14,fontWeight: FontWeight.bold)),
              //                   Text('Set Address',
              //                       style: TextStyle(
              //                           color: Colors.grey,fontSize: 12,)
              //                   ),
              //                 ],
              //               )
              //             ],
              //           ),
              //         ),
              //         SizedBox(width: 40,),
              //         SizedBox(
              //           width: 40,
              //           child: Text('|',style: TextStyle(color: Colors.grey.shade300,fontSize: 30),),
              //         ),
              //
              //         TextButton(
              //           style: ButtonStyle(
              //             shadowColor: MaterialStateProperty.all(Colors.transparent),
              //             overlayColor: MaterialStateProperty.all(Colors.transparent),
              //           ),
              //
              //           onPressed: (){},
              //           child: Row(
              //             children: [
              //               CircleAvatar(
              //                 radius: 15,
              //                 backgroundColor: Colors.white,
              //                   child: Icon(Icons.work_rounded,
              //                   color: Colors.grey,
              //                     size: 20,
              //                   )
              //               ),
              //               SizedBox(width: 6,),
              //
              //               Column(
              //                 crossAxisAlignment: CrossAxisAlignment.start,
              //                 children: [
              //                   SizedBox(height: 6,),
              //                   Text('Work',style: TextStyle(
              //                       color: Colors.black,fontSize: 14,fontWeight: FontWeight.bold)),
              //                   Text('Set Address',style: TextStyle(
              //                       color: Colors.grey,fontSize: 12,)),
              //                 ],
              //               )
              //             ],
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              SizedBox(height: 10,),
              Divider(thickness: 8,color: Colors.blueGrey.shade50,),

              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(left: 10,right: 10,bottom: 0),
                child: Text('Invite Friends & Get Discount',style: TextStyle(
                  color: Colors.black,fontSize: 16,fontWeight: FontWeight.w500)),
              ),
              SizedBox(height: 5,),
              Container(
                height: 320,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    SizedBox(width: 20,),
                    Container(
                      margin: EdgeInsets.all(8),
                      height: 170,width: 210,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade200,width: 1),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset('assets/images/invite ride.png'),SizedBox(height: 12,),
                          const Text(' Invite on Ride',style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold,color: Colors.black)),SizedBox(height: 12,),
                          const Text('Share this code with two of your friends & family members.They can...',style: TextStyle(fontSize: 12,fontWeight: FontWeight.normal,color: Colors.grey)),SizedBox(height: 12,),
                          const Text('Share this code ',style: TextStyle(fontSize: 12,fontWeight: FontWeight.normal,color: Colors.grey)),SizedBox(height: 12,),
                          Container(
                            margin: EdgeInsets.only(left: 30),
                            height: 30,width: 150,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade200,width: 1),
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.grey.shade300
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('  LPGV1',style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold,color: Colors.black)),Spacer(),
                                Icon(Icons.copy_sharp,size: 14,),
                                SizedBox(width: 5,),
                              ],
                            ),
                          ),
                         SizedBox(
                           height: 70,width: 230,
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                               SizedBox(width: 30,),
                               TextButton(
                                  style: ButtonStyle(
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                   side: BorderSide(color: Colors.red)
                                    )
                                  )
                                 ),
                                   onPressed: (){}, child: Text('Invite',style: TextStyle(fontSize: 12,fontWeight: FontWeight.normal,color: Colors.redAccent))),Spacer(),
                               TextButton(
                                   style: ButtonStyle(
                                       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                           RoundedRectangleBorder(
                                               borderRadius: BorderRadius.circular(10.0),
                                               side: BorderSide(color: Colors.red)
                                           )
                                       )
                                   ),
                                   onPressed: (){}, child: Text('Details',style: TextStyle(fontSize: 12,fontWeight: FontWeight.normal,color: Colors.redAccent))),
                               SizedBox(width: 30,),

                             ],
                           ),
                         )
                        ],
                      ),
                    ),
                    SizedBox(width: 10,),
                    Container(
                      margin: EdgeInsets.all(8),
                      height: 170,width: 210,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade200,width: 1),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset('assets/images/invite ride.png'),SizedBox(height: 12,),
                          const Text(' Invite on Ride',style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold,color: Colors.black)),SizedBox(height: 12,),
                          const Text('Share this code with two of your friends & family members.They can...',style: TextStyle(fontSize: 12,fontWeight: FontWeight.normal,color: Colors.grey)),SizedBox(height: 12,),
                          const Text('Share this code ',style: TextStyle(fontSize: 12,fontWeight: FontWeight.normal,color: Colors.grey)),SizedBox(height: 12,),
                          Container(
                            margin: EdgeInsets.only(left: 30),
                            height: 30,width: 150,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey.shade200,width: 1),
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.grey.shade300
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('  LPGV1',style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold,color: Colors.black)),Spacer(),
                                Icon(Icons.copy_sharp,size: 14,),
                                SizedBox(width: 5,),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 70,width: 230,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(width: 30,),
                                TextButton(
                                    style: ButtonStyle(
                                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(10.0),
                                                side: BorderSide(color: Colors.red)
                                            )
                                        )
                                    ),
                                    onPressed: (){}, child: Text('Invite',style: TextStyle(fontSize: 12,fontWeight: FontWeight.normal,color: Colors.redAccent))),Spacer(),
                                TextButton(
                                    style: ButtonStyle(
                                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(10.0),
                                                side: BorderSide(color: Colors.red)
                                            )
                                        )
                                    ),
                                    onPressed: (){}, child: Text('Details',style: TextStyle(fontSize: 12,fontWeight: FontWeight.normal,color: Colors.redAccent))),
                                SizedBox(width: 30,),

                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(width: 10,),
                    Container(
                      margin: EdgeInsets.all(8),
                      height: 170,width: 210,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade200,width: 1),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset('assets/images/invite ride.png'),SizedBox(height: 12,),
                          const Text(' Invite on Ride',style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold,color: Colors.black)),SizedBox(height: 12,),
                          const Text('Share this code with two of your friends & family members.They can...',style: TextStyle(fontSize: 12,fontWeight: FontWeight.normal,color: Colors.grey)),SizedBox(height: 12,),
                          const Text('Share this code ',style: TextStyle(fontSize: 12,fontWeight: FontWeight.normal,color: Colors.grey)),SizedBox(height: 12,),
                          Container(
                            margin: EdgeInsets.only(left: 30),
                            height: 30,width: 150,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey.shade200,width: 1),
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.grey.shade300
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('  LPGV1',style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold,color: Colors.black)),Spacer(),
                                Icon(Icons.copy_sharp,size: 14,),
                                SizedBox(width: 5,),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 70,width: 230,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(width: 30,),
                                TextButton(
                                    style: ButtonStyle(
                                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(10.0),
                                                side: BorderSide(color: Colors.red)
                                            )
                                        )
                                    ),
                                    onPressed: (){}, child: Text('Invite',style: TextStyle(fontSize: 12,fontWeight: FontWeight.normal,color: Colors.redAccent))),Spacer(),
                                TextButton(
                                    style: ButtonStyle(
                                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(10.0),
                                                side: BorderSide(color: Colors.red)
                                            )
                                        )
                                    ),
                                    onPressed: (){}, child: Text('Details',style: TextStyle(fontSize: 12,fontWeight: FontWeight.normal,color: Colors.redAccent))),
                                SizedBox(width: 30,),

                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(width: 10,),
                    Container(
                      margin: EdgeInsets.all(8),
                      height: 170,width: 210,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade200,width: 1),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset('assets/images/invite ride.png'),SizedBox(height: 12,),
                          const Text(' Invite on Ride',style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold,color: Colors.black)),SizedBox(height: 12,),
                          const Text('Share this code with two of your friends & family members.They can...',style: TextStyle(fontSize: 12,fontWeight: FontWeight.normal,color: Colors.grey)),SizedBox(height: 12,),
                          const Text('Share this code ',style: TextStyle(fontSize: 12,fontWeight: FontWeight.normal,color: Colors.grey)),SizedBox(height: 12,),
                          Container(
                            margin: EdgeInsets.only(left: 30),
                            height: 30,width: 150,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey.shade200,width: 1),
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.grey.shade300
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('  LPGV1',style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold,color: Colors.black)),Spacer(),
                                Icon(Icons.copy_sharp,size: 14,),
                                SizedBox(width: 5,),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 70,width: 230,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(width: 30,),
                                TextButton(
                                    style: ButtonStyle(
                                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(10.0),
                                                side: BorderSide(color: Colors.red)
                                            )
                                        )
                                    ),
                                    onPressed: (){}, child: Text('Invite',style: TextStyle(fontSize: 12,fontWeight: FontWeight.normal,color: Colors.redAccent))),Spacer(),
                                TextButton(
                                    style: ButtonStyle(
                                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(10.0),
                                                side: BorderSide(color: Colors.red)
                                            )
                                        )
                                    ),
                                    onPressed: (){}, child: Text('Details',style: TextStyle(fontSize: 12,fontWeight: FontWeight.normal,color: Colors.redAccent))),
                                SizedBox(width: 30,),

                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(width: 10,),
                    Container(
                      margin: EdgeInsets.all(8),
                      height: 170,width: 210,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade200,width: 1),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset('assets/images/invite ride.png'),SizedBox(height: 12,),
                          const Text(' Invite on Ride',style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold,color: Colors.black)),SizedBox(height: 12,),
                          const Text('Share this code with two of your friends & family members.They can...',style: TextStyle(fontSize: 12,fontWeight: FontWeight.normal,color: Colors.grey)),SizedBox(height: 12,),
                          const Text('Share this code ',style: TextStyle(fontSize: 12,fontWeight: FontWeight.normal,color: Colors.grey)),SizedBox(height: 12,),
                          Container(
                            margin: EdgeInsets.only(left: 30),
                            height: 30,width: 150,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey.shade200,width: 1),
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.grey.shade300
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('  LPGV1',style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold,color: Colors.black)),Spacer(),
                                Icon(Icons.copy_sharp,size: 14,),
                                SizedBox(width: 5,),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 70,width: 230,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(width: 30,),
                                TextButton(
                                    style: ButtonStyle(
                                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(10.0),
                                                side: BorderSide(color: Colors.red)
                                            )
                                        )
                                    ),
                                    onPressed: (){}, child: Text('Invite',style: TextStyle(fontSize: 12,fontWeight: FontWeight.normal,color: Colors.redAccent))),Spacer(),
                                TextButton(
                                    style: ButtonStyle(
                                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(10.0),
                                                side: BorderSide(color: Colors.red)
                                            )
                                        )
                                    ),
                                    onPressed: (){}, child: Text('Details',style: TextStyle(fontSize: 12,fontWeight: FontWeight.normal,color: Colors.redAccent))),
                                SizedBox(width: 30,),

                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50,)
            ],
          ),
        ),
      ),
    );
  }
}
