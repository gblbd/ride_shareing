import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:ride_sharing/Pages/HomePage/Courier/pickupRequestPage.dart';

class OrderConfirmation extends StatelessWidget {

  final String receiversPhoneNo;
  final String receiversName;
  final String district;
  final String thana;
  final String country;
  final String fullAddress;
  final double courierWaight;
  final String courierType;

  final String senderPhoneNumber;
  final String SenderName;
  final String SendrDistrict;
  final String SenderThana;
  final String SenderfullAddress;


   OrderConfirmation({super.key, required this.receiversPhoneNo, required this.receiversName, required this.district, required this.thana, required this.country, required this.fullAddress, required this.courierWaight, required this.courierType, required this.senderPhoneNumber, required this.SenderName, required this.SendrDistrict, required this.SenderThana, required this.SenderfullAddress});


  FirebaseDatabase database = FirebaseDatabase.instance;
  DatabaseReference ref = FirebaseDatabase.instance.ref("User_profile");

  // const OrderConfirmation({super.key, required this.receiversPhoneNo, required this.receiversName, required this.district, required this.thana, required this.country, required this.fullAddress, required this.courierWaight, required this.courierType});



  //const OrderConfirmation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        backgroundColor: Colors.white,
        title: Text('Order Confirmation',style: TextStyle(color: Colors.black),),
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
                      border: Border.all(color: Colors.red,width: 0.1),
                      borderRadius: BorderRadius.circular(6.0),
                      color: Colors.red.shade50,
                  ),
                  child: Center(child: Text('Order before 4 PM and we will pick your courier today',
                    style: TextStyle(color: Colors.red.shade900,fontSize: 13),textAlign: TextAlign.center,))),
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
                    child: Text('${SenderName}',style: TextStyle(color: Colors.black,fontSize: 13,fontWeight: FontWeight.w500),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 60,bottom: 6),
                    child: Text('${SenderfullAddress}',style: TextStyle(color: Colors.grey.shade600,fontSize: 13),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 60,bottom: 10),
                    child: Text('${senderPhoneNumber}',style: TextStyle(color: Colors.grey.shade600,fontSize: 13),),
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
                    child: Row(
                      children: [
                        Text('${receiversName}',style: TextStyle(color: Colors.black,fontSize: 13,fontWeight: FontWeight.w500),),
                        Spacer(),
                        GestureDetector(
                            onTap: (){},
                            child: Icon(Icons.edit,color: Colors.grey.shade700,size: 16,))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 60,bottom: 6),
                    child: Text('${fullAddress}',style: TextStyle(color: Colors.grey.shade600,fontSize: 13),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 60,bottom: 10),
                    child: Text('${receiversPhoneNo}',style: TextStyle(color: Colors.grey.shade600,fontSize: 13),),
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
                    child: Row(
                      children: [
                        Text('${courierWaight} Kg',style: TextStyle(color: Colors.grey.shade600,fontSize: 13),),
                        Spacer(),
                        GestureDetector(
                            onTap: (){},
                            child: Icon(Icons.edit,color: Colors.grey.shade700,size: 16,))
                      ],
                    ),
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
            Container(
              height: 80,
              color: Colors.blueGrey.shade50,
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Text('By proceeding you are agreeing to our Terms & Conditions',style: TextStyle(color: Colors.grey.shade600,fontSize: 13),),
            ),


          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          height: 50,width: 300,
          color: Colors.white,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.red,
            ),
            onPressed: () async{

              showModalBottomSheet(
              isScrollControlled: false,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
              isDismissible: false,
              enableDrag: false,
               context: context,
               builder: (BuildContext context){
                return Padding(
                  padding: EdgeInsets.only(
                    left: 10,right: 8,
                    top: 10,
                    bottom: MediaQuery.of(context).viewInsets.bottom + 0.5,),
                  child: Container(
                    height: 350,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Container(
                              height: 150,width: 200,
                                child: Image.asset('assets/images/package.png',)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text('Packaging Instruction',style: TextStyle(fontSize: 17,color: Colors.black,fontWeight: FontWeight.bold)),
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
                                        backgroundColor: Colors.blueGrey.shade50,
                                        radius: 9,
                                        child:  Text('1',style: TextStyle(color: Colors.grey.shade700,fontSize: 10,),),

                                      ),
                                      SizedBox(width: 10,),
                                      Text('Please use proper packaging to keep your',style: TextStyle(color: Colors.grey.shade700,fontSize: 14,),),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 50,bottom: 6,right: 30),
                                  child: Column(
                                    children: [
                                      Text('item Safe.',style: TextStyle(color: Colors.grey.shade700,fontSize: 14),),
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
                                  padding: const EdgeInsets.only(top: 16,left: 16,right: 16),
                                  child: Row(
                                    children: [
                                      SizedBox(width: 6,),
                                      CircleAvatar(
                                        backgroundColor: Colors.blueGrey.shade50,
                                        radius: 9,
                                        child:  Text('2',style: TextStyle(color: Colors.grey.shade700,fontSize: 10,),),

                                      ),
                                      SizedBox(width: 10,),
                                      Text('Write down the receivers details on the',style: TextStyle(color: Colors.grey.shade700,fontSize: 14,),),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 50,bottom: 6,right: 30),
                                  child: Column(
                                    children: [
                                      Text('package to ensure proper delivery.',style: TextStyle(color: Colors.grey.shade700,fontSize: 14),),
                                    ],
                                  ),
                                ),

                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Container(
                                height: 46,
                                width: 330,
                                color: Colors.white,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.red.shade600,
                                  ),
                                  onPressed: () async{


                                    DatabaseReference rf= ref.child(senderPhoneNumber).child("user").child("Courier").push();
                                    //DatabaseReference orderRef=ref.child(widget.phoneNumber).child("user").child("Courier").child(_phone.text.toString());

                                    await rf.set({
                                      "Receiver_Phone_Number": "${receiversPhoneNo}",
                                      "Receiver_Name": "${receiversName}",
                                      "District": "${district}",
                                      "Thana": "${thana}",
                                      "country":"${country}",
                                      "Full_Address": "${fullAddress}",
                                      "Courier_Weight": courierWaight,
                                      "Courier_Type":"${courierType}",
                                      "senderName":"${SenderName}",
                                      "senderPhoneNumber":"${senderPhoneNumber}",
                                      "senderThana":"${SenderThana}",
                                      "senderDistrict":"${SendrDistrict}",
                                      "senderAddress":"${SenderfullAddress}",
                                      "parcelStatus":0
                                    }).then((value){

                                      //senderPostRef.key.toString()


                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) {
                                            return PickupRequestPage(
                                              ID: rf.key.toString(),
                                              SenderPhoneNumber: senderPhoneNumber,
                                              Sendername: SenderName,
                                              SenderAddress: SenderfullAddress,
                                              ReceiverName: receiversName,
                                              ReceiverPhoneNumber: receiversPhoneNo,
                                              ReceiversAddress: fullAddress,
                                              ParcelWaight: courierWaight,
                                            );
                                          })
                                      );



                                    });


                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(builder: (context) {
                                    //       return PickupRequestPage();
                                    //     })
                                    // );

                                  },
                                  child: Text('I Understand',style: TextStyle(fontWeight: FontWeight.normal,fontSize: 16)),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
               }

              );
            },
            child: Text('Send Request',style: TextStyle(fontWeight: FontWeight.normal,fontSize: 16)),
          ),
        ),
      ),
    );

  }
}
