


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:timelines/timelines.dart';

class CourierStatus extends StatelessWidget
{

  final String senderName;
  final String SenderPhoneNumber;
  final String senderAddress;
  final String Receivername;
  final String ReceiverPhoneNumber;
  final String ReceiverAddress;
  final double ParcelWaight;
  final String ID;
  final int CourierStat;




  List<String> _processes=['Send Request','Package received','Sorting','Depart from sender area','Arrived in receivers area','sorting','Ready to collect'];

  int complete=0;

   CourierStatus({super.key, required this.senderName, required this.SenderPhoneNumber, required this.senderAddress, required this.Receivername, required this.ReceiverPhoneNumber, required this.ReceiverAddress, required this.ParcelWaight, required this.ID, required this.CourierStat});

   bool Parcel=true;

  @override
  Widget build(BuildContext context) {
    complete=CourierStat;
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        elevation: 1.0,
        backgroundColor: Colors.white,
        title: Text('Courier Status',
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      // appBar: AppBar(
      //   title: Text("Courier Status"),
      // ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [

              Padding(
                padding: const EdgeInsets.only(left: 14.0),
                child: ListTile(
                  title: Text("Order ID :"),
                  subtitle: Text("${ID}",
                    style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400,color: Colors.black),

                  ),
                ),
              ),

              Divider(thickness: 4.0,),
              Container(
                padding: EdgeInsets.all(14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 14.0),
                        child: Text("Sender Details:",
                          style: TextStyle(fontSize: 18,color: Colors.red.shade900,fontWeight: FontWeight.w400),
                        ),
                      ),
                      ListTile(
                        title: Text("Name: ${senderName}"),
                        subtitle: Text("Address : ${senderAddress}\nPhone No : ${SenderPhoneNumber}"),
                      ),


                    ],
                  )
              ),
              Divider(thickness: 4.0,),

              Container(
                padding: EdgeInsets.all(14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Padding(
                      padding: const EdgeInsets.only(left: 14.0),
                      child: Text("Receiver Details:",
                      style: TextStyle(fontSize: 18,color: Colors.red.shade900,fontWeight: FontWeight.w400),
                      ),
                    ),
                    ListTile(
                      title: Text("Name : ${Receivername}"),
                      subtitle: Text("Address : ${ReceiverAddress}\nPhone No : ${ReceiverPhoneNumber}"),
                    ),


                  ],
                ),
              ),

              Divider(thickness: 4.0,),

              Padding(
                padding: const EdgeInsets.only(left: 14.0),
                child: Parcel ? ListTile(
                  minLeadingWidth: 0.0,
                  minVerticalPadding: 0.0,
                  leading: CircleAvatar(child: Icon(Icons.shopping_bag_sharp,color: Colors.white,size: 12,),
                    backgroundColor: Colors.orange,
                    radius: 14,
                  ),
                  title: Text("Parcel"),
                  subtitle: Text("${ParcelWaight} Kg"),
                ):ListTile(
                  minLeadingWidth: 0.0,
                  minVerticalPadding: 0.0,
                  leading:    CircleAvatar(
                    child: Icon(Icons.library_books_sharp,color: Colors.white,size: 10,),
                    backgroundColor: Colors.green.shade900,
                    radius: 14,
                  ),
                  title: Text("Document"),
                  subtitle: Text("${ParcelWaight} Kg"),
                ) ,
              ),
              Divider(thickness: 4.0,),

              Padding(
                padding: const EdgeInsets.only(left: 14.0,right: 14.0),
                child: ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Charge : "),
                      Text("95 BDT")
                    ],
                  ),

                  subtitle: Text("Payment : Due"),
                ),
              ),

              Divider(thickness: 4.0,),

              Text("Couriar Status :",
                style: TextStyle(fontSize: 22,color: Colors.red.shade900,fontWeight: FontWeight.w500),

              ),





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
