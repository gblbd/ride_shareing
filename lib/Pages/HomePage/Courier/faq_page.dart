


import 'package:another_stepper/another_stepper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Frequently ask question"),
      ),
      body: Column(
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



        ],
      ),
    );
  }

}