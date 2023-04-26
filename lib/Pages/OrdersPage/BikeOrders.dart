import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';

class BikeOrderPage extends StatefulWidget {
  const BikeOrderPage({Key? key}) : super(key: key);

  @override
  State<BikeOrderPage> createState() => _BikeOrderPageState();
}

class _BikeOrderPageState extends State<BikeOrderPage> {
  bool _showImage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Text('Show Cancelled Rides',style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w600)),
                  Spacer(),
                  Switch(
                    activeColor: Colors.red,
                    value: _showImage,
                    onChanged: (value) {
                      setState(() {
                        _showImage = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 6,color: Colors.white,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _showImage
              ? Container(
                height: 400,
                child: 
                  ListView.builder(
                    itemCount: 10,
                      itemBuilder: (BuildContext context, int index){
                      return Container(
                        height: 170,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Text('16 APR 2023, 12:25 PM',style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w600)),Spacer(),
                                  Icon(Icons.arrow_forward_ios_sharp,size: 16,color: Colors.grey,),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(right: 8,left: 8),
                                        child: Row(
                                          children: [
                                            Icon(Icons.circle,size: 10,),SizedBox(width: 10,),
                                            Text('29, Shah Magdum Avenue, Sector 12'),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(right: 8,left: 8),
                                        child: SizedBox(
                                          height: 8,width: 10,
                                          child: DashedLineConnector(
                                            thickness: 1,
                                            space: 2.0,
                                            dash: 2.0,
                                            gap: 3,
                                            color: Colors.grey,
                                            direction: Axis.vertical,
                                            //indent: 1,
                                            //endIndent: 10,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(right: 8,left: 8),
                                        child: Row(
                                          children: [
                                            Icon(Icons.circle,size: 10,color: Colors.red,),SizedBox(width: 10,),
                                            Text('House Building Bus Stop,Sector 6'),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                  Icon(Icons.account_circle,size: 40,color: Colors.blueGrey,)
                                ],
                              ),
                            ),
                            Divider(),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  TextButton(
                                      onPressed: (){},
                                      child: Text('REQUEST AGAIN',style: TextStyle(color: Colors.red),)),
                                  Spacer(),
                                  Container(
                                    height: 24,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey.shade700,width: 1)
                                    ),
                                    child: TextButton(
                                        onPressed: (){},
                                        child: Text('CANCELLED',style: TextStyle(color: Colors.grey.shade700)),),
                                  ),
                                ],
                              ),
                            ),
                            Divider(thickness: 6,color: Colors.white,)
                          ],
                        ),
                      );
                      }
                  )

              )
                : Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: Image.asset('assets/images/bbike.png',height: 150,width: 300,)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Lets's take a ride!",
                      style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18,color: Colors.black),

                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RichText(
                      text: TextSpan(
                        text: "Its seems we don't have history together.Lets make some!",
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 30,width: 130,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7.0),
                          color: Colors.red
                      ),
                      child: TextButton(
                          onPressed: (){
                            // Navigator.pop(context);
                          },
                          child: Text('REQUEST A BIKE',style: TextStyle(color: Colors.white),)),
                    ),
                  )

                ],
              ),

            ),
          ],
        ),
      ),

    );
  }
}
