import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';

import 'ReportIssuePage.dart';

const kTileHeight = 50.0;

const completeColor = Color(0xff5e6172);
const inProgressColor = Color(0xff5ec792);
const todoColor = Color(0xffd1d2d7);

class CourierDetailsPage extends StatefulWidget {
  const CourierDetailsPage({Key? key}) : super(key: key);

  @override
  State<CourierDetailsPage> createState() => _CourierDetailsPageState();
}

class _CourierDetailsPageState extends State<CourierDetailsPage> {

  int _processIndex = 2;

  Color getColor(int index) {
    if (index == _processIndex) {
      return inProgressColor;
    } else if (index < _processIndex) {
      return completeColor;
    } else {
      return todoColor;
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1.0,
        title: Text('Delivery Details',
          style: TextStyle(
              color: Colors.black
          ),
        ),
        iconTheme: IconThemeData(color: Colors.black),
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
                    Text('Order ID'),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Text('DC1104237EV7UV',
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(

                          child: Icon(Icons.location_on,size: 12,color: Colors.red,),
                        radius: 10,
                        backgroundColor: Colors.grey.shade50,
                      ),

                      Text("RECEIVER'S DETAILS",
                        style: TextStyle(
                            color: Colors.blueGrey,
                          fontSize: 12,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text("Emu",

                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text("Uttara,Sector 9,Road 7 ",
                      style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 12,
                         // fontWeight: FontWeight.w500
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text("01790151123",
                      style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 12,
                          //fontWeight: FontWeight.w500
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(thickness: 6,color: Colors.blueGrey.shade50,),
    Padding(
        padding: const EdgeInsets.only(left: 16,top: 8),
        child: Text("Timeline",
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w500
          ),
        ),
    ),
    Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          height: 180,
          //width: 330,
          child: Timeline.tileBuilder(
          theme: TimelineThemeData(
          direction: Axis.horizontal,
          connectorTheme: ConnectorThemeData(
          space: 30.0,
          thickness: 1.0
          )
          ),
          // scrollDirection: Axis.horizontal,

          builder: TimelineTileBuilder.connected(
          connectionDirection: ConnectionDirection.before,
          itemExtentBuilder: (_,__)=>
          MediaQuery.of(context).size.width/ _processes.length,
          oppositeContentsBuilder: (context,index){
          return Padding(
          padding: EdgeInsets.all(15.0),
          child: Image.asset('assets/images/status${index+1}.PNG',
          width: 50.0,
          //color: getColor(index),
          ),
          );
          },
          contentsBuilder: (context, index){
          return Padding(
          padding: EdgeInsets.only(top: 15.0),
          child: Text(_processes[index],
          style: TextStyle(
          fontWeight: FontWeight.bold,
          color: getColor(index),

          ),
          ),
          );
          },
          indicatorBuilder: (_,index){
          var color;
          var child;

          if(index == _processIndex){
          color=inProgressColor;

          }
          else if(index<_processIndex){
          color=completeColor;
          child=Icon(Icons.check,color: Colors.white,size: 15.0,);
          }
          else{
          color=todoColor;
          child= Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.circle,size: 15,color: Colors.grey,),
          );
          }

          if(index<=_processIndex){
          return Stack(
          children: [
          DotIndicator(
          size: 20.0,
          color: color,
          child: child,
          ),
          ],
          );
          }
          },
          connectorBuilder: (_,index,type){
          if (index > 0) {
          if (index == _processIndex) {
          final prevColor = getColor(index - 1);
          final color = getColor(index);
          List<Color> gradientColors;
          if (type == ConnectorType.start) {
          gradientColors = [Color.lerp(prevColor, color, 0.5)!, color];
          } else {
          gradientColors = [
          prevColor,
          Color.lerp(prevColor, color, 0.5)!
          ];
          }
          return DashedLineConnector(
          color: Colors.grey,
          );
          } else {
          return DashedLineConnector(
          color: getColor(index),
          );
          }
          } else {
          return null;
          }
          },
          itemCount: _processes.length,
          )
          ),
        ),
    ),
    Padding(
      padding: const EdgeInsets.only(left: 4,bottom: 30),
      child: Container(
        height: 30,
        width: 400,
        child: ListTile(
          leading: VerticalDivider(
            thickness: 4,
            color: Colors.red,
          ),
          title: Text("Your courier order has been canceled.",
            style: TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.w500
            ),
          ),
          subtitle: Text('Apr 11, 2023, 02:41 PM',
            style: TextStyle(
                color: Colors.blueGrey,
                fontSize: 10,
                fontWeight: FontWeight.w500
            ),
          ),
        ),
      ),
    ),

            Divider(thickness: 6,color: Colors.blueGrey.shade50,),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 10,
                      backgroundColor: Colors.orange,
                      child: Icon(Icons.shopping_bag,size: 12,color: Colors.white,)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 1),
                      Text('  Parcel',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                      Text('  1.0 Kg, Value ৳0',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 10,
                            fontWeight: FontWeight.w400
                        ),
                      ),

                    ],
                  ),
                ],
              ),
            ),

            Divider(thickness: 6,color: Colors.blueGrey.shade50,),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextButton(
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return ReportIssuePage();
                        },
                      ),
                    );

                  },
                  child: Row(
                    children: [
                      Icon(Icons.live_help_sharp,size: 12,color: Colors.red,),SizedBox(width: 5,),
                      Text("Report Issue",
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 12,
                            fontWeight: FontWeight.w500
                        ),
                      ),Spacer(),
                      Icon(Icons.arrow_forward_ios_sharp,size: 12,color: Colors.red,)

                    ],
                  )),
            )


            // floatingActionButton: FloatingActionButton(
    // child: Icon(Icons.access_alarm_rounded),
    // onPressed: () {
    // setState(() {
    // _processIndex = (_processIndex + 1) % _processes.length;
    // });
    // },
    // backgroundColor: inProgressColor,
    // ),



  //  );

    ],
        ),
      ),
    );
  }
}

final _processes = [
  'Cancelled',
  'Picked-up',
  'In Transmit',
  'Out for Delivery',
  'Delivered',
];


