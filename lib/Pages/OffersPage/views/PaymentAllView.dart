import 'package:flutter/material.dart';

class PaymentsAllView extends StatefulWidget {
  const PaymentsAllView({Key? key}) : super(key: key);

  @override
  State<PaymentsAllView> createState() => _PaymentsAllViewState();
}

class _PaymentsAllViewState extends State<PaymentsAllView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Text('Payments All',style: TextStyle(
                color: Colors.black),),
            Spacer(),
            TextButton(onPressed: (){}, child: Text('How it works?'))
          ],
        ),
        iconTheme: const IconThemeData(
            color: Colors.black),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.topRight,
            colors: [
              Colors.indigo,
              Colors.cyan
            ],
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 110,
              bottom: 0,
              left: 0,
              right: 0,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(0),
                    topRight: Radius.circular(0),
                  ),
                ),
                child: Container(
                  height: 200,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Center(
                    child: Column(
                      children: [
                        SizedBox(height: 200,),
                        Text('Join the waiting list'),
                        Text('You can opt in for an early access. You will be notified as soon as it is eligible for you.'),
                        Container(
                          color: Color(0xFF1D2F96),
                          child: TextButton(
                            onPressed: (){},
                            child: Text('JOIN THE WAITLIST'),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 60,
                bottom: 220,
                left: 20,
                right: 20,
                child: Container(
                  height: 280,
                  width: 300,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey.shade100,width: 2),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(40),
                          child: Center(child: Text('Payments All',style: TextStyle(
                            fontSize: 24,
                            color: Colors.indigo
                          ),
                          )
                          ),
                        ),


                        ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.indigo.shade50,
                            radius: 20,
                            child: Icon(Icons.car_rental_sharp),
                          ),
                          title: Text('Enjoy first, Payments All'),
                          subtitle: Text('You will get 30 days to pay the bill'),
                        ),
                        Divider(endIndent: 20,indent: 16,),
                        ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.indigo.shade50,
                            radius: 20,
                            child: Icon(Icons.verified_sharp),
                          ),
                          title: Text('Pay in one tap'),
                          subtitle: Text('Say goodbye to panicking at checkout.'),
                        ),
                        Divider(endIndent: 20,indent: 16,),
                        ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.indigo.shade50,
                            radius: 20,
                            child: Icon(Icons.visibility_off),
                          ),
                          title: Text('No hidden charges'),
                          subtitle: Text('We are upfront about charges when you pay.'),
                        ),

                      ],
                    ),
                  ),

                )

            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                child: Container(
                  height: 150,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        // SizedBox(height: 200,),
                        Text('Join the waiting list',style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700
                        ),
                        ),
                        SizedBox(height: 15,),
                        Text('You can opt in for an early access. You will be notified as soon as it is eligible for you.',textAlign: TextAlign.center,),
                        SizedBox(height: 20,),
                        Container(
                          height: 40,
                          width: 320,
                         // color: Colors.indigo,
                          decoration: BoxDecoration(
                            color: Colors.indigo,
                            borderRadius: BorderRadius.circular(6)
                          ),
                          child: TextButton(
                            onPressed: (){},
                            child: Text('JOIN THE WAITLIST',style: TextStyle(color: Colors.white),),
                          ),
                        )
                      ],
                    ),
                  ),

                ),
              )
            )
          ],
        ),
      ),
    );

















      Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Text('Payments All',style: TextStyle(
                color: Colors.black),),
            Spacer(),
            TextButton(onPressed: (){}, child: Text('How it works?'))
          ],
        ),
        iconTheme: const IconThemeData(
            color: Colors.black),
      ),

      body: Container(
        height: 120,width: 360,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.topRight,
              colors: [
                Colors.indigo,
                Colors.cyan
              ]
          )
        ),
          // Center(
          //   child: SizedBox(
          //     width: 300,
          //     height: 300,
          //     child: Stack(
          //       fit: StackFit.expand,
          //       clipBehavior: Clip.antiAliasWithSaveLayer,
          //       children: [
          //         Positioned(
          //             top: 50,
          //             left: 0,right: 0,
          //             child: Container(
          //               height: 400,
          //               width: 300,
          //               color: Colors.red,
          //               child: Text('well'),
          //             ))
          //       ],
          //     ),
          //   ),
          // )

      ),
    );
  }
}
