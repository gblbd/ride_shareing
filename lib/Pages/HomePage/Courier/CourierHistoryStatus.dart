// import 'package:firebase_database/firebase_database.dart';
// import 'package:firebase_database/ui/firebase_animated_list.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:sizer/sizer.dart';
// import 'package:timelines/timelines.dart';
//
// class CourierHistoryStatus extends StatefulWidget {
//   final String senderPhoneNumber;
//   const CourierHistoryStatus({Key? key, required this.senderPhoneNumber}) : super(key: key);
//
//   @override
//   State<CourierHistoryStatus> createState() => _CourierHistoryStatusState();
// }
//
// class _CourierHistoryStatusState extends State<CourierHistoryStatus> {
//   int complete=0;
//   List<String> _processes=['Send Request','Package received','Sorting','Depart from sender area','Arrived in receivers area','sorting','Ready to collect'];
//
//   @override
//   Widget build(BuildContext context) {
//     Query dbref=FirebaseDatabase.instance.ref("User_profile").child(widget.senderPhoneNumber).child("user").child("Courier");
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 1.0,
//         backgroundColor: Colors.white,
//         title: Text('Courier Status',
//           style: TextStyle(color: Colors.black),
//         ),
//         iconTheme: IconThemeData(color: Colors.black),
//       ),
//       backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//         child: FirebaseAnimatedList(
//         physics: ScrollPhysics(),
//         shrinkWrap: true,
//         query: dbref,
//         reverse: true,
//         itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double> animation, int index){
//           return  Container(
//             child: Column(
//               children: [
//
//                 ListTile(
//                   title: Text("Order ID : "),
//                   subtitle: Text("${snapshot.key.toString()}"),
//                 ),
//
//
//                 Container(
//                     child: Column(
//                       children: [
//                         Text("Sender :"),
//                         ListTile(
//                           title: Text("${snapshot.child('full_name').value.toString()}"),
//                           subtitle: Text("senderAddress\n${snapshot.child('mobile_no').toString()}"),
//                         ),
//
//
//                       ],
//                     )
//                 ),
//
//                 Container(
//                   child: Column(
//                     children: [
//
//                       Text("Receiver :"),
//                       ListTile(
//                         title: Text("${snapshot.child('Receiver_Name').value.toString()}"),
//                         subtitle: Text("${snapshot.child('Receiver_Phone_Number').value.toString()}\n${snapshot.child('Full_Address').value.toString()}"),
//                       ),
//
//
//                     ],
//                   ),
//                 ),
//
//                 ListTile(
//                   title: Text("Persel"),
//                   subtitle: Text("1.5 KG"),
//                 ),
//
//                 ListTile(
//                   title: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text("Charge : "),
//                       Text("95 BDT")
//                     ],
//                   ),
//
//                   subtitle: Text("Payment : Due"),
//                 ),
//
//
//                 Text("Couriar Status :"),
//
//
//
//
//
//                 Container(
//                   //height: 120,
//                   //alignment: Alignment.topCenter,
//                   padding: EdgeInsets.all(20),
//                   child: Timeline.tileBuilder(
//                     physics: ScrollPhysics(),
//                     shrinkWrap: true,
//                     padding: EdgeInsets.all(5),
//                     theme: TimelineThemeData(
//                       direction: Axis.vertical,
//                       connectorTheme: ConnectorThemeData(space: 8.0, thickness: 2.0),
//                     ),
//                     builder: TimelineTileBuilder.connected(
//                       connectionDirection: ConnectionDirection.before,
//                       contentsAlign: ContentsAlign.alternating,
//                       itemCount: _processes.length,
//                       itemExtentBuilder: (_, __) {
//                         return (100.w - 40) / 4.0;
//                       },
//                       oppositeContentsBuilder: (context, index) {
//                         return Container();
//                       },
//                       contentsBuilder: (context, index) {
//                         return Padding(
//                           padding: const EdgeInsets.only(top: 15.0),
//                           child: Text(
//                             _processes[index],
//                             style: GoogleFonts.openSans(
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.w500
//                             ),
//                           ),
//                         );
//                       },
//                       indicatorBuilder: (_, index) {
//
//                         if (index <= complete) {
//                           return DotIndicator(
//                             size: 20.0,
//                             color: Colors.green,
//                           );
//                         } else {
//                           return OutlinedDotIndicator(
//                             borderWidth: 4.0,
//                             color: Colors.green,
//                           );
//                         }
//                       },
//                       connectorBuilder: (_, index, type) {
//                         if (index > 0) {
//                           return SolidLineConnector(
//                             color: Colors.green,
//                           );
//                         } else {
//                           return null;
//                         }
//                       },
//                     ),
//                   ),
//                 )
//
//
//
//
//               ],
//             ),
//           );
//           },
//         ),
//       ),
//     );
//   }
// }
