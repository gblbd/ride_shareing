
import 'package:another_stepper/dto/stepper_data.dart';
import 'package:another_stepper/widgets/another_stepper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ride_sharing/Pages/HomePage/Courier/CourierHistory.dart';
import 'package:timelines/timelines.dart';

import '../../../Others/support_page.dart';
import 'OrderDetailsPage.dart';

class PathaoCourierPage extends StatefulWidget {
  final String phoneNumbers;
  final String pin;
  final String fullname;



  const PathaoCourierPage({Key? key, required this.phoneNumbers, required this.pin, required this.fullname,}) : super(key: key);

  @override
  State<PathaoCourierPage> createState() => _PathaoCourierPageState();
}

class _PathaoCourierPageState extends State<PathaoCourierPage> {


  List<StepperData> stepperData = [
    StepperData(
        title: StepperText(
          "Input Order Details",
        ),
        subtitle: StepperText("Input Receiver Details, Delivery Address and Product Details."),
        iconWidget: Container(
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
              color: Color(0xFFEEEDED),
              borderRadius: BorderRadius.all(Radius.circular(30))),
          child: Center(child: const Text('1')),
        )
    ),
    StepperData(
        title: StepperText("Add Pickup Location"),
        subtitle: StepperText("Add pickup location and guide the pickup agent. add pickup location guide the pickup agent."),
        iconWidget: Container(
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
              color: Color(0xFFEEEDED),
              borderRadius: BorderRadius.all(Radius.circular(30))),
          child: Center(child: const Text('2')),
        )),
    StepperData(
        title: StepperText("Select Courier Method"),
        subtitle: StepperText(
            "Select Home Pickup or Kiosk Drop as your courier method."),
        iconWidget: Container(
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
              color: Color(0xFFEEEDED),
              borderRadius: BorderRadius.all(Radius.circular(30))),
          child: Center(child: Text('3')),
        )),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
               crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 30,),
                Row(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: 8,),
                    Container(
                      height: 40,width: 40,
                      child: TextButton(
                        onPressed: (){
                          Navigator.pop(context);
                        },
                        child: const Icon(Icons.arrow_back,color: Colors.black,size: 26,),
                      ),
                    ),
                    SizedBox(width: 70,),
                    Container(
                      height: 60,width: 220,
                        child: Row(
                          children: [
                            Image.asset('assets/images/My_Road_Logo.png',height: 60,width: 50,),
                            Image.asset('assets/images/courier_my_road.png',height: 20,width: 60,),
                          ],
                        )),
                  ]
                ),
                const Divider(),
                const SizedBox(height: 18,),


                Container(
                  height: 33,width: 280,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.red.shade50
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.maps_home_work_outlined,size: 16,color: Colors.grey,),
                      SizedBox(width: 4,),
                      Text('Own a Business'),
                      TextButton(
                          style: ButtonStyle(
                            shadowColor: MaterialStateProperty.all(Colors.transparent),
                            overlayColor: MaterialStateProperty.all(Colors.transparent),
                          ),
                          onPressed: (){},
                          child: Text('Register here',

                          style: TextStyle(
                            color: Colors.red
                          ),
                          )),
                      Icon(Icons.arrow_forward_ios_sharp,size: 10,color: Colors.red,)
                    ],
                  ),
                ),
                Container(
                  height: 170,
                  width: 400,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset('assets/images/courier_service.png',fit: BoxFit.fill,),
                  ),
                ),
               // const SizedBox(height: 8,),
               // const Text('Create Courier Order Instantly',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15),textAlign: TextAlign.center,),
                //const SizedBox(height: 8,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: const Text('Send anything anywhere within the country and have your package picked up from your doorstep.',
                    style: TextStyle(fontWeight: FontWeight.normal,fontSize: 14,color: Colors.grey),
                    textAlign: TextAlign.center,),
                ),
               // const SizedBox(height: 50,),
              ],
            ),
            // const Text('    Where are you sending?',
            //   style: TextStyle(fontWeight: FontWeight.w500,fontSize: 21,color: Colors.black),),
            // const SizedBox(height: 10,),
            Container(
              margin: const EdgeInsets.all(8),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: TextButton(
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return OrderDetailsPage(
                                phoneNumber: widget.phoneNumbers,
                                senderName: widget.fullname,

                              );
                            },
                          ),
                        );
                      },
                      child: ListTile(
                        leading: Image.asset('assets/images/order.png',),
                        title: const Text('Create Order',
                            style: TextStyle(color: Colors.black,fontSize: 16,)),
                        subtitle: const Text('Send anything you want',
                            style: TextStyle(color: Colors.grey,fontSize: 13,)),
                        trailing: const Icon(Icons.arrow_forward_ios_sharp,size: 14,),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(8),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: TextButton(
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return CourierHistoryPage(
                                 senderPhoneNumber: widget.phoneNumbers,
                               );
                            },
                          ),
                        );
                      },
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Color(0xFFDFE2F1),
                            radius: 22,
                            child: Icon(Icons.history,size: 30,color: Colors.orange.shade400,)),
                        title: const Text('Previous History',
                            style: TextStyle(color: Colors.black,fontSize: 16,)),
                        // subtitle: const Text('',
                        //     style: TextStyle(color: Colors.grey,fontSize: 13,)),
                        trailing: const Icon(Icons.arrow_forward_ios_sharp,size: 14,),
                      ),
                    ),
                  ),
                ),
              ),
            ),








            Container(
              margin: const EdgeInsets.all(8),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: TextButton(
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return Support();
                            },
                          ),
                        );
                      },
                      child: ListTile(
                        leading: Icon(Icons.help_outline_outlined),//Image.asset('assets/images/order.png',),
                        title: const Text('Help And Support',
                            style: TextStyle(color: Colors.black,fontSize: 16,)),
                        subtitle: const Text('Ask any Support, Question and queries',
                            style: TextStyle(color: Colors.grey,fontSize: 13,)),
                        trailing: const Icon(Icons.arrow_forward_ios_sharp,size: 14,),
                      ),
                    ),
                  ),
                ),
              ),
            ),











            Divider(thickness: 6,color: Colors.blueGrey.shade50,),

            ExpansionTile(
              controlAffinity: ListTileControlAffinity.trailing,
              maintainState: true,
              textColor: Colors.black,
              title: Text('What is My Road Courier ?',
                style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600),),
              children: <Widget>[
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.blueGrey.shade50,
                      child: Icon(Icons.location_on,size: 14,color: Colors.red,)),
                  title: Text('100% nationwide home delivery.'),
                ),
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.blueGrey.shade50,
                      child: Icon(Icons.card_giftcard,size: 14,color: Colors.red,)),
                  title: Text('Create your order and send anything to your destination.'),
                ),
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.blueGrey.shade50,
                      child: Icon(Icons.directions_bus_filled_sharp,size: 14,color: Colors.red,)),
                  title: Text('Stay worry free by using nations fastest delivery network.'),
                ),
              ],
            ),
            Divider(thickness: 6,color: Colors.blueGrey.shade50,),
            ExpansionTile(
              controlAffinity: ListTileControlAffinity.trailing,
              maintainState: true,
              textColor: Colors.black,
              title: Text('How It Works ?',
                style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600),),
              children: <Widget>[

                Container(
                  height: 320,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12,right: 12),
                    child: AnotherStepper(
                      stepperList: stepperData,
                      stepperDirection: Axis.vertical,
                      iconWidth: 40,
                      iconHeight: 40,
                      activeBarColor: Colors.black,
                      inActiveBarColor: Colors.grey.shade300,
                      inverted: false,
                      verticalGap: 30,
                      activeIndex: 0,
                      barThickness: 2,
                    ),
                  ),

                ),

              ],
            ),
            Divider(thickness: 6,color: Colors.blueGrey.shade50,),
            Container(
              height: 50,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                  style: ButtonStyle(
                    shadowColor: MaterialStateProperty.all(Colors.transparent),
                    overlayColor: MaterialStateProperty.all(Colors.transparent),
                  ),

                  onPressed: (){},
                  child: Row(
                    children: [
                      Text('Frequently Asked Questions',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16),),Spacer(),
                      Icon(Icons.arrow_forward_ios_sharp,size: 16,color: Colors.black54,)
                    ],
                  ),
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}
