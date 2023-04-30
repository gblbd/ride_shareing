import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';

class CarTripDetails extends StatelessWidget {
  const CarTripDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1.0,
        title: Text('Trip Details',
          style: TextStyle(
              color: Colors.black
          ),
        ),
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                height: 50,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Trip ID'),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Text('# D9HFGG',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),

                        ),Spacer(),
                        Icon(Icons.file_copy_outlined)
                      ],
                    )
                  ],
                ),
              ),
            ),
            Divider(thickness: 6,color: Colors.blueGrey.shade50,),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Text('Trip Info',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),

                  ),
                  Spacer(),
                  Container(
                    height: 15,width: 34,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade500,width: 1)
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.directions_car,size: 8,),
                        Text(' BIKE',
                          style: TextStyle(
                            fontSize: 8,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text('16 APR 2023, 12:25 PM',style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w400)),
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
                      height: 16,width: 10,
                      child: DashedLineConnector(
                        thickness: 1,
                        space: 4.0,
                        dash: 4.0,
                        gap: 4,
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
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Icon(Icons.account_circle,size: 35,color: Colors.blueGrey,),
                  Text("  HAFIZUR RAHMAN",style: TextStyle(color: Colors.grey.shade700,fontSize: 12)),Spacer(),
                  Container(
                    height: 14,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade700,width: 1)
                    ),
                    child: Text('CANCELLED',style: TextStyle(color: Colors.grey.shade700,fontSize: 10)),
                  ),

                ],
              ),
            ),
            Divider(thickness: 6,color: Colors.blueGrey.shade50,),
            Center(child: Text('This ride is cancelled by you')),
            Divider(thickness: 6,color: Colors.blueGrey.shade50,),
            TextButton(
                onPressed: (){},
                child: Row(
                  children: [
                    Text('REQUEST AGAIN',style: TextStyle(color: Colors.red),),Spacer(),
                    Icon(Icons.arrow_forward_ios_sharp,size: 16,color: Colors.red,)
                  ],
                )),
            Container(
              height: 80,
              color: Colors.blueGrey.shade50,
            ),
            Center(
              child: TextButton(
                  onPressed: (){},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.live_help_rounded,size: 14,color: Colors.red,),
                      Text('REPORT ISSUE',style: TextStyle(color: Colors.red),),
                    ],
                  )),
            ),


          ],
        ),
      ),
    );
  }
}
