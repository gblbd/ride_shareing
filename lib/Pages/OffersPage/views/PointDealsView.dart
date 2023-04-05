import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'MyRoadPoints.dart';

class PointDealsView extends StatefulWidget {
  const PointDealsView({Key? key}) : super(key: key);

  @override
  State<PointDealsView> createState() => _PointDealsViewState();
}

class _PointDealsViewState extends State<PointDealsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 12,horizontal: 12),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/fire.png',height: 30,width: 30,),
                    Text('Point Deals',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,),),
                    Spacer(),

                    TextButton(
                        onPressed: (){

                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) => const MyRoadPointsPage()));


                        },
                        child: Row(
                          children: [
                            Text('See All',
                              style: TextStyle(color: Colors.red),
                            ),
                            Icon(Icons.arrow_forward_ios_sharp,size: 16,color: Colors.red,)
                          ],
                        ))
                    // GestureDetector(
                    //   onTap: (){},
                    //   child: Text('See All >',style: TextStyle(fontSize: 14,color: Colors.red,fontWeight: FontWeight.w500),),
                    // )
                  ],
                ),





                Container(
                  height: 700,
                  child: ListView.builder(
                    itemCount: 10,
                      itemBuilder: (BuildContext context, int index){
                        return Card(
                          elevation: 0.0,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListTile(
                              title: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('BRONZE BUNDLE DEAL ON BIKE & CAR',style: TextStyle(fontSize: 13,color: Colors.brown.shade300),),
                                  SizedBox(height: 10,),
                                  Text('Up to TK 80 Discount on Rides',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                                  SizedBox(height: 20,),
                                ],
                              ),
                              subtitle: Row(
                                children: [
                                  Text('Valid till February 14, 2023',),Spacer(),
                                  Text('550 Points',style: TextStyle(color: Colors.red),),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                )
                // Card(
                //   color: Colors.white,
                //   child: ListTile(
                //     title: Text('BRONZE BUNDLE DEAL ON BIKE & CAR',style: TextStyle(fontSize: 14,color: Colors.red),),
                //     subtitle: Row(
                //       children: [
                //         Text('Valid till February 14, 2023',),Spacer(),
                //         Text('550 Points',style: TextStyle(color: Colors.red),),
                //       ],
                //     ),
                //   ),
                // ),
                // Card(
                //   color: Colors.white,
                //   child: ListTile(
                //     title: Text('BRONZE BUNDLE DEAL ON BIKE & CAR',style: TextStyle(fontSize: 14,color: Colors.red),),
                //     subtitle: Row(
                //       children: [
                //         Text('Valid till February 14, 2023',),Spacer(),
                //         Text('550 Points',style: TextStyle(color: Colors.red),),
                //       ],
                //     ),
                //   ),
                // ),
                // Card(
                //   color: Colors.white,
                //   child: ListTile(
                //     title: Text('BRONZE BUNDLE DEAL ON BIKE & CAR',style: TextStyle(fontSize: 14,color: Colors.red),),
                //     subtitle: Row(
                //       children: [
                //         Text('Valid till February 14, 2023',),Spacer(),
                //         Text('550 Points',style: TextStyle(color: Colors.red),),
                //       ],
                //     ),
                //   ),
                // ),
                // Card(
                //   color: Colors.white,
                //   child: ListTile(
                //     title: Text('BRONZE BUNDLE DEAL ON BIKE & CAR',style: TextStyle(fontSize: 14,color: Colors.red),),
                //     subtitle: Row(
                //       children: [
                //         Text('Valid till February 14, 2023',),Spacer(),
                //         Text('550 Points',style: TextStyle(color: Colors.red),),
                //       ],
                //     ),
                //   ),
                // ),


              ],
            ),
          ),
        )
    );
  }
}
