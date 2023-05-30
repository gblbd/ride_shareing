import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'SelectCityList.dart';

class GetQuotationPageView extends StatefulWidget {
  final String phoneNumber;
  final String receiverPhoneNum;

  const GetQuotationPageView({Key? key, required this.phoneNumber, required this.receiverPhoneNum}) : super(key: key);

  @override
  State<GetQuotationPageView> createState() => _GetQuotationPageViewState();
}

class _GetQuotationPageViewState extends State<GetQuotationPageView> {

  FirebaseDatabase database = FirebaseDatabase.instance;
  DatabaseReference ref = FirebaseDatabase.instance.ref("User_profile");

  //final TextEditingController _pickupDistrictController=TextEditingController();
  //final TextEditingController _destinationDistrictController=TextEditingController();

List<String>List_PickupDistrict=<String>['Select District',
  'Barishal',
  'Brahmanbaria',
  'Chapainawabganj,'
  'Chittagong',
  'Comilla',
  "Cox's Bazar",
  'Dhaka',
  'Faridpur',
  'Feni',
  'Gaibandha',
  'Jamalpur',
  'Jessore',
  'Jhenaidah',
  'Khulna',
  'Kurigram',
  'Lakshmipur',
  'Lalmonirhat',
  'Madaripur',
  'Magura',
  'Manikganj',
  'Meherpur',
  'Moulvibazar',
  'Mymensingh',
  'Narsingdi',
  'Netrokona',
  'North 24 Parganas',
  'Pabna',
  'Panchagarh',
  'Rajbari',
  'Rajshahi',
  'Rangpur',
  'Satkhira',
  'Sherpur',
  'Sirajganj',
  'Sylhet',
  'Tangail',
  'Thakurgaon'];

  String dropdownValue_PickupDistrict = 'Select District' ;

List<String>List_DestinationDistrict=<String>['Select District',
  'Barishal',
  'Brahmanbaria',
  'Chapainawabganj',
  'Chittagong',
  'Comilla',
  "Cox's Bazar",
  'Dhaka',
  'Faridpur',
  'Feni',
  'Gaibandha',
  'Jamalpur',
  'Jessore',
  'Jhenaidah',
  'Khulna',
  'Kurigram',
  'Lakshmipur',
  'Lalmonirhat',
  'Madaripur',
  'Magura',
  'Manikganj',
  'Meherpur',
  'Moulvibazar',
  'Mymensingh',
  'Narsingdi',
  'Netrokona',
  'North 24 Parganas',
  'Pabna',
  'Panchagarh',
  'Rajbari',
  'Rajshahi',
  'Rangpur',
  'Satkhira',
  'Sherpur',
  'Sirajganj',
  'Sylhet',
  'Tangail',
  'Thakurgaon'];


String dropdownValue_DestinationDistrict = 'Select District' ;

  double _value = 0.5;
  double min=0.5;
  double max=5.0;
  @override
  Widget build(BuildContext context) {
    DatabaseReference rf=ref.child(widget.phoneNumber).child('user').child('Courier');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        title: Text('Get Quotation',style: TextStyle(color: Colors.black),),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16,),
            Padding(
                padding: EdgeInsets.only(left: 16,top: 14),
            child: Text('Pickup District',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.black)),
            ),
            Container(
              height: 50,
              width: 350,
              margin: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade400,width: 1.2),
                borderRadius: BorderRadius.circular(9.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  child: DropdownButtonHideUnderline(
                    child: ButtonTheme(
                      //alignedDropdown: true,
                      child: DropdownButton<String>(
                        value: dropdownValue_PickupDistrict,
                        icon: const Icon(Icons.arrow_drop_down,size: 20,),
                        //elevation: 16,
                        style: const TextStyle(color: Colors.black),
                        onChanged: (String? value) {
                          setState(() {
                            dropdownValue_PickupDistrict = value!;
                          });
                        },
                        items: List_PickupDistrict.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value,
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 16,top: 14),
              child: Text('Destination District',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.black)),
            ),
            Container(
              height: 50,
              width: 350,
              margin: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade400,width: 1.2),
                borderRadius: BorderRadius.circular(9.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  child: DropdownButtonHideUnderline(
                    child: ButtonTheme(
                      //alignedDropdown: true,
                      child: DropdownButton<String>(
                        value: dropdownValue_DestinationDistrict,
                        icon: const Icon(Icons.arrow_drop_down,size: 20,),
                        //elevation: 16,
                        style: const TextStyle(color: Colors.black),
                        onChanged: (String? value) {
                          setState(() {
                            dropdownValue_DestinationDistrict = value!;
                          });
                        },
                        items: List_DestinationDistrict.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value,
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),

              ),
            ),
            Divider(thickness: 9,color: Colors.blueGrey.shade50,),
            const Padding(
              padding: EdgeInsets.only(left: 16,top: 14),
              child: Text('Item Weight',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.black)),
            ),
            Container(
             // width: 350,
              child: Slider(
                value: _value.toDouble(),
                autofocus: false,
                min: min,
                max: max,
                divisions: 9,
                activeColor: Colors.red,
                inactiveColor: Colors.grey.shade300,
                thumbColor: Colors.red,
                label: _value.toStringAsFixed(1),
                onChanged: (  value){
                  setState(() {
                    _value = value.toDouble();
                  });
                },
              ),
            ),
            Row(
              children: [
                SizedBox(width: 15,),
                Text('0.5 kg'),Spacer(),
                Text('5 kg'), SizedBox(width: 15,),
              ],
            ),
            SizedBox(height: 185,),
            Divider(),
            Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Container(
                height: 80,
                color: Colors.white,
                child: Center(
                  child: SizedBox(height: 50,width: 320,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                      ),
                      onPressed: () async{
                       // DatabaseReference rf= ref.child(widget.phoneNumber).child("user").child("Courier").push();
                        //await ref.child(widget.phoneNumber).child('user').child('Courier').child('Get_Quotation').push().
                        DatabaseReference quotationRef=ref.child(widget.phoneNumber).child("user").child("Courier").child(widget.receiverPhoneNum).child("Get_Quotation");
                            //.child(rf.key.toString());
                        await quotationRef.update({
                          "Pickup_District":dropdownValue_PickupDistrict.toString(),
                          "Destination_District":dropdownValue_DestinationDistrict.toString(),
                          "Courier_Weight":_value.toDouble(),
                        });

                      },
                      child: Text('Get Quotation',style: TextStyle(fontWeight: FontWeight.normal,fontSize: 16)),
                    ),
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
