

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'OrderConfirmationHomePickup.dart';

class PickUpPointManual extends StatefulWidget{

  final String receiversPhoneNo;
  final String receiversName;
  final String district;
  final String thana;
  final String country;
  final String fullAddress;
  final double courierWaight;
  final String courierType;

  const PickUpPointManual({super.key, required this.receiversPhoneNo, required this.receiversName, required this.district, required this.thana, required this.country, required this.fullAddress, required this.courierWaight, required this.courierType});



  @override
  State<PickUpPointManual> createState() => _PickUpPointManualState();
}

class _PickUpPointManualState extends State<PickUpPointManual> {
  List<String> list_District = <String>['Select District','Barguna','Barishal','Bhola','Jhalokati','Patuakhali','Pirojpur','Bandarban','Brahmanbaria','Chandpur','Chattogram','Cumilla',"Cox's Bazar",'Fenni','Khagrachhari','Lakshmipur','Noakhali','Rangamati','Dhaka','Faridpur','Gazipur','Gopalganj','Kishoreganj','Madaripur','Manikganj','Munshiganj','Narayanganj','Narsingdi','Rajbari','Shariatpur','Tangail','Bagerhat','Chuadanga','Jashore','Jhenaidah','Khulna','Kushtia','Magura','Meherpur','Narail','Jamalpur','Mymensingh','Natore',];

  String dropdownValue_District = 'Select District' ;

  List<String> list_Thana = <String>['Select Thana/locality','Adabar','Badda','Bangsal','Bimanbandar','Cantonment','Chowkbazar','Darus Salam','Demra','Dhakshinkhan','Dhanmondi','Gendaria',"Gulshan",'Hazaribag','Jatrabari','Kadamtali','Kafrul','Kalabagan','Kamrangirchar','Khilgon','Khilkhet','Kotwali','Lalbagh','Mirpur','Mohammadpur','New Market','Pallabi','Rampura','Uttar Khan',];

  String dropdownValue_Thana = 'Select Thana/locality';

  TextEditingController Sender_phone= TextEditingController();
  TextEditingController Sender_address = TextEditingController();
  TextEditingController SenderName=TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        child: Column(
          children: [

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Container(
                    height: 58,//width: 160,
                    //margin: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey,width: 1),
                        borderRadius: BorderRadius.circular(5.0),
                        color: Colors.white
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        child: DropdownButtonHideUnderline(
                          child: ButtonTheme(
                            //alignedDropdown: true,
                            child: DropdownButton<String>(
                              value: dropdownValue_District,
                              icon: const Icon(Icons.arrow_drop_down,size: 20,),
                              //elevation: 16,
                              style: const TextStyle(color: Colors.black),
                              onChanged: (String? value) {
                                setState(() {
                                  dropdownValue_District = value!;
                                });
                              },
                              items: list_District.map<DropdownMenuItem<String>>((String value) {
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







                  Container(
                    height: 58,//width: 160,
                    //margin: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey,width: 1),
                        borderRadius: BorderRadius.circular(5.0),
                        color: Colors.white
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child:   Container(
                        child: DropdownButtonHideUnderline(
                          child: ButtonTheme(
                            //alignedDropdown: true,
                            child: DropdownButton<String>(
                              value: dropdownValue_Thana,
                              icon: const Icon(Icons.arrow_drop_down,size: 20,),
                              //elevation: 16,
                              style: const TextStyle(color: Colors.black),
                              onChanged: (String? value) {
                                setState(() {
                                  dropdownValue_Thana = value!;
                                });
                              },
                              items: list_Thana.map<DropdownMenuItem<String>>((String value) {
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
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                cursorColor: Colors.red,
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey, width: 1.0),),
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey, width: 1.0),),
                  labelText: 'Enter Sender Name',
                  labelStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.normal, color: Colors.grey
                  ),
                ),
                controller: SenderName,
                onSubmitted: (String value) {
                  debugPrint(value);
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                cursorColor: Colors.red,
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey, width: 1.0),),
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey, width: 1.0),),
                  labelText: 'Sender Phone Number ',
                  labelStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.normal, color: Colors.grey
                  ),
                  suffixIcon: Icon(Icons.perm_contact_cal,color: Colors.grey,size: 26,),
                ),
                controller: Sender_phone,
                onSubmitted: (String value) {
                  debugPrint(value);
                },
              ),
            ),



            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                cursorColor: Colors.red,
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey, width: 1.0),),
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey, width: 1.0),),
                  labelText: 'Enter full address',
                  labelStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.normal, color: Colors.grey
                  ),
                ),
                controller: Sender_address,
                onSubmitted: (String value) {
                  debugPrint(value);
                },
              ),
            ),







            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1
                )
              ),
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                maxLines: 3,

                decoration: InputDecoration(

                ),

              ),
            ),




            ElevatedButton(onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return OrderConfirmation(
                      receiversPhoneNo: widget.receiversPhoneNo,
                      receiversName: widget.receiversName,
                      fullAddress: widget.fullAddress,
                      courierWaight: widget.courierWaight,
                      courierType: widget.courierType,
                      district: widget.district,
                      thana: widget.thana,
                      country: widget.country,
                      senderPhoneNumber:Sender_phone.text ,
                      SenderName: SenderName.text,
                      SenderfullAddress: Sender_address.text,
                      SenderThana: dropdownValue_Thana.toString(),
                      SendrDistrict: dropdownValue_District,



                    );//const AddPickUpPage();
                  },
                ),
              );
            }, child: Text("Confirm PicKup")),




          ],
        ),
      ),
    );
  }
}