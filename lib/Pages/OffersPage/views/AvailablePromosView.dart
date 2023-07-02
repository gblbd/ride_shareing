import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'Available page.dart';

class AvailablePromosView extends StatefulWidget {
  const AvailablePromosView({Key? key}) : super(key: key);

  @override
  State<AvailablePromosView> createState() => _AvailablePromosViewState();
}

class _AvailablePromosViewState extends State<AvailablePromosView> {


  Query dbref=FirebaseDatabase.instance.ref("offer");


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
                  Image.asset('assets/images/box.png',height: 42,width: 42,),
                  Text('Available Promos',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,),),
                  Spacer(),

                  // TextButton(
                  //     onPressed: (){
                  //
                  //       Navigator.of(context)
                  //           .push(MaterialPageRoute(builder: (context) => const AvailablePage()));
                  //
                  //     },
                  //     child: Row(
                  //       children: [
                  //         Text('See All',
                  //         style: TextStyle(color: Colors.red),
                  //         ),
                  //         Icon(Icons.arrow_forward_ios_sharp,size: 16,color: Colors.red,)
                  //       ],
                  //     ))

                ],
              ),

              Container(
                height: 600,
                child:  FirebaseAnimatedList(
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  query: FirebaseDatabase.instance.ref("offer").child('bike'),
                 // reverse: true,
                  itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double> animation, int index) {

                    return Card(
                                elevation: 0.0,
                                color: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ListTile(
                                    title: Row(
                                      children: [
                                        Text('${snapshot.child("title").value.toString()}',style: TextStyle(fontSize: 18),),
                                        Spacer(),
                                        //Text('Bike',style: TextStyle(fontSize: 14,color: Colors.red))
                                      ],
                                    ),
                                    subtitle: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: 10,),
                                        Text('${snapshot.child("detail").value.toString()}',),
                                        SizedBox(height: 20,),
                                        Text('Valid till ${snapshot.child("validity").value.toString()}'),
                                        TextButton(
                                            onPressed: () async {
                                              await Clipboard.setData(ClipboardData(text: "${snapshot.child("coupon_code").value.toString()}")).then((value) {
                                                Fluttertoast.showToast(
                                                    msg: "Promo code is Copied to the clip board",
                                                    toastLength: Toast.LENGTH_LONG,
                                                    gravity: ToastGravity.TOP,
                                                    timeInSecForIosWeb: 1,
                                                    backgroundColor: Colors.grey,
                                                    textColor: Colors.green,
                                                    fontSize: 20.0
                                                );
                                              });


                                            },
                                            child: Text('Promo Code : ${snapshot.child("coupon_code").value.toString()}'))
                                      ],
                                    ),
                                  ),
                                ),

                              );

                  },

                )

                // ListView.builder(
                //     itemCount: 1,
                //     itemBuilder: (BuildContext context, int index){
                //       return Card(
                //         elevation: 0.0,
                //         color: Colors.white,
                //         child: Padding(
                //           padding: const EdgeInsets.all(8.0),
                //           child: ListTile(
                //             title: Row(
                //               children: [
                //                 Text('GPSTARB',style: TextStyle(fontSize: 18),),
                //                 Spacer(),
                //                 Text('Bike',style: TextStyle(fontSize: 14,color: Colors.red))
                //               ],
                //             ),
                //             subtitle: Column(
                //               crossAxisAlignment: CrossAxisAlignment.start,
                //               children: [
                //                 SizedBox(height: 10,),
                //                 Text('15% off on your next ride in Dhaka! (Up to 100BDT. minimum ride fare 45BDT)',),
                //                 SizedBox(height: 20,),
                //                 Text('Valid till April 22, 2023'),
                //                 TextButton(
                //                     onPressed: (){},
                //                     child: Text('Add Promo'))
                //               ],
                //             ),
                //           ),
                //         ),
                //
                //       );
                //     }
                // ),
              )


              // Card(
              //   color: Colors.white,
              //   child: ListTile(
              //     title: Row(
              //       children: [
              //         Text('DAWAT',style: TextStyle(fontSize: 18),),
              //         Spacer(),
              //         Text('Food',style: TextStyle(fontSize: 14,color: Colors.red))
              //       ],
              //     ),
              //     subtitle: Text('About available promos\nAbout date\nAdd Promo',
              //     ),
              //   ),
              //
              // ),
              // Card(
              //   color: Colors.white,
              //   child: ListTile(
              //     title: Row(
              //       children: [
              //         Text('PASTA80',style: TextStyle(fontSize: 18),),
              //         Spacer(),
              //         Text('Food',style: TextStyle(fontSize: 14,color: Colors.red))
              //       ],
              //     ),
              //     subtitle: Text('About available promos\nAbout date\nAdd Promo',
              //     ),
              //   ),
              // ),
              // Card(
              //   color: Colors.white,
              //   child: ListTile(
              //     title: Row(
              //       children: [
              //         Text('PASTA80',style: TextStyle(fontSize: 18),),
              //         Spacer(),
              //         Text('Food',style: TextStyle(fontSize: 14,color: Colors.red))
              //       ],
              //     ),
              //     subtitle: Text('About available promos\nAbout date\nAdd Promo',
              //     ),
              //   ),
              // ),
              // Card(
              //   color: Colors.white,
              //   child: ListTile(
              //     title: Row(
              //       children: [
              //         Text('PASTA80',style: TextStyle(fontSize: 18),),
              //         Spacer(),
              //         Text('Food',style: TextStyle(fontSize: 14,color: Colors.red))
              //       ],
              //     ),
              //     subtitle: Text('About available promos\nAbout date\nAdd Promo',
              //     ),
              //   ),
              // ),
              // Card(
              //   color: Colors.white,
              //   child: ListTile(
              //     title: Row(
              //       children: [
              //         Text('PASTA80',style: TextStyle(fontSize: 18),),
              //         Spacer(),
              //         Text('Food',style: TextStyle(fontSize: 14,color: Colors.red))
              //       ],
              //     ),
              //     subtitle: Text('About available promos\nAbout date\nAdd Promo',
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
