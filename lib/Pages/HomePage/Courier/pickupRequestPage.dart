import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:ride_sharing/Pages/HomePage/Courier/couriar_status.dart';

class PickupRequestPage extends StatefulWidget {
  const PickupRequestPage({Key? key}) : super(key: key);

  @override
  State<PickupRequestPage> createState() => _PickupRequestPageState();
}

class _PickupRequestPageState extends State<PickupRequestPage> {




    String reason="I don't need to send courier right now";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        backgroundColor: Colors.white,
        title: Text('Pickup Requested',style: TextStyle(color: Colors.black),),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  height: 30,width: 330,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.green,width: 0.1),
                    borderRadius: BorderRadius.circular(6.0),
                    color: Colors.green.shade50,
                  ),
                  child: Center(child: Text('Your courier will be picked up within a few hours',
                    style: TextStyle(color: Colors.green.shade900,fontSize: 13),textAlign: TextAlign.center,))),
            ),
            Divider(thickness: 9,color: Colors.blueGrey.shade50,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DottedBorder(
                color: Colors.orangeAccent.shade400,
                strokeCap: StrokeCap.butt,
                radius: Radius.circular(10),
                strokeWidth: 1,
                dashPattern: [6,4],
                child: Container(
                  height: 100,width: 320,
                  decoration: BoxDecoration(
                    color: Colors.orange.shade50,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16,top: 10),
                        child: Text('Packaging Instruction',style: TextStyle(fontSize: 14,color: Colors.black,fontWeight: FontWeight.w500)),
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10,left: 10,right: 10),
                              child: Row(
                                children: [
                                  SizedBox(width: 4,),
                                  CircleAvatar(
                                    backgroundColor: Colors.orange,
                                    radius: 4,
                                    child:  Text('',style: TextStyle(color: Colors.grey.shade700,fontSize: 10,),),

                                  ),
                                  SizedBox(width: 9,),
                                  Text('Please use proper packaging to keep your item Safe.',style: TextStyle(color: Colors.grey.shade700,fontSize: 12,),),
                                ],
                              ),
                            ),

                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10,left: 10,right: 10),
                              child: Row(
                                children: [
                                  SizedBox(width: 4,),
                                  CircleAvatar(
                                    backgroundColor: Colors.orange,
                                    radius: 4,
                                    child:  Text('',style: TextStyle(color: Colors.grey.shade700,fontSize: 10,),),

                                  ),
                                  SizedBox(width: 9,),
                                  Text('Write down the receivers details on the package to',style: TextStyle(color: Colors.grey.shade700,fontSize: 12,),),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 31,right: 10),
                              child: Column(
                                children: [
                                  Text('ensure proper delivery.',style: TextStyle(color: Colors.grey.shade700,fontSize: 12),),
                                ],
                              ),
                            ),

                          ],
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ),
            Divider(thickness: 9,color: Colors.blueGrey.shade50,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8,left: 16,right: 10),
                  child: Text('Order ID',style: TextStyle(color: Colors.grey.shade700,fontSize: 15)),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8,left: 16,right: 16,bottom: 8),
                  child: Row(
                    children: [
                      Text('DC100423PA3UVN',style: TextStyle(color: Colors.black,fontSize: 18)),
                      Spacer(),
                      InkWell(
                          onTap: (){},
                          child: Icon(Icons.copy_sharp,size: 18,color: Colors.red.shade700,)),
                    ],
                  ),
                ),
              ],
            ),
            Divider(thickness: 9,color: Colors.blueGrey.shade50,),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 16,left: 16,right: 16),
                    child: Row(
                      children: [
                        SizedBox(width: 6,),
                        CircleAvatar(
                          backgroundColor: Colors.grey.shade100,
                          radius: 14,
                          child: Icon(Icons.person,color: Colors.grey.shade700,size: 16,),
                        ),
                        SizedBox(width: 10,),
                        Text('SENDERS DETAILS',style: TextStyle(color: Colors.grey.shade700,fontSize: 13),),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 60,bottom: 6),
                    child: Text('Farha Faeja Emu',style: TextStyle(color: Colors.black,fontSize: 13,fontWeight: FontWeight.w500),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 60,bottom: 6),
                    child: Text('29, Shah Magdum Avenue, Sector 12',style: TextStyle(color: Colors.grey.shade600,fontSize: 13),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 60,bottom: 10),
                    child: Text('01771393745',style: TextStyle(color: Colors.grey.shade600,fontSize: 13),),
                  ),
                  Divider(thickness: 9,color: Colors.blueGrey.shade50,),
                ],
              ),
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 16,left: 16,right: 16),
                    child: Row(
                      children: [
                        SizedBox(width: 6,),
                        CircleAvatar(
                          backgroundColor: Colors.grey.shade100,
                          radius: 14,
                          child: Icon(Icons.location_on,color: Colors.red,size: 16,),
                        ),
                        SizedBox(width: 10,),
                        Text('RECEIVERS DETAILS',style: TextStyle(color: Colors.grey.shade700,fontSize: 13),),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 60,bottom: 6,right: 30),
                    child: Text('Farha',style: TextStyle(color: Colors.black,fontSize: 13,fontWeight: FontWeight.w500),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 60,bottom: 6),
                    child: Text('Uttara, Sector 9, Road 7',style: TextStyle(color: Colors.grey.shade600,fontSize: 13),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 60,bottom: 10),
                    child: Text('01790151245',style: TextStyle(color: Colors.grey.shade600,fontSize: 13),),
                  ),
                  Divider(thickness: 9,color: Colors.blueGrey.shade50,),
                ],
              ),
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 16,left: 16,right: 16),
                    child: Row(
                      children: [
                        SizedBox(width: 6,),
                        CircleAvatar(
                          backgroundColor: Colors.orange,
                          radius: 14,
                          child: Icon(Icons.shopping_bag,color: Colors.white,size: 16,),
                        ),
                        SizedBox(width: 10,),
                        Text('Parcel',style: TextStyle(color: Colors.grey.shade700,fontSize: 13,fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 60,bottom: 6,right: 30),
                    child: Text('1.5 Kg',style: TextStyle(color: Colors.grey.shade600,fontSize: 13),),
                  ),

                  Divider(thickness: 9,color: Colors.blueGrey.shade50,),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: Image.asset('assets/images/coo.jpg',height: 30,width: 30,),
                title: Text('Home Pickup'),
                trailing: Text('৳95',style: TextStyle(color: Colors.grey.shade700,fontSize: 16,fontWeight: FontWeight.bold)),
              ),
            ),
            Divider(thickness: 9,color: Colors.blueGrey.shade50,),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: InkWell(
                onTap: (){

                  showModalBottomSheet(
                  isScrollControlled: false,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
                  isDismissible: false,
                  enableDrag: false,
                  context: context,
                  builder: (BuildContext context){
                    return Container(
                      height: 420,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text('Select a cancellation reason',
                              style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w500),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              child: Column(
                                children: <Widget>[
                                  RadioListTile(
                                    title: Text("I don't need to send courier right now"),
                                      value: "I don't need to send courier right now",
                                      groupValue: reason,
                                      onChanged: (value){
                                        setState(() {
                                          reason = value.toString();
                                        });
                                      }
                                  ),
                                  RadioListTile(
                                    title: Text("Pickup/Destination location was incorrect"),
                                      value: "Pickup/Destination location was incorrect",
                                      groupValue: reason,
                                      onChanged: (value){
                                        setState(() {
                                          reason=value.toString();
                                        });
                                      }
                                  ),
                                  RadioListTile(
                                    title: Text("I waited too long"),
                                      value: "I waited too long",
                                      groupValue: reason,
                                      onChanged: (value){
                                        setState(() {
                                          reason=value.toString();
                                        });
                                      }
                                  ),
                                  RadioListTile(
                                    title: Text("I think the charge is too much"),
                                      value: "I think the charge is too much",
                                      groupValue: reason,
                                      onChanged: (value){
                                        setState(() {
                                          reason=value.toString();
                                        });
                                      }
                                  ),
                                  RadioListTile(
                                    title: Text("None of the above"),
                                      value: "None of the above",
                                      groupValue: reason,
                                      onChanged: (value){
                                        setState(() {
                                          reason=value.toString();
                                        });
                                      }
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8,left: 8,right: 8),
                            child: Center(
                              child: Container(
                                height: 45,width: 320,
                                color: Colors.white,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Color(0xFFF59191),
                                  ),
                                  onPressed: () async{
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                    Navigator.pop(context);



                                  },
                                  child: Text('Submit',style: TextStyle(fontWeight: FontWeight.normal,fontSize: 16)),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                  );

                },
                child: Row(
                  children: [
                    Icon(Icons.close,size: 20,color: Colors.red,),
                    SizedBox(width: 10,),
                    Text('Cancel Order',style: TextStyle(color: Colors.red.shade600,fontSize: 16)),
                  ],
                ),
              ),
            )

          ],
        ),
      ),
      bottomNavigationBar:  Padding(
        padding: const EdgeInsets.all(12),
        child: Container(
          height: 45,width: 320,
          color: Colors.white,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Color(0xFFF59191),
            ),
            onPressed: () async{

              Navigator.pop(context);
              Navigator.pop(context);
              Navigator.pop(context);
              Navigator.pop(context);

              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return CourierStatus();
                  })
              );
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(builder: (context) {
              //       return KioskOrderConfirmationPage();
              //     })
              // );
            },
            child: Text('Done',style: TextStyle(fontWeight: FontWeight.normal,fontSize: 16)),
          ),
        ),
      ),
    );
  }
}
