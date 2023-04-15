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

  const HomeScreen({Key? key}) : super(key: key);

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
                              return const AccountAndSettingsPage();
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
                    TextButton(
                      style: TextButton.styleFrom(
                      backgroundColor: Color(0xFF162DA9),
                    ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return PaymentsAllView();
                            },
                          ),
                        );
                      },







                      child: Row(
                        children: const [
                          Text('Payments All',style: TextStyle(
                            color: Colors.white,
                            fontStyle: FontStyle.italic
                          ),
                          ),
                          Spacer(),
                          Text('Pay Smarter, Pay Later >',style: TextStyle(
                              color: Colors.white),)
                        ],
                      ),
                    ),
                    // SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.all(8),
                          height: 100,width: 80,
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
                                Image.asset('assets/images/motor_bike.png'),
                                const Text('Bike',style: TextStyle(fontSize: 12,fontWeight: FontWeight.normal,color: Colors.black),)
                              ],
                            ),

                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(8),
                          height: 100,width: 80,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade200,width: 1),
                              borderRadius: BorderRadius.circular(10.0),),
                          child: TextButton(
                            onPressed: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return CarPageView();
                                  },
                                ),
                              );
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset('assets/images/Carr.png',),
                                const Text('Car',style: TextStyle(fontSize: 12,fontWeight: FontWeight.normal,color: Colors.black))
                              ],
                            ),

                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(8),
                          height: 100,width: 80,
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
                                    return PathaoCourierPage();
                                  },
                                ),
                              );

                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset('assets/images/courier.png'),
                                Text('Courier',style: TextStyle(fontSize: 12,fontWeight: FontWeight.normal,color: Colors.black),)
                              ],
                            ),

                          ),
                        ),


                      ],
                    ),
                  ],
                ),
              ),

              Divider(thickness: 8,color: Colors.blueGrey.shade50,),


              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 80,width: 350,
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
                  height: 40,width: 330,
                  decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(6.0),
                      color: Colors.white
                  ),
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
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
