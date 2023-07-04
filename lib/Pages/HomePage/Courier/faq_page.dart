


import 'package:another_stepper/another_stepper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class FAQPage extends StatelessWidget{


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

  List<String>list=["Open your Pathao app and select the courier tab.",
 "Select the create order option. After selecting that option you will see the Courier order details page."
"In the courier order details page you need to provide the following- receiver details, delivery address, item weight and item type.After providing all the information click continue to go to the next step.",
"In the following step you need to provide your pick up location. You can add the pick up address location by providing the address or select from the map.After that provide some instructions related to your location so that our agent can pick up your package smoothly.",
"After that select your pickup method: home pickup and click confirm.",
"You will see a summary of your provided information about your order, click send Request and done, your pickup is successfully requested."];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        elevation: 1.0,
        backgroundColor: Colors.white,
        title: Text("Frequently ask question", style: TextStyle(color: Colors.black),),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      //backgroundColor: Colors.blueGrey.shade50,
      body: SingleChildScrollView(
        child: Column(
          children: [

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
            ExpansionTile(
                controlAffinity: ListTileControlAffinity.trailing,
                maintainState: true,
                textColor: Colors.black,
                title: Text("How does the service work ?",
                  style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600),
                ),
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16,right: 8,bottom: 6),
                  child: RichText(text: TextSpan(
                    text: "Using this service you can place your request using the My Road app.For your convenience the package will be picked up from your given location by our agent. After processing, it will be delivered by our agent to your desired location.",
                    style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: 14),
                  )),
                )
              ],

            ),
            Divider(thickness: 6,color: Colors.blueGrey.shade50,),
            ExpansionTile(
                controlAffinity: ListTileControlAffinity.trailing,
                maintainState: true,
                textColor: Colors.black,
                title: Text("What is the delivery coverage ?",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600),),
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16,right: 8,bottom: 6),
                  child: RichText(text: TextSpan(text: "We deliver your package at home anywhere in Bangladesh.",
                    style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: 14),)),
                )
              ],
            ),
            Divider(thickness: 6,color: Colors.blueGrey.shade50,),
            ExpansionTile(
                controlAffinity: ListTileControlAffinity.trailing,
                maintainState: true,
                textColor: Colors.black,
                title: Text("How can I place my couriers request ?",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600)),
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16,right: 8,bottom: 6),
                  child: RichText(text: TextSpan(
                    text: "You can easily place your request using the My Road app following the below steps:",
                    style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: 14),
                  )),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 16,right: 8,bottom: 6),
                  child: Row(
                    children: [
                      Text("1."),
                      RichText(text: TextSpan(
                        text: "Open your Pathao app and select the courier tab.",
                        style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: 14),
                      ))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16,right: 8,bottom: 6),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("2."),
                      RichText(text: TextSpan(
                        text:  "Select the create order option. After selecting that \noption you will see the Courier order details page.",
                        style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: 14),
                      ))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16,right: 8,bottom: 6),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("3."),
                      RichText(text: TextSpan(
                        text:  "In the courier order details page you need to provide\nthe following-receiver details, delivery address, item\nweight and item type.After providing all the \ninformation click continue to go to the next step.",
                        style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: 14),
                      ))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16,right: 8,bottom: 6),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("4."),
                      RichText(text: TextSpan(
                        text:  "In the following step you need to provide your pick\nup location.You can add the pick up address \nlocation by providing the address or select from the\nmap.After that provide some instructions related to \nyour location so that our agent can pick up your\npackage smoothly.",
                        style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: 14),
                      ))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16,right: 8,bottom: 6),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("5."),
                      RichText(text: TextSpan(
                        text:  "After that select your pickup method: home pickup\nand click confirm.",
                        style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: 14),
                      ))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16,right: 8,bottom: 6),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("6."),
                      RichText(text: TextSpan(
                        text:  "You will see a summary of your provided\ninformation about your order, click send Request\nand done, your pickup is successfully requested.",
                        style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: 14),
                      ))
                    ],
                  ),
                ),

              ],
            ),
            Divider(thickness: 6,color: Colors.blueGrey.shade50,),
            ExpansionTile(
              controlAffinity: ListTileControlAffinity.trailing,
              maintainState: true,
              textColor: Colors.black,
              title: Text("What kind of products can I send ?",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600),),
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16,right: 8,bottom: 6),
                  child: RichText(text: TextSpan(text: "You can send almost all kinds of products through My Road courier service. However, we have restrictions on fragile items, perishable food items and illegal/contraband items.",
                    style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: 14),)),
                )
              ],
            ),
            Divider(thickness: 6,color: Colors.blueGrey.shade50,),
            ExpansionTile(
              controlAffinity: ListTileControlAffinity.trailing,
              maintainState: true,
              textColor: Colors.black,
              title: Text("How can I track my courier delivery ?",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600),),
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16,right: 8,bottom: 6),
                  child: RichText(text: TextSpan(text: "You will get notification from us in your My Road app for all the status updates of your delivery till the package is delivered to your desired location.",
                    style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: 14),)),
                )
              ],
            ),
            Divider(thickness: 6,color: Colors.blueGrey.shade50,),
            ExpansionTile(
              controlAffinity: ListTileControlAffinity.trailing,
              maintainState: true,
              textColor: Colors.black,
              title: Text("Can I cancel my submitted courier request ?",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600),),
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16,right: 8,bottom: 6),
                  child: RichText(text: TextSpan(text: "For home pick up, you can cancel your request before any of our pick up agents is assigned to pick your package (you will get a notification on My Road app if any pickup agent is assigned for your package).",
                    style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: 14),)),
                )
              ],
            ),
            Divider(thickness: 6,color: Colors.blueGrey.shade50,),




          ],
        ),
      ),
    );
  }

}