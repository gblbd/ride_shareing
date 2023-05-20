import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'AddPickUpPage.dart';
import 'GetQuotationPageView.dart';
import 'SelectCityList.dart';
import 'SelectZoneList.dart';

class OrderDetailsPage extends StatefulWidget {
  final String phoneNumber;

  const OrderDetailsPage({Key? key, required this.phoneNumber}) : super(key: key);

  @override
  State<OrderDetailsPage> createState() => _OrderDetailsPageState();
}

class _OrderDetailsPageState extends State<OrderDetailsPage> {
  static final _phone =TextEditingController();
  static final _name =TextEditingController();
  static final _address =TextEditingController();
  static final _area =TextEditingController();
  static final _zone =TextEditingController();
  static final _city =TextEditingController();
  static final _itemsValue =TextEditingController();
 double _value = 0.5;
 double min=0.5;
 double max=5.0;



  List<String> list_District = <String>['Select District','Barguna','Barishal','Bhola','Jhalokati','Patuakhali','Pirojpur','Bandarban','Brahmanbaria','Chandpur','Chattogram','Cumilla',"Cox's Bazar",'Fenni','Khagrachhari','Lakshmipur','Noakhali','Rangamati','Dhaka','Faridpur','Gazipur','Gopalganj','Kishoreganj','Madaripur','Manikganj','Munshiganj','Narayanganj','Narsingdi','Rajbari','Shariatpur','Tangail','Bagerhat','Chuadanga','Jashore','Jhenaidah','Khulna','Kushtia','Magura','Meherpur','Narail','Jamalpur','Mymensingh','Natore',];
  String dropdownValue_District = 'Select District' ;

  List<String> list_Thana = <String>['Select Thana','Adabar','Badda','Bangsal','Bimanbandar','Cantonment','Chowkbazar','Darus Salam','Demra','Dhakshinkhan','Dhanmondi','Gendaria',"Gulshan",'Hazaribag','Jatrabari','Kadamtali','Kafrul','Kalabagan','Kamrangirchar','Khilgon','Khilkhet','Kotwali','Lalbagh','Mirpur','Mohammadpur','New Market','Pallabi','Rampura','Uttar Khan',];
  String dropdownValue_Thana = 'Select Thana';
  List<String> list_Area = <String>['Select Area','Adarsha Para','Atipara','Balur Math','Chamurkhan','Chanpara','Chapan','Dobadiya','Helal Market','Jamtola','Jiyabagh','Kalabagan',"Kanchkura",'Kuripara','Madarbari','Maosaid','Master Para','Mazar Chowrasta','Moinar Tek','Munda','Termukh','UttarKhan',];
  String dropdownValue_Area = 'Select Area';


  FirebaseDatabase database = FirebaseDatabase.instance;
  DatabaseReference ref = FirebaseDatabase.instance.ref("User_profile");

  // DatabaseReference courierRef= FirebaseDatabase.instance.ref("User_profile").child("Profile").child("User").push();
 //  void addCourierToDatabase(String userId) {
 //    DatabaseReference courierRef=rf.child('profile').child(userId).child('user').child('courier').push();
 //  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text('Courier Order Details',style: TextStyle(color: Colors.black),),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 60,
              child: TextButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const GetQuotationPageView();
                      },
                    ),
                  );
                },
                child: ListTile(
                  leading: CircleAvatar(
                      backgroundColor: Colors.blueGrey.shade50,
                      child: const Icon(Icons.point_of_sale, size: 20,color: Colors.red,)
                  ),
                  title: const Text('Get Quotation'),
                  trailing: const Icon(Icons.arrow_forward_ios_sharp,size: 14,),
                ),
              ),
            ),
            Divider(color: Colors.blueGrey.shade50,thickness: 4,),
            const SizedBox(height: 5,),
            const Text('    Receiver Details',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,),),
            //SizedBox(height: 3,),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                cursorColor: Colors.red,
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey, width: 1.0),),
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey, width: 1.0),),
                  labelText: 'Receivers Phone Number ',
                  labelStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.normal, color: Colors.grey
                  ),
                  suffixIcon: Icon(Icons.perm_contact_cal,color: Colors.grey,size: 26,),
                ),
                controller: _phone,
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
                  labelText: 'Receivers Name ',
                  labelStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.normal, color: Colors.grey
                  ),
                ),
                controller: _name,
                onSubmitted: (String value) {
                  debugPrint(value);
                },
              ),
            ),
            Divider(color: Colors.blueGrey.shade50,thickness: 4,),
            const SizedBox(height: 5,),
            const Text('    Delivery Address*',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,),),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Container(
                    height: 58,width: 160,
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
                      // TextField(
                      //   controller: _city,
                      //   cursorColor: Colors.red.shade900,
                      //   decoration: InputDecoration(
                      //       border: InputBorder.none,
                      //       hintText: 'Enter District*',
                      //       hintStyle: TextStyle(fontSize: 17,color: Colors.grey)
                      //   ),
                      //   onTap: () async{
                      //
                      //     DropdownButtonHideUnderline(
                      //       child: ButtonTheme(
                      //         alignedDropdown: true,
                      //         child: DropdownButton<String>(
                      //           value: dropdownValue_District,
                      //           icon: const Icon(Icons.arrow_drop_down,size: 20,),
                      //           //elevation: 16,
                      //           style: const TextStyle(color: Colors.black),
                      //           onChanged: (String? value) {
                      //             setState(() {
                      //               dropdownValue_District = value!;
                      //             });
                      //           },
                      //           items: list_District.map<DropdownMenuItem<String>>((String value) {
                      //             return DropdownMenuItem<String>(
                      //               value: value,
                      //               child: Text(value,
                      //                 style: TextStyle(
                      //                     fontSize: 16,
                      //                     fontWeight: FontWeight.w400
                      //                 ),
                      //               ),
                      //             );
                      //           }).toList(),
                      //         ),
                      //       ),
                      //     );
                      //
                      //
                      //
                      //
                      //
                      //
                      //
                      //
                      //
                      //
                      //
                      //
                      //
                      //     // Navigator.push(
                      //     //     context,
                      //     //     MaterialPageRoute(builder: (context) {
                      //     //       return const SelectCityListPage();
                      //     //     })
                      //     // );
                      //   },
                      //   readOnly: true,
                      // ),
                    ),

                  ),
                  Spacer(),
                  Container(
                    height: 58,width: 160,
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
                      // TextField(
                      //   controller: _zone,
                      //   cursorColor: Colors.red.shade900,
                      //   decoration: InputDecoration(
                      //       border: InputBorder.none,
                      //       hintText: 'Enter Thana*',
                      //       hintStyle: TextStyle(fontSize: 17,color: Colors.grey)
                      //   ),
                      //   onTap: (){
                      //     Navigator.push(
                      //         context,
                      //         MaterialPageRoute(builder: (context) {
                      //           return const SelectZoneList();
                      //         })
                      //     );
                      //   },
                      //   readOnly: true,
                      // ),
                    ),

                  ),
                ],
              ),
            ),
            Container(
              height: 58,
              width: 420,
              margin: const EdgeInsets.all(16),
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
                        value: dropdownValue_Area,
                        icon: const Icon(Icons.arrow_drop_down,size: 20,),
                        //elevation: 16,
                        style: const TextStyle(color: Colors.black),
                        onChanged: (String? value) {
                          setState(() {
                            dropdownValue_Area = value!;
                          });
                        },
                        items: list_Area.map<DropdownMenuItem<String>>((String value) {
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
                controller: _address,
                onSubmitted: (String value) {
                  debugPrint(value);
                },
              ),
            ),
            Divider(color: Colors.blueGrey.shade50,thickness: 4,),
            const SizedBox(height: 5,),
            const Text('    Courier Weight',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,),),
            Container(
              //width: 350,
              child: Slider(
                value: _value,
                autofocus: false,
                min: min,
                max: max,
                divisions: 9,
                activeColor: Colors.red,
                inactiveColor: Colors.red.shade300,
                thumbColor: Colors.red,
               label: _value.toStringAsFixed(1),
                // label: _value.round().toString(),
                onChanged: (  value){
                  setState(() {
                    _value = value.toDouble();
                  });
                },
              ),
            ),
            Row(
              children: const [
                SizedBox(width: 15,),
                Text('0.5 kg'),Spacer(),
                Text('5 kg'), SizedBox(width: 15,),
              ],
            ),
            const Divider(thickness: 1,indent: 6,endIndent: 10,),
            TextButton(
                onPressed: (){
                  showModalBottomSheet(
                    isScrollControlled: false,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
                    isDismissible: false,
                    enableDrag: false,
                    context: context,
                    builder: (BuildContext context)
                    {
                      return Padding(
                        padding: EdgeInsets.only(
                          left: 6,
                          top: 10,
                          bottom: MediaQuery.of(context).viewInsets.bottom + 0.5,
                        ),
                        child: Container(
                          height: 230,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                               Padding(padding: const EdgeInsets.all(2.0),
                               child: Row(
                                 children: [
                                   const Text('Select Courier Type',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 22),),Spacer(),
                                   TextButton(
                                       onPressed: (){
                                         Navigator.pop(context);
                                       },
                                       child: const Icon(Icons.close,color: Colors.black,)),
                                 ],
                               ),
                               ),
                                TextButton(onPressed: () {
                                  showModalBottomSheet(

                                    isScrollControlled: true,
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
                                      context: context,
                                    builder: (BuildContext context){
                                      return Padding(
                                          padding: EdgeInsets.only(
                                            left: 6,
                                            top: 10,
                                            bottom: MediaQuery.of(context).viewInsets.bottom + 0.5,
                                          ),
                                        child: Container(
                                          height: 300,
                                          child: Column(
                                            children: [
                                              Padding(padding: const EdgeInsets.all(2.0),
                                                child: Row(
                                                  children: [
                                                    const Text('   Item Type',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 22),),Spacer(),
                                                    TextButton(
                                                        onPressed: (){
                                                          Navigator.pop(context);

                                                          // Navigator.push(
                                                          //   context,
                                                          //   MaterialPageRoute(
                                                          //     builder: (context) {
                                                          //       return const OrderDetailsPage();
                                                          //     },
                                                          //   ),
                                                          // );
                                                        },
                                                        child: const Icon(Icons.close,color: Colors.black,)),
                                                  ],
                                                ),
                                              ),
                                               Padding(
                                                   padding: EdgeInsets.all(8.0),
                                               child: TextButton(
                                                 onPressed: (){},
                                                 child: Container(
                                                   height: 60,
                                                   //width: 320,
                                                   decoration: BoxDecoration(
                                                     border: Border.all(color: Colors.grey.shade400,width: 1.2),
                                                     borderRadius: BorderRadius.circular(5.0),
                                                   ),
                                                   child: Row(
                                                     children: [
                                                       Column(
                                                         crossAxisAlignment: CrossAxisAlignment.start,
                                                         children: [
                                                           SizedBox(height: 9,),
                                                           Text('  Item Type',style: TextStyle(fontSize: 14,color: Colors.grey,fontWeight: FontWeight.normal),),
                                                           Text('  Parcel',style: TextStyle(fontSize: 17,color: Colors.black,fontWeight: FontWeight.normal),),
                                                         ],
                                                       ),
                                                       Spacer(),
                                                       Icon(Icons.arrow_forward_ios,size: 10,color: Colors.grey.shade600,),
                                                       SizedBox(width: 10,)
                                                     ],
                                                   ),
                                                 ),
                                               ),
                                               ),
                                              Padding(padding: EdgeInsets.all(16.0),
                                              child: TextField(
                                                  cursorColor: Colors.red,
                                                  decoration: const InputDecoration(
                                                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey, width: 1.0),),
                                                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey, width: 1.0),),
                                                    labelText: 'Items Value(Optional)',
                                                    labelStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.normal, color: Colors.grey
                                                    ),
                                                  ),
                                                  controller: _itemsValue,
                                                  onSubmitted: (String value) {
                                                    debugPrint(value);
                                                  },
                                              ),
                                              ),
                                              Center(
                                                child: SizedBox(height: 50,width: 320,
                                                  child: ElevatedButton(
                                                    style: ElevatedButton.styleFrom(
                                                      primary: Colors.red,
                                                    ),
                                                    onPressed: (){},
                                                    child: const Text('Confirm',style: TextStyle(fontWeight: FontWeight.normal,fontSize: 16)),
                                                  ),
                                                ),
                                              ),

                                            ],
                                          ),
                                        ),
                                      );

                                    },
                                  );
                                },
                                  child: ListTile(
                                    leading: CircleAvatar(
                                      radius: 15,
                                      backgroundColor: Colors.orange.shade800,
                                        child: const Icon(Icons.shopping_bag,size: 18,color: Colors.white,),
                                    ),
                                    title: const Text('Parcel',
                                      style: TextStyle(fontWeight: FontWeight.normal,fontSize: 16,),
                                    ),
                                    subtitle: const Text('Non-perishable goods, no fragile,no food items',
                                      style: TextStyle(fontWeight: FontWeight.normal,fontSize: 12,),
                                    ),
                                    trailing: Icon(Icons.arrow_forward_ios,color: Colors.grey.shade800,size: 16,),
                                  ),
                                ),
                                const Divider(indent: 6,endIndent: 10,),
                                TextButton(onPressed: () {  },
                                  child: ListTile(
                                    leading: CircleAvatar(
                                      radius: 15,
                                      backgroundColor: Colors.green.shade800,
                                      child: const Icon(Icons.my_library_books_sharp,size: 18,color: Colors.white,),
                                    ),
                                    title: const Text('Document',
                                      style: TextStyle(fontWeight: FontWeight.normal,fontSize: 16,),
                                    ),
                                    subtitle: const Text('No passport or bank cheques',
                                      style: TextStyle(fontWeight: FontWeight.normal,fontSize: 12,),
                                    ),
                                    trailing: Icon(Icons.arrow_forward_ios,color: Colors.grey.shade800,size: 16,),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
                child: Row(
                  children: const [
                    SizedBox(width: 7,),
                    Icon(Icons.add_circle_outline_sharp,size: 18,color: Colors.red,),SizedBox(width: 9,),
                    Text('Select Courier Type',style: TextStyle(fontWeight: FontWeight.normal,fontSize: 12,color: Colors.black)),Spacer(),
                    Text('Change Item Type',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 12,color: Colors.red)),SizedBox(width: 9,),
                  ],
                ),
            ),
            const Divider(thickness: 1,indent: 8,endIndent: 9,),
            const SizedBox(height: 8,),
            Center(
              child: SizedBox(height: 50,width: 320,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                  ),
                  onPressed: ()async{

                    await ref.child(widget.phoneNumber).child('user').child("Courier").push().set({
                      "Receiver_Phone_Number": _phone.text,
                      "Receiver_Name": _name.text,
                      "District": dropdownValue_District.toString(),
                      "Thana": dropdownValue_Thana.toString(),
                      "Area":dropdownValue_Area.toString(),
                      "Full_Address": _address.text,
                      "Courier_Weight": _value.toDouble(),
                    }).then((value) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const AddPickUpPage();
                          },
                        ),
                      );
                    });

                  },
                  child: const Text('Confirm',style: TextStyle(fontWeight: FontWeight.normal,fontSize: 16)),
                ),
              ),
            ),
            const SizedBox(height: 15,),
          ],
        ),
      ),
    );
  }
}
