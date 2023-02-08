import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Bike/BikePageView.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: (){},
          child: Row(
            children: const [
              SizedBox(width: 8,),
              Icon(Icons.location_on,color: Colors.grey,size: 14,),
              SizedBox(width: 5,),
              Text('29, Shah Magdum Aven... >',style: TextStyle(
                  fontSize: 13,fontWeight: FontWeight.normal,color: Colors.grey),)
            ],
          ),
        ),
        leadingWidth: 200,
        actions: <Widget>[
          Padding(padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 8),
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)
                ),
                color: Colors.red.shade50,
                onPressed: () {  },
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
              onTap: (){},
              child: Row(
                children: [
                  IconButton(
                      onPressed: (){},
                      icon: Icon(Icons.account_circle_rounded,color: Colors.grey.shade400,size: 34,))
                ],
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextButton(style: TextButton.styleFrom(
                    backgroundColor: Colors.indigo,
                  ),
                    onPressed: () {  },
                    child: Row(
                      children: const [
                        Text('PayLater',style: TextStyle(
                          color: Colors.white),
                        ),
                        Spacer(),
                        Text('Pay Smarter, Pay Later >',style: TextStyle(
                            color: Colors.white),)
                      ],
                    ),
                  ),
                  SizedBox(height: 15,),
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
                          onPressed: (){},
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
                          onPressed: (){},
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/images/courier.png'),
                              Text('Courier',style: TextStyle(fontSize: 12,fontWeight: FontWeight.normal,color: Colors.black),)
                            ],
                          ),

                        ),
                      ),

                      // Container(height: 100,width: 80,
                      //   decoration: BoxDecoration(
                      //     border: Border.all(color: Colors.grey.shade200,width: 1),
                      //     borderRadius: BorderRadius.circular(10.0),
                      //   ),
                      //   child: TextButton(
                      //     onPressed: (){},
                      //     child: Column(
                      //       mainAxisAlignment: MainAxisAlignment.center,
                      //       children: [
                      //         Image.asset('assets/images/Food.png'),
                      //         const Text('Food',style: TextStyle(fontSize: 12,fontWeight: FontWeight.normal,color: Colors.black))
                      //       ],
                      //     ),
                      //
                      //   ),
                      // ),
                      // Container(height: 100,width: 80,
                      //   decoration: BoxDecoration(
                      //     border: Border.all(color: Colors.grey.shade200,width: 1),
                      //     borderRadius: BorderRadius.circular(10.0),
                      //   ),
                      //   child: TextButton(
                      //     onPressed: (){},
                      //     child: Column(
                      //       mainAxisAlignment: MainAxisAlignment.center,
                      //       children: [
                      //         Image.asset('assets/images/Parcel.png'),
                      //         const Text('Parcel',style: TextStyle(fontSize: 12,fontWeight: FontWeight.normal,color: Colors.black))
                      //       ],
                      //     ),
                      //
                      //   ),
                      // ),

                    ],
                  ),
                //  const SizedBox(height: 10,),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //   children: <Widget>[
                  //     Container(height: 100,width: 80,
                  //       decoration: BoxDecoration(
                  //         border: Border.all(color: Colors.grey.shade200,width: 1),
                  //         borderRadius: BorderRadius.circular(10.0),
                  //       ),
                  //       child: TextButton(
                  //         onPressed: (){},
                  //         child: Column(
                  //           mainAxisAlignment: MainAxisAlignment.center,
                  //           children: [
                  //             Image.asset('assets/images/courier.png'),
                  //             Text('Courier',style: TextStyle(fontSize: 12,fontWeight: FontWeight.normal,color: Colors.black),)
                  //           ],
                  //         ),
                  //
                  //       ),
                  //     ),
                  //     Container(height: 100,width: 80,
                  //       decoration: BoxDecoration(
                  //         border: Border.all(color: Colors.grey.shade200,width: 1),
                  //           borderRadius: BorderRadius.circular(10.0),),
                  //       child: TextButton(
                  //         onPressed: (){},
                  //         child: Column(
                  //           mainAxisAlignment: MainAxisAlignment.center,
                  //           children: [
                  //             Image.asset('assets/images/tong.png'),
                  //             Text('Tong',style: TextStyle(fontSize: 12,fontWeight: FontWeight.normal,color: Colors.black))
                  //           ],
                  //         ),
                  //
                  //       ),
                  //     ),
                  //     Container(height: 100,width: 80,
                  //       decoration: BoxDecoration(
                  //         border: Border.all(color: Colors.grey.shade200,width: 1),
                  //         borderRadius: BorderRadius.circular(10.0),
                  //       ),
                  //       child: TextButton(
                  //         onPressed: (){},
                  //         child: Column(
                  //           mainAxisAlignment: MainAxisAlignment.center,
                  //           children: [
                  //             Image.asset('assets/images/pharma.png'),
                  //             Text('Pharma',style: TextStyle(fontSize: 12,fontWeight: FontWeight.normal,color: Colors.black))
                  //           ],
                  //         ),
                  //
                  //       ),
                  //     ),
                  //     Container(height: 100,width: 80,
                  //       decoration: BoxDecoration(
                  //         border: Border.all(color: Colors.grey.shade200,width: 1),
                  //         borderRadius: BorderRadius.circular(10.0),
                  //       ),
                  //       child: TextButton(
                  //         onPressed: (){},
                  //         child: Column(
                  //           mainAxisAlignment: MainAxisAlignment.center,
                  //           children: [
                  //             Image.asset('assets/images/more.png'),
                  //             Text('More',style: TextStyle(fontSize: 12,fontWeight: FontWeight.normal,color: Colors.black))
                  //           ],
                  //         ),
                  //
                  //       ),
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ),
            const SizedBox(height: 20,
            child: Text('  Courier Deliveries',style: TextStyle(
                color: Colors.black,fontSize: 15,fontWeight: FontWeight.w400)),
            ),
            Container(
              margin: EdgeInsets.all(8),
              child: TextButton(
                onPressed: (){},
                child: ListTile(
                  leading: Image.asset('assets/images/delivery.png'),
                  title: const Text('Rate your delivery Experience',
                      style: TextStyle(color: Colors.black,fontSize: 13,)),
                  subtitle: const Text('Order from: Infinity Word',
                      style: TextStyle(color: Colors.grey,fontSize: 10,)),
                  trailing: const Icon(Icons.arrow_forward_ios_sharp),
                ),
              ),
            ),
            
            const Text('  Take A ride to',style: TextStyle(
                color: Colors.black,fontSize: 15,fontWeight: FontWeight.w400)),
            const SizedBox(
              height: 6,
            ),
            Container(
              margin: EdgeInsets.all(14),
              height: 70,
              width: 330,
              decoration: BoxDecoration(
                border:  Border.all(color: Colors.grey.shade200,width: 1),
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.grey.shade200
              ),
              child: Row(
                children: [
                  Container(
                    height: 70,
                    width: 150,
                    child: GestureDetector(
                      onTap: (){},
                      child: const ListTile(
                        leading: Icon(Icons.home,size: 22,),
                        title: Text('Home',style: TextStyle(
                          color: Colors.black,fontSize: 12,fontWeight: FontWeight.bold)),
                        subtitle: Text('Set Address',style: TextStyle(
                          color: Colors.grey,fontSize: 10)),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                    child: Text('|',style: TextStyle(color: Colors.grey.shade300,fontSize: 30),),
                  ),
                  // const Spacer(
                  // ),
                  Container(
                    height: 70,
                    width: 150,
                    child: GestureDetector(
                      onTap: (){},
                         child: const ListTile(
                          leading: Icon(Icons.work,size: 22,),
                          title: Text('Work',style: TextStyle(
                          color: Colors.black,fontSize: 12,fontWeight: FontWeight.bold)),
                           subtitle: Text('Set Address',style: TextStyle(
                           color: Colors.grey,fontSize: 10,)),
                    ),
                   ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Text('  Invite Friends & Get Discount',style: TextStyle(
              color: Colors.black,fontSize: 16,)),
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
                        Image.asset('assets/images/invite food.png'),SizedBox(height: 12,),
                        const Text(' Invite on Food',style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold,color: Colors.black)),SizedBox(height: 12,),
                        const Text('Share this code with as many of your friends as you want and ask them t...',style: TextStyle(fontSize: 12,fontWeight: FontWeight.normal,color: Colors.grey)),SizedBox(height: 12,),
                        const Text('Share this code ',style: TextStyle(fontSize: 12,fontWeight: FontWeight.normal,color: Colors.grey)),SizedBox(height: 12,),
                        Container(
                          margin: EdgeInsets.only(left: 30),
                          //alignment: Alignment.centerRight,
                          height: 30,width: 150,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade200,width: 1),
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.grey.shade300
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('  PATH752F88',style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold,color: Colors.black)),Spacer(),
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
    );
  }
}
