import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'TermsAndConditions.dart';


class SignUpPage extends StatefulWidget {

  final String phoneNumber;

  const SignUpPage({super.key, required this.phoneNumber});
 // const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  FirebaseDatabase database = FirebaseDatabase.instance;
  DatabaseReference ref = FirebaseDatabase.instance.ref("User_profile");

  TextEditingController fullnameContriller=TextEditingController();
  TextEditingController emailAddressController=TextEditingController();


  DateTime selectedDate = DateTime.now();

  String GenderType='Male';
  TextEditingController _dob=TextEditingController();

  @override
  void initState(){
    _dob.text="";
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Sign Up",
          style: TextStyle(
              color: Colors.black
          ),
        ),
        titleSpacing: 140,

        automaticallyImplyLeading: false,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Icon(Icons.account_circle,size: 90,color: Colors.grey,)),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.black38
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8,right: 8),
                  child: TextField(

                    controller: fullnameContriller,

                    decoration: InputDecoration(
                        label: Text('Full Legal Name'),
                        labelStyle: TextStyle(
                            color: Colors.black45,
                            fontSize: 16
                        ),
                        border: InputBorder.none

                    ),
                    cursorColor: Colors.red.shade700,

                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.black38
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8,right: 8),
                  child: TextField(
                    controller: emailAddressController,
                    decoration: InputDecoration(
                        label: Text("Email Address"),
                        labelStyle: TextStyle(
                            color: Colors.black45,
                            fontSize: 16
                        ),
                        border: InputBorder.none
                    ),
                    cursorColor: Colors.red.shade700,

                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.black38
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8,right: 8),
                  child: TextField(
                    controller: _dob,
                    decoration: InputDecoration(
                        label: Text('Date of Birth'),
                        labelStyle: TextStyle(
                            color: Colors.black45,
                            fontSize: 16
                        ),
                        suffixIcon: Icon(Icons.calendar_today_sharp,size: 28,color: Colors.grey,),
                        border: InputBorder.none
                    ),
                    readOnly: true,
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2025)
                      );
                      if (pickedDate != null) {

                        String formattedDate = DateFormat('MM/dd/yyyy').format(pickedDate).toString();
                        setState(() {
                          _dob.text = formattedDate;
                        });
                      }
                    },
                    cursorColor: Colors.red.shade700,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16,right: 16,top: 8,bottom: 8),
              child: Text('Gender',
                style: TextStyle(
                    fontSize: 18
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: RadioListTile(
                      title: Text("Male",
                        style: TextStyle(
                            fontSize: 14
                        ),
                      ),
                      value: "Male",
                      groupValue: GenderType,
                      onChanged: (value){
                        setState(() {
                          GenderType = value.toString();
                        });
                      },
                      contentPadding: EdgeInsets.zero,
                      dense: true,
                      visualDensity: VisualDensity.adaptivePlatformDensity,

                    ),
                  ),

                  Expanded(
                    child: RadioListTile(
                      title: Text("Female",
                        style: TextStyle(
                            fontSize: 14
                        ),
                      ),
                      value: "Female",
                      groupValue: GenderType,
                      onChanged: (value){
                        setState(() {
                          GenderType = value.toString();
                        });
                      },
                      contentPadding: EdgeInsets.zero,
                      dense: true,
                      visualDensity: VisualDensity.adaptivePlatformDensity,


                    ),
                  ),
                  Expanded(
                    child: RadioListTile(
                      title: Text("Other",
                        style: TextStyle(
                            fontSize: 14
                        ),
                      ),
                      value: "Other",
                      groupValue: GenderType,
                      onChanged: (value){
                        setState(() {
                          GenderType = value.toString();
                        });
                      },
                      contentPadding: EdgeInsets.zero,
                      dense: true,
                      visualDensity: VisualDensity.adaptivePlatformDensity,

                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: RichText(text: TextSpan(
                  text: "By signing up you are accepting all our Terms and Privacy policy",
                  style: TextStyle(color: Colors.black,fontSize: 17)
              ),
              ),
            ),

            Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 16,right: 16),
                child: Container(
                  height: 50,
                  width: 350,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      color: Colors.red.shade300
                  ),
                  child: TextButton(
                    onPressed: ()async{



                      await ref.child("${widget.phoneNumber}").child("profile").set({
                        "full_name": "${fullnameContriller.text.toString()}",
                        //"last_name": "_lastName",
                        "Date_of_Birth": "${_dob.text.toString()}",
                        "gender": "$GenderType",
                        "email": "${emailAddressController.text.toString()}",
                        "mobile_no": "${widget.phoneNumber}",




                        // "address": {
                        //   "line1": "100 Mountain View"
                        // }
                      }).then((value) {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return TermsAndConditions();
                            },
                          ),
                        );
                      });


                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) =>  TermsAndConditions()),
                      // );


                    },
                    child: Text('SUBMIT',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white
                      ),
                    ),
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }










}
