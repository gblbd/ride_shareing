import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ride_sharing/Pages/HomePage/Bike/AvailablePromos.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';

import '../Bike/AddMissingPlace.dart';
import '../Bike/YourTripPage.dart';


class CarPageView extends StatefulWidget {
  const CarPageView({Key? key}) : super(key: key);

  @override
  State<CarPageView> createState() => _CarPageViewState();
}

class _CarPageViewState extends State<CarPageView> {
  static final _code=TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: const EdgeInsets.only(top: 30.0,left: 5,right: 5,bottom: 5),
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/CarBackGround.jpg'),
              fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 40,width: 40,
              child: FloatingActionButton(
                heroTag: "btn${4}",

                backgroundColor: Colors.white,
                  onPressed: (){
                    Navigator.pop(context);
                  },
                child: const Icon(Icons.arrow_back,color: Colors.grey,),
              ),
            ),
           Column(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             crossAxisAlignment: CrossAxisAlignment.end,
             children: [
               Container(
                 height: 35,width: 35,
                 child: FloatingActionButton(
                   heroTag: "btn${5}",

                   backgroundColor: Colors.white,
                   onPressed: (){
                     showModalBottomSheet(
                         isScrollControlled: false,
                         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
                         isDismissible: true,
                         enableDrag: false,
                         context: context,
                         builder: (BuildContext context){
                           return Padding(
                             padding: EdgeInsets.only(
                               top: 10,
                               bottom: MediaQuery.of(context).viewInsets.bottom + 0.5,
                             ),
                             child: Container(
                               height: 350,
                               child: Column(
                                 children: [
                                   Image.asset('assets/images/Safe.png'),const SizedBox(height: 15,),
                                   const Text('Safe trips with Pathao Safety Coverage',
                                     style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w400),textAlign: TextAlign.center,),
                                   const SizedBox(height: 15,),
                                   const Text('  Get coverage with only ???2/ride',
                                     style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w300),textAlign: TextAlign.center,),
                                   const SizedBox(height: 8,),
                                   const Text('- Personal accident coverage up to BDT 5,000 \n - Medical expenses reimbursement up to BDT 1 lac',
                                     style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w300),textAlign: TextAlign.center,
                                     ),
                                   const SizedBox(height: 8,),
                                   TextButton(
                                     onPressed: (){},
                                       child: Text('Learn More',style: TextStyle(color: Colors.red.shade500),)),
                                   const SizedBox(height: 8,),
                                   Container(
                                       height: 50,width: 320,
                                       decoration: BoxDecoration(
                                         border: Border.all(color: Colors.red,width: 1),
                                         borderRadius: BorderRadius.circular(8.0),
                                         color: Colors.red,
                                       ),
                                       child: TextButton(
                                         onPressed: (){
                                           Navigator.pop(context);
                                         },
                                         child: const Text('Got It',
                                           style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w400),textAlign: TextAlign.center,),)
                                   )
                                 ],
                               ),
                             ),
                           );
                         });
                   },
                   child: Icon(Icons.security,color: Colors.green.shade500,size: 20,),
                 ),
               ),
               const SizedBox(height: 10,),
               Container(
                 height: 35,width: 35,
                 child: FloatingActionButton(
                   heroTag: "btn${6}",

                   backgroundColor: Colors.white,
                   onPressed: (){
                     showModalBottomSheet(
                         context: context,
                         isScrollControlled: true,
                         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
                         isDismissible: false,
                         enableDrag: false,
                         useSafeArea:true,
                         builder: (BuildContext context){
                           return Padding(
                               padding: EdgeInsets.only(
                               top: 6,
                              // bottom: MediaQuery.of(context).viewInsets.bottom + 0.5,
                           ),
                             child: Container(
                               height: 403,
                               child: Column(
                                 crossAxisAlignment: CrossAxisAlignment.center,
                                 children: [
                                   const SizedBox(height: 4,),
                                   Row(
                                     //crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       const SizedBox(width: 10,),
                                       const Text('Add Promo',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),),Spacer(),
                                       TextButton(
                                           onPressed: (){
                                             Navigator.pop(context);
                                           },
                                           child: const Icon(Icons.close,color: Colors.black,))
                                     ],
                                   ),
                                   const SizedBox(height: 3,),
                                   Container(
                                     height: 50,width: 330,
                                     margin: const EdgeInsets.all(8),
                                     decoration: BoxDecoration(
                                         border: Border.all(color: Colors.grey.shade200,width: 1),
                                         borderRadius: BorderRadius.circular(10.0),
                                         color: Colors.white
                                     ),
                                     child: TextField(
                                       cursorColor: Colors.red,
                                       decoration: const InputDecoration(
                                         focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey, width: 1.0),),
                                         enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey, width: 1.0),),
                                         labelText: 'Enter Promo Code',
                                         labelStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.normal, color: Color(0xFF1C1C25)
                                         ),
                                       ),
                                       controller: _code,
                                       onSubmitted: (String value) {
                                         debugPrint(value);
                                       },
                                     ),
                                   ),
                                  // const Divider(),
                                  //  Container(
                                  //    height: 280,
                                  //    color: Colors.blueGrey.shade50,
                                  //     child: Column(
                                  //       children: [
                                  //         const SizedBox(height: 8,),
                                  //         Row(
                                  //           mainAxisAlignment: MainAxisAlignment.center,
                                  //           children: [
                                  //             Container(
                                  //               height: 33,width: 160,
                                  //               decoration: BoxDecoration(
                                  //                   border: Border.all(color: Colors.red.shade50,width: 1),
                                  //                   borderRadius: BorderRadius.circular(10.0),
                                  //               ),
                                  //               child: TextButton(
                                  //                 style: TextButton.styleFrom(
                                  //                   backgroundColor: Colors.red.shade50
                                  //                 ),
                                  //                   onPressed: (){},
                                  //                   child: const Text('Available Promos',
                                  //                     style: TextStyle(color: Colors.red),)),
                                  //             ),
                                  //             Container(
                                  //               height: 33,width: 160,
                                  //               decoration: BoxDecoration(
                                  //                 border: Border.all(color: Colors.red.shade50,width: 1),
                                  //                 borderRadius: BorderRadius.circular(10.0),
                                  //               ),
                                  //               child: TextButton(
                                  //                 style: TextButton.styleFrom(
                                  //                   backgroundColor: Colors.red.shade50
                                  //                 ),
                                  //                   onPressed: (){
                                  //                   },
                                  //                   child: Row(
                                  //                     mainAxisAlignment: MainAxisAlignment.center,
                                  //                     children:  [
                                  //                       const Text('Point Deals', style: TextStyle(color: Colors.red)),
                                  //                       const SizedBox(width: 5,),
                                  //                       Container(
                                  //                         height: 15,width: 30,
                                  //                         decoration: BoxDecoration(
                                  //                           border: Border.all(color: Colors.red,width: 1),
                                  //                           borderRadius: BorderRadius.circular(6.0),
                                  //                           color: Colors.red
                                  //                         ),
                                  //                         child: const Text('New',style: TextStyle(color: Colors.white,fontSize: 10),textAlign: TextAlign.center,),
                                  //                       ),
                                  //                     ],
                                  //                   )),
                                  //             ),
                                  //           ],
                                  //         ),
                                  //         const SizedBox(height: 8,),
                                  //         Card(
                                  //           color: Colors.white,
                                  //           elevation: 2,
                                  //           margin: const EdgeInsets.all(8),
                                  //           shape: RoundedRectangleBorder(
                                  //               borderRadius: BorderRadius.all(Radius.circular(10))
                                  //           ),
                                  //           child: Container(
                                  //             height: 80,width: 320,
                                  //             child: Column(
                                  //               crossAxisAlignment: CrossAxisAlignment.start,
                                  //               children: [
                                  //                 SizedBox(height: 10,),
                                  //                 Row(
                                  //                   children: [
                                  //                     SizedBox(width: 10,),
                                  //                     Icon(Icons.circle_outlined,size: 14,color: Colors.grey,),
                                  //                     SizedBox(width: 10,),
                                  //                     Text('RUN10',style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w600)),
                                  //                     Spacer(),
                                  //                     Container(
                                  //                       height: 16,width: 38,
                                  //                       decoration: BoxDecoration(
                                  //                           border: Border.all(color: Colors.red,width: 1),
                                  //                           borderRadius: BorderRadius.circular(6.0),
                                  //                           color: Colors.red
                                  //                       ),
                                  //                       child: const Text('BIKE',style: TextStyle(color: Colors.white,fontSize: 10),textAlign: TextAlign.center,),
                                  //                     ),
                                  //                     SizedBox(width: 10,),
                                  //                   ],
                                  //                 ),
                                  //                 //SizedBox(height: 10,),
                                  //                 SizedBox(height: 7,),
                                  //                 Text('    25% off on your next ride (Up to 100BDT)',
                                  //                     style: TextStyle(color: Colors.black,fontSize: 13,fontWeight: FontWeight.normal)),
                                  //                 SizedBox(height: 7,),
                                  //                 Text('    Valid till March 31, 2023',style: TextStyle(color: Colors.grey,fontSize: 13,fontWeight: FontWeight.normal)),
                                  //               ],
                                  //             ),
                                  //           ),
                                  //         ),
                                  //         const SizedBox(height: 4,),
                                  //         Card(
                                  //           color: Colors.white,
                                  //           elevation: 2,
                                  //           margin: const EdgeInsets.all(8),
                                  //           shape: RoundedRectangleBorder(
                                  //               borderRadius: BorderRadius.all(Radius.circular(10))
                                  //           ),
                                  //           child: Container(
                                  //             height: 100,width: 320,
                                  //             child: Column(
                                  //               crossAxisAlignment: CrossAxisAlignment.start,
                                  //               children: [
                                  //                 SizedBox(height: 14,),
                                  //                 Row(
                                  //                   children: [
                                  //                     SizedBox(width: 10,),
                                  //                     Icon(Icons.circle_outlined,size: 14,color: Colors.grey,),
                                  //                     SizedBox(width: 10,),
                                  //                     Text('START100',style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w600)),
                                  //                     Spacer(),
                                  //                     Container(
                                  //                       height: 15,width: 60,
                                  //                       decoration: BoxDecoration(
                                  //                           border: Border.all(color: Colors.deepOrange.shade500,width: 1),
                                  //                           borderRadius: BorderRadius.circular(6.0),
                                  //                           color: Colors.deepOrange.shade500
                                  //                       ),
                                  //                       child: const Text('CAR PLUS',style: TextStyle(color: Colors.white,fontSize: 10),textAlign: TextAlign.center,),
                                  //                     ),
                                  //                     SizedBox(width: 10,),
                                  //                   ],
                                  //                 ),
                                  //                 //SizedBox(height: 10,),
                                  //                 SizedBox(height: 7,),
                                  //                 Text('    20% off on your next ride in Dhaka! (Up to 100BDT.\n    minimum ride fare: 120BDT)',
                                  //                     style: TextStyle(color: Colors.black,fontSize: 13,fontWeight: FontWeight.normal)),
                                  //                 SizedBox(height: 7,),
                                  //                 Text('    Valid till March 31, 2023',style: TextStyle(color: Colors.grey,fontSize: 13,fontWeight: FontWeight.normal)),
                                  //               ],
                                  //             ),
                                  //           ),
                                  //
                                  //         ),
                                  //       ],
                                  //     ),
                                  //  ),
                                   SafeArea(
                                     child: DefaultTabController(
                                       length: 2,
                                       child: Column(
                                         crossAxisAlignment: CrossAxisAlignment.center,
                                         children: [
                                           Container(
                                             height: 50,width: 320,
                                             child: Row(
                                               children: [
                                                 SizedBox(width: 35,),
                                                 ButtonsTabBar(
                                                   buttonMargin: EdgeInsets.all(8),
                                                   backgroundColor: Colors.red.shade50,
                                                     unselectedBackgroundColor: Colors.white,
                                                     unselectedLabelStyle: TextStyle(color: Colors.black),
                                                     labelStyle: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                                                     tabs: [
                                                       Tab(
                                                         child: GestureDetector(
                                                           child: Row(
                                                             mainAxisSize: MainAxisSize.min,
                                                             children: const [
                                                               Text('Available Promos',style: TextStyle(color: Colors.red),)
                                                             ],
                                                           ),
                                                           onTap: (){

                                                           },
                                                         ),
                                                       ),
                                                       Tab(
                                                         child: GestureDetector(
                                                           child: Row(
                                                             mainAxisSize: MainAxisSize.min,
                                                             children: const [
                                                               Text('Point Deals',style: TextStyle(color: Colors.red)),
                                                               SizedBox(width: 8),
                                                               Icon(Icons.fiber_new,size: 18,color: Colors.red,),
                                                             ],
                                                           ),
                                                           onTap: (){

                                                           },
                                                         ),
                                                       ),
                                                     ]
                                                 ),
                                               ],
                                             ),
                                           ),
                                         ],
                                       ),
                                     ),
                                   ),
                                 ],
                               ),
                             ),
                           );
                         });
                   },
                   child: Icon(Icons.percent,color: Colors.green.shade500,size: 20,),
                 ),
               ),
             ],
           ),
            Container(
              height: 120,
              //color: Colors.white,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white,width: 1),
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.white,),
              child: Column(
                children: [
                  const SizedBox(height: 5,),
                  Container(
                    height: 30,width: 324,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white,width: 1),
                        borderRadius: BorderRadius.circular(8.0),
                      color: Colors.green.shade50,
                    ),
                    child: TextButton(
                      onPressed: (){
                        showModalBottomSheet(
                            isScrollControlled: false,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
                            isDismissible: false,
                            enableDrag: false,
                            context: context,
                            builder: (BuildContext context){
                              return Padding(
                                  padding: EdgeInsets.only(
                                    top: 10,
                                    bottom: MediaQuery.of(context).viewInsets.bottom + 0.5,
                                  ),
                                child: Container(
                                  height: 300,
                                  child: Column(
                                    children: [
                                      Image.asset('assets/images/Fares.png'),const SizedBox(height: 15,),
                                      const Text('Fares are comparatively lower now',
                                          style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w400),textAlign: TextAlign.center,),
                                      SizedBox(height: 15,),
                                      const Text('  Fares are lower at this moment Request your rides as soon as possible.',
                                        style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w300),textAlign: TextAlign.center,),
                                      const SizedBox(height: 15,),
                                      Container(
                                        height: 50,width: 320,
                                          decoration: BoxDecoration(
                                            border: Border.all(color: Colors.red,width: 1),
                                            borderRadius: BorderRadius.circular(8.0),
                                            color: Colors.red,
                                          ),
                                        child: TextButton(
                                            onPressed: (){
                                              Navigator.pop(context);
                                            },
                                            child: const Text('Awesome!',
                                              style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w400),textAlign: TextAlign.center,),)
                                      )
                                    ],
                                  ),
                                ),
                              );
                            });
                      },
                      child: Row(
                        children: [
                          CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Icon(Icons.arrow_forward, size: 10,color: Colors.green.shade900,)
                          ),
                          Text('Fares are comparatively lower now for Bike',
                            style: TextStyle(color: Colors.green.shade900,fontSize: 12),),Spacer(),
                          Icon(Icons.info_outline,color: Colors.green.shade900,size: 10,)
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 70,
                    child: Row(
                      children: [
                        Container(
                          height: 50,width: 250,
                          margin: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey,width: 1),
                                        borderRadius: BorderRadius.circular(10.0),
                                        color: Colors.white
                                      ),
                          child: GestureDetector(
                            onTap: (){
                              showModalBottomSheet(
                                  isScrollControlled:true,
                                  context: context,
                                  builder: (BuildContext context){
                                    return SingleChildScrollView(
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            top: 10,
                                            left: 5,
                                            right: 5,
                                            bottom: MediaQuery.of(context).viewInsets.bottom + 250
                                        ),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                TextButton(
                                                    style: TextButton.styleFrom(primary: Colors.white,),
                                                    onPressed: (){
                                                      Navigator.pop(context);
                                                    },
                                                    child: const Icon(Icons.arrow_back,color: Colors.black,)),
                                                Container(
                                                  height: 50,width: 300,
                                                  margin: const EdgeInsets.all(8),
                                                  decoration: BoxDecoration(
                                                      border: Border.all(color: Colors.grey.shade200,width: 1),
                                                      borderRadius: BorderRadius.circular(10.0),
                                                      color: Colors.white
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      const SizedBox(width: 10,),
                                                      Icon(Icons.person,size: 20,color: Colors.grey.shade600,),
                                                      const SizedBox(width: 10,),
                                                      Container(
                                                        child: Column(
                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            const SizedBox(height: 10,),
                                                            Text('Pickup',style: TextStyle(fontWeight: FontWeight.normal,fontSize: 12,color: Colors.grey.shade700)),
                                                            const Text('29, Shah Magdum Avenue, Sector 12',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 12,color: Colors.black)),
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    Container(
                                                      height: 45,width: 260,
                                                      margin: const EdgeInsets.all(8),
                                                      decoration: BoxDecoration(
                                                          border: Border.all(color: Colors.grey.shade700,width: 1),
                                                          borderRadius: BorderRadius.circular(10.0),
                                                          color: Colors.white
                                                      ),
                                                      child: Row(
                                                        children: [
                                                          const SizedBox(width: 10,),
                                                          const Icon(Icons.location_on,size: 20,color: Colors.red,),
                                                          const SizedBox(width: 10,),
                                                          TextButton(
                                                              onPressed: (){},
                                                              child: Text('Search Destination',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.grey.shade700))),
                                                        ],
                                                      ),
                                                    ),
                                                    TextButton(
                                                        style: TextButton.styleFrom(primary: Colors.white,),
                                                        onPressed: (){
                                                          Navigator.push(
                                                              context,
                                                              MaterialPageRoute(builder: (context) {
                                                                return const YourTripPage();
                                                              })
                                                          );
                                                        },
                                                        child: const Icon(Icons.add,color: Colors.red,size: 30,)),
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 8,width: 500,
                                                child: DecoratedBox(
                                                    decoration: BoxDecoration(
                                                    color: Color(0xFFE3E1E1)
                                                ),
                                                 ),
                                                ),
                                                const SizedBox(height: 6,),
                                                Container(
                                                  height: 60,
                                                  child: TextButton(
                                                    onPressed: (){},
                                                    child: Row(
                                                      children: [
                                                        CircleAvatar(
                                                            backgroundColor: Colors.grey.shade200,
                                                            child: Icon(Icons.search, size: 16,color: Colors.grey.shade600,)
                                                        ),
                                                        const SizedBox(width: 16,),
                                                        const Text('Set on Map',style: TextStyle(fontSize: 15,color: Colors.black,fontWeight: FontWeight.normal),),Spacer(),
                                                         const SizedBox(width: 6,),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 8,width: 500,
                                                  child: DecoratedBox(
                                                    decoration: BoxDecoration(
                                                        color: Color(0xFFE3E1E1)
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  height: 60,
                                                  child: TextButton(
                                                    onPressed: () {  },
                                                    child: Row(
                                                      children: [
                                                        CircleAvatar(
                                                            backgroundColor: Colors.grey.shade200,
                                                            child: Icon(Icons.home_sharp, size: 16,color: Colors.grey.shade600,)
                                                        ),
                                                        const SizedBox(width: 16,),
                                                        Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: const [
                                                            Text('Home',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Colors.black),),
                                                            Text('Set home Address',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Colors.grey)),
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Divider(),
                                                Container(
                                                  height: 60,
                                                  child: TextButton(
                                                    onPressed: () {  },
                                                    child: Row(
                                                      children: [
                                                        CircleAvatar(
                                                            backgroundColor: Colors.grey.shade200,
                                                            child: Icon(Icons.work, size: 16,color: Colors.grey.shade600,)
                                                        ),
                                                        const SizedBox(width: 16,),
                                                        Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: const [
                                                            Text('Work',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Colors.black),),
                                                            Text('Set work Address',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Colors.grey)),
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 8,width: 500,
                                                  child: DecoratedBox(
                                                    decoration: BoxDecoration(
                                                        color: Color(0xFFE3E1E1)
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  height: 60,
                                                  child: TextButton(
                                                    onPressed: (){
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(builder: (context) {
                                                            return const AddMissingPlacePage();
                                                          })
                                                      );
                                                    },
                                                    child: Row(
                                                      children: [
                                                        CircleAvatar(
                                                            backgroundColor: Colors.red.shade50,
                                                            child: const Icon(Icons.wrong_location, size: 16,color: Colors.red,)
                                                        ),const Spacer(),
                                                        const Text('Add missing place to the Pathao Map',style: TextStyle(fontSize: 14,color: Colors.black),),Spacer(),
                                                        const Icon(Icons.arrow_forward_ios,size: 20,color: Colors.grey,),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 8,width: 500,
                                                  child: DecoratedBox(
                                                    decoration: BoxDecoration(
                                                        color: Color(0xFFE3E1E1)
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      )
                                    );
                                  }
                              );
                            },
                            child: Row(
                              children: const [
                                SizedBox(width: 15,),
                                Icon(Icons.location_on,color: Colors.red,size: 22,), SizedBox(width: 10,),
                                Text("Search Destination",style: TextStyle(fontWeight: FontWeight.normal,fontSize: 18,color: Colors.black),)
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 50,width: 60,
                          margin: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey,width: 1),
                                        borderRadius: BorderRadius.circular(10.0),
                                        color: Colors.white
                                      ),
                          child: GestureDetector(
                            onTap: (){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) {
                                    return const YourTripPage();
                                  })
                              );
                            },
                           child: const Icon(Icons.add,color: Colors.red,size: 26,),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
