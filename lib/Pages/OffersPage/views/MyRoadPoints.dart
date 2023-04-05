import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';






class MyRoadPointsPage extends StatefulWidget {

  const MyRoadPointsPage({Key? key}) : super(key: key);

  @override
  State<MyRoadPointsPage> createState() => _MyRoadPointsPageState();
}

class _MyRoadPointsPageState extends State<MyRoadPointsPage> with TickerProviderStateMixin {


   late TabController _outerTabController;
  late TabController _innerTabController;


  @override
  void initState(){
    super.initState();
    _outerTabController=TabController(length: 2, vsync: this);
    _innerTabController=TabController(length: 2, vsync: this);
  }


  @override
  void dispose() {
    _outerTabController.dispose();
    _innerTabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('My Road Points',style: TextStyle(
            color: Colors.black),),
        iconTheme: const IconThemeData(
            color: Colors.black),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.brown.shade50,
                  border: Border(bottom: BorderSide(color: Colors.blueGrey.shade50, width: 2),
                  )
              ),

              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text('Available Points',style: TextStyle(color: Colors.black,fontSize: 16)),Spacer(),
                        Text('Bronze',style: TextStyle(color: Color(0xFF932B06),fontSize: 20))
                      ],
                    ),
                    Text('0 pts',style: TextStyle(color: Color(0xFF932B06),fontSize: 26)),
                    SizedBox(height: 10,),
                    Text('Use My Road to earn more points, redeem exciting deals and enjoy exclusive benefits.'),
                    SizedBox(height: 15,),
                    Row(
                      children: [
                        Container(
                          height: 35,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey,width: 1),
                            borderRadius: BorderRadius.circular(4.0),
                            color: Colors.white
                          ),
                          child: TextButton(
                              onPressed: (){},
                              child: Row(
                                children: [
                                  Text('Level Details  ',style: TextStyle(color: Colors.black)),
                                  Icon(Icons.arrow_forward_ios_sharp,size: 10,color: Colors.black,)
                                ],
                              )),
                        ),
                        SizedBox(width: 10,),
                        Container(
                          height: 35,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.red.shade100,width: 1),
                              borderRadius: BorderRadius.circular(4.0),
                              color: Colors.white
                          ),
                          child: TextButton(
                              onPressed: (){},
                              child: Row(
                                children: [
                                  Icon(Icons.qr_code_scanner,size: 12,color: Colors.red,),
                                  Text('  Scan QR Code',style: TextStyle(color: Colors.red),),
                                ],
                              )),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            Column(
              children: [
                Container(
                  //height: 600,
                  child: TabBar(
                    labelColor: Colors.red,
                    unselectedLabelColor: Colors.black,
                      indicatorPadding: EdgeInsets.all(8.0),
                      indicatorColor: Colors.red,
                    controller: _outerTabController,
                      tabs: [
                        Tab(text: 'BENEFITS',),
                        Tab(text: 'DEALS',),
                      ]
                  ),
                ),

                Container(
                  height: 600,
                  child: TabBarView(
                    physics: NeverScrollableScrollPhysics(),
                    controller: _outerTabController,
                    children: [

                      Container(
                        color: Colors.blueGrey.shade50,

                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(

                              children: [
                                Container(
                                  width: 240,
                                  child: TabBar(
                                    indicator: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10), // Creates border
                                        color: Colors.red),
                                    controller: _innerTabController,
                                      labelColor: Colors.white,
                                      unselectedLabelColor: Colors.black,

                                     padding: EdgeInsets.only(top: 10,bottom: 16,left: 10,right: 20),

                                      tabs: [

                                        Text('All',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w300),),
                                        Text('Expiring Soon',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w300),),
                                      ]
                                  ),
                                ),
                                Spacer(),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10,bottom: 16,left: 10,right: 10),
                                  child: Container(
                                    width: 100,
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey,width: 1),
                                        borderRadius: BorderRadius.circular(4.0),
                                        color: Colors.white
                                    ),
                                    //color: Colors.blueGrey.shade50,
                                    child: TextButton(
                                      onPressed: (){},
                                      child: Text('Dhaka'),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Container(
                              height: 450,
                              color: Colors.blueGrey.shade50,

                              child: TabBarView(
                                controller: _innerTabController,
                                physics: NeverScrollableScrollPhysics(),
                                children: [
                                  Column(
                                    children: [

                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Card(
                                          child: ListTile(
                                            leading: Icon(Icons.account_balance),
                                            title: Text('Blade 6% Fitness Studio'),
                                            subtitle: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text('20% Discount . Gym'),
                                                Text('307 Days Left'),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Card(
                                          child: ListTile(
                                            leading: Icon(Icons.account_balance),
                                            title: Text('Blade 6% Fitness Studio'),
                                            subtitle: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,

                                              children: [
                                                Text('20% Discount . Gym'),
                                                Text('307 Days Left'),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Card(
                                          child: ListTile(
                                            leading: Icon(Icons.account_balance),
                                            title: Text('Blade 6% Fitness Studio'),
                                            subtitle: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,

                                              children: [
                                                Text('20% Discount . Gym'),
                                                Text('307 Days Left'),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Card(
                                          child: ListTile(
                                            leading: Icon(Icons.account_balance),
                                            title: Text('Blade 6% Fitness Studio'),
                                            subtitle: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,

                                              children: [
                                                Text('20% Discount . Gym'),
                                                Text('307 Days Left'),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Card(
                                          child: ListTile(
                                            leading: Icon(Icons.account_balance),
                                            title: Text('Blade 6% Fitness Studio'),
                                            subtitle: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,

                                              children: [
                                                Text('20% Discount . Gym'),
                                                Text('307 Days Left'),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      child: Column(
                                        children: [
                                          Image.asset('assets/images/expiring.png'),
                                          Text('No benefits available',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400)),
                                          Text('It seems like you donot have any benefits available right now.Exciting benefits are on their way.',textAlign: TextAlign.center,)
                                        ],
                                      ),
                                    ),
                                  )

                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Container(
                              color: Colors.blueGrey.shade50,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('BRONZE DEAL ON FOOD'),
                                    Text('Up to 80 Discount On Rides'),
                                    Row(
                                      children: [
                                        Text('31 March, 2023'),Spacer(),
                                        Text('600 Ponits'),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Container(
                              color: Colors.blueGrey.shade50,

                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('BRONZE DEAL ON FOOD'),
                                    Text('Up to 80 Discount On Rides'),
                                    Row(
                                      children: [
                                        Text('31 March, 2023'),Spacer(),
                                        Text('600 Ponits'),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Container(
                              color: Colors.blueGrey.shade50,

                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('BRONZE DEAL ON FOOD'),
                                    Text('Up to 80 Discount On Rides'),
                                    Row(
                                      children: [
                                        Text('31 March, 2023'),Spacer(),
                                        Text('600 Ponits'),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Container(
                              color: Colors.blueGrey.shade50,

                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('BRONZE DEAL ON FOOD'),
                                    Text('Up to 80 Discount On Rides'),
                                    Row(
                                      children: [
                                        Text('31 March, 2023'),Spacer(),
                                        Text('600 Ponits'),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Container(
                              color: Colors.blueGrey.shade50,

                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('BRONZE DEAL ON FOOD'),
                                    Text('Up to 80 Discount On Rides'),
                                    Row(
                                      children: [
                                        Text('31 March, 2023'),Spacer(),
                                        Text('600 Ponits'),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),

                        ],
                      )
                    ],
                  ),
                )
              ],
            )








            // DefaultTabController(
            //     length: 2,
            //     initialIndex: 0,
            //     child: Column(
            //       children: [
            //         Container(
            //           child: TabBar(
            //             labelColor: Colors.red,
            //             unselectedLabelColor: Colors.black,
            //             indicatorPadding: EdgeInsets.all(8.0),
            //             indicatorColor: Colors.red,
            //             tabs: <Widget>[
            //               Tab(text: 'BENEFITS',),
            //               Tab(text: 'DEALS',),
            //             ],
            //           ),
            //         ),
            //
            //         Container(
            //           height: 600,
            //           child: TabBarView(
            //             physics: NeverScrollableScrollPhysics(),
            //             children: [
            //
            //                 Container(
            //                   child: Row(
            //                     children: [
            //                       Text('All'),
            //                       Text('Expiring Soon'),
            //                     ],
            //                   ),
            //                 ),
            //
            //
            //               // Column(
            //               //   crossAxisAlignment: CrossAxisAlignment.start,
            //               //   children: [
            //               //     Row(
            //               //       children: [
            //               //         TextButton(
            //               //             onPressed: (){
            //               //               setState(() {
            //               //
            //               //               });
            //               //             },
            //               //             child: Text('All')),
            //               //         TextButton(
            //               //             onPressed: (){
            //               //
            //               //             },
            //               //             child: Text('Expiring Soon')),
            //               //
            //               //       ],
            //               //     )
            //               //
            //               //
            //               //   ],
            //               // ),
            //               Container(
            //                 child: Text('ok')
            //               ),
            //             ],
            //           ),
            //         )
            //
            //       ],
            //     ))
          ],
        ),
      ),
    );
  }

}
