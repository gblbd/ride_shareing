


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:timelines/timelines.dart';

class CourierStatus extends StatelessWidget
{

  List<String> _processes=['Send Request','Package received','Sorting','Depart from sender area','Arrived in receivers area','sorting','Ready to collect'];

  int complete=2;


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Courier Status"),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [

              ListTile(
                title: Text("Order ID : "),
                subtitle: Text("DC100423PA3UVN"),
              ),


              Container(
                  child: Column(
                    children: [
                      Text("Sender :"),
                      ListTile(
                        title: Text("Farha Faeja Emu"),
                        subtitle: Text("29 Shah mokhdum avenue, Uttara, Dhaka\n01771393745"),
                      ),


                    ],
                  )
              ),

              Container(
                child: Column(
                  children: [

                    Text("Receiver :"),
                    ListTile(
                      title: Text("Farha"),
                      subtitle: Text("Road 7, Sector 9, Uttara, Dhaka\n01771393745"),
                    ),


                  ],
                ),
              ),

              ListTile(
                title: Text("Persel"),
                subtitle: Text("1.5 KG"),
              ),

              ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Charge : "),
                    Text("95 BDT")
                  ],
                ),

                subtitle: Text("Payment : Due"),
              ),


              Text("Couriar Status :"),


              // Timeline.tileBuilder(
              //   shrinkWrap: true,
              //   builder: TimelineTileBuilder.fromStyle(
              //     contentsAlign: ContentsAlign.alternating,
              //
              //     contentsBuilder: (context, index) => Padding(
              //       padding: const EdgeInsets.all(24.0),
              //       child: Text('${_processes[index]}'),
              //     ),
              //
              //
              //     itemCount: _processes.length,
              //   ),
              //
              // ),



              Container(
                //height: 120,
                //alignment: Alignment.topCenter,
                padding: EdgeInsets.all(20),
                child: Timeline.tileBuilder(
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  padding: EdgeInsets.all(5),
                  theme: TimelineThemeData(
                    direction: Axis.vertical,
                    connectorTheme: ConnectorThemeData(space: 8.0, thickness: 2.0),
                  ),
                  builder: TimelineTileBuilder.connected(
                    connectionDirection: ConnectionDirection.before,
                    contentsAlign: ContentsAlign.alternating,
                    itemCount: _processes.length,
                    itemExtentBuilder: (_, __) {
                      return (100.w - 40) / 4.0;
                    },
                    oppositeContentsBuilder: (context, index) {
                      return Container();
                    },
                    contentsBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Text(
                          _processes[index],
                          style: GoogleFonts.openSans(
                              fontSize: 20,
                              fontWeight: FontWeight.w500
                          ),
                        ),
                      );
                    },
                    indicatorBuilder: (_, index) {

                      if (index <= complete) {
                        return DotIndicator(
                          size: 20.0,
                          color: Colors.green,
                        );
                      } else {
                        return OutlinedDotIndicator(
                          borderWidth: 4.0,
                          color: Colors.green,
                        );
                      }
                    },
                    connectorBuilder: (_, index, type) {
                      if (index > 0) {
                        return SolidLineConnector(
                          color: Colors.green,
                        );
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
              )




            ],
          ),
        ),
      ),
    ) ;
  }

}