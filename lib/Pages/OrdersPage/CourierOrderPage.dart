import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';

import 'CourierDetails.dart';
class CourierOrderPage extends StatefulWidget {
  const CourierOrderPage({Key? key}) : super(key: key);

  @override
  State<CourierOrderPage> createState() => _CourierOrderPageState();
}

class _CourierOrderPageState extends State<CourierOrderPage> {
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
                  height: 550,
                  child:
                  ListView.builder(
                      itemCount: 0,
                      itemBuilder: (BuildContext context, int index){
                        return InkWell(
                          child: Container(
                            height: 240,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Text('APR 11, 2023, 02:40 PM',
                                          style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w600)),
                                      Spacer(),
                                      Text('৳70',style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w600)),
                                      Icon(Icons.arrow_forward_ios_sharp,size: 16,color: Colors.grey,),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
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
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(right: 8,left: 8),
                                        child: Row(
                                          children: [
                                            Icon(Icons.circle,size: 10,color: Colors.red,),SizedBox(width: 10,),
                                            Text('Uttara, Sector 9,Road 7'),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(7.0),
                                        child: Row(
                                          children: [
                                            Icon(CupertinoIcons.cube_box_fill,size: 14,color: Colors.grey,),SizedBox(width: 10,),
                                            Text("Parcel (Non-perishable goods, no fragile, no\nfood item)"),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextButton(
                                      onPressed: (){},
                                      child: Text('DETAILS',style: TextStyle(color: Colors.red),)),
                                ),
                                Divider(thickness: 6,color: Colors.white,)
                              ],
                            ),
                          ),
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return CourierDetailsPage();
                                },
                              ),
                            );
                          },
                        );
                      }
                  )

              )
                  : Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: Image.asset('assets/images/courierOrder.png',height: 150,width: 300,)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Lets's send something!",
                      style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18,color: Colors.black),

                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RichText(
                      text: TextSpan(
                        text: "Send goods in bulk with My Road Courier and track the delivery from the app.",
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),



                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: Container(
                  //     height: 30,width: 100,
                  //     decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(7.0),
                  //         color: Colors.red
                  //     ),
                  //     child: TextButton(
                  //         onPressed: (){
                  //           // Navigator.pop(context);
                  //         },
                  //         child: Text('SEND NOW',style: TextStyle(color: Colors.white),)),
                  //   ),
                  // )

                ],
              ),

            ),
          ],
        ),
      ),

    );
  }

}
