import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  final String senderPhoneNumber;
  const NotificationScreen({Key? key, required this.senderPhoneNumber}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    Query dbref=FirebaseDatabase.instance.ref("User_profile").child(widget.senderPhoneNumber).child("user").child("Courier");


    // dbref.onValue.listen((event) {
    //   DataSnapshot ssnapshot = event.snapshot;
    //   String key = ssnapshot.key.toString();
    //   triggerNotification(ssnapshot.key.toString());
    // });



    return Scaffold(
      appBar: AppBar(
        elevation: 1.0,
        backgroundColor: Colors.white,
        title: Text('Notification',
        style: TextStyle(color: Colors.black),
        ),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      backgroundColor: Colors.blueGrey.shade50,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FirebaseAnimatedList(
              physics: ScrollPhysics(),
              shrinkWrap: true,
              query: dbref,
              reverse: true,
              itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double> animation, int index){
                // dbref.onValue.listen((event) {
                //   String key = snapshot.key.toString();
                //   triggerNotification(key);
                // });


                return Card(
                  child: ListTile(
                    onTap: (){

                    },
                    leading: CircleAvatar(
                      backgroundColor: Colors.green.shade50,
                        child: Icon(Icons.check,color: Colors.green,size: 20,)),
                    title: RichText(text: TextSpan(
                      text: 'We have received your courier order ${snapshot.key.toString()}. In the next few hours, we will collect your package from your given address.',
                      style: TextStyle(color: Colors.black)
                    ),
                    ),
                    subtitle: Text('${snapshot.child('time').value.toString()}'),
                  ),

                );
              },
            ),
          ),
        ],
      ),
    );
  }


  // triggerNotification(String key)
  // {
  //   AwesomeNotifications().createNotification(
  //       content: NotificationContent(
  //           id: 10,
  //           channelKey: 'basic_channel',
  //           title: 'Thanks for your courier order $key',
  //           body: 'We have received your courier order $key. In the next few hours, we will collect your package from your given address.',
  //
  //       )
  //   );
  // }
  // @override
  // void initState() {
  //
  //
  //   AwesomeNotifications().isNotificationAllowed().then((isAllowed){
  //
  //     if(!isAllowed)
  //     {
  //       AwesomeNotifications().requestPermissionToSendNotifications();
  //     }
  //
  //   });
  //   super.initState();
  //
  //   //
  //   // rf.child("notification").onChildAdded.listen((event) {
  //   //   showNotification(event.snapshot.value);
  //   // });
  // }
  //
  // Future<void>onSelectNotification(String payload)async{
  //
  // }
  //
  // Future<void>showNotification(String data)async{
  //
  // }
}
