import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

import 'CourierHistoryStatus.dart';
import 'couriar_status.dart';

class CourierHistoryPage extends StatefulWidget {
  final String senderPhoneNumber;



  const CourierHistoryPage({Key? key, required this.senderPhoneNumber,}) : super(key: key);

  @override
  State<CourierHistoryPage> createState() => _CourierHistoryPageState();
}

class _CourierHistoryPageState extends State<CourierHistoryPage> {
  @override

  Widget build(BuildContext context) {
    Query dbref=FirebaseDatabase.instance.ref("User_profile").child(widget.senderPhoneNumber).child("user").child("Courier");
    return Scaffold(
      appBar: AppBar(
        elevation: 1.0,
        backgroundColor: Colors.white,
        title: Text('History',
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      backgroundColor: Colors.blueGrey.shade50,
      body: SingleChildScrollView(
        child: Column(
          children: [
        Padding(
        padding: const EdgeInsets.all(8.0),
        child: FirebaseAnimatedList(
          physics: ScrollPhysics(),
          shrinkWrap: true,
          query: dbref,
          reverse: true,
          itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double> animation, int index){

            return Card(
              child: ListTile(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return CourierStatus(

                          senderName: snapshot.child('senderName').value.toString(),
                          SenderPhoneNumber: snapshot.child('senderPhoneNumber').value.toString(),
                          senderAddress: snapshot.child('senderAddress').value.toString(),
                          Receivername: snapshot.child('Receiver_Name').value.toString(),
                          ReceiverPhoneNumber: snapshot.child('Receiver_Phone_Number').value.toString(),
                          ReceiverAddress: snapshot.child('Full_Address').value.toString(),
                          ParcelWaight: double.parse(snapshot.child('Courier_Weight').value.toString()),
                          ID: snapshot.key.toString(),
                          CourierStat: int.parse(snapshot.child('parcelStatus').value.toString()),

                        );
                      },
                    ),
                  );
                },
                leading: CircleAvatar(
                  backgroundColor: Colors.green.shade50,
                  radius: 26,
                  child: int.tryParse(snapshot.child('parcelStatus').value.toString()) != null
                      ? int.parse(snapshot.child('parcelStatus').value.toString()) < 6
                      ? Icon(
                    Icons.browse_gallery,
                    size: 40,
                  )
                      : Icon(
                    Icons.check_circle,
                    color: Colors.green,
                    size: 40,
                  )
                      : Icon(
                    Icons.error,
                    color: Colors.red,
                    size: 40,
                  ),
                ),
                // CircleAvatar(
                //     backgroundColor: Colors.green.shade50,
                //     radius: 26,
                //     child: int.parse(snapshot.child('parcelStatus').value.toString())<6?Icon(Icons.browse_gallery,
                //
                //       size: 40,
                //
                //     ):Icon(Icons.check_circle,
                //     color: Colors.green,
                //       size: 40,
                //     ),),//Image.asset('assets/images/My_Road_Logo.png'),),
                title: RichText(text: TextSpan(
                    text: 'Order Id: ${snapshot.key.toString()}\nReceiver Number : ${snapshot.child('Receiver_Phone_Number').value.toString()}',
                    style: TextStyle(color: Colors.black)
                ),
                ),
                subtitle: Text('Address: ${snapshot.child('Full_Address').value.toString()}\n${snapshot.child('time').value.toString()}'),
              ),

            );
          },
        ),
        )
          ],
        ),
      ),
    );
  }
}
