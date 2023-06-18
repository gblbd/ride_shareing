import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../MainScreen.dart';
import 'OTPPage.dart';
import 'SignUpPage.dart';


class LoginWithPhoneNum extends StatefulWidget {
  const LoginWithPhoneNum({Key? key}) : super(key: key);

  @override
  State<LoginWithPhoneNum> createState() => _LoginWithPhoneNumState();
}

class _LoginWithPhoneNumState extends State<LoginWithPhoneNum> {




  ///////////////////////////////////////////////////////////////////
  FirebaseDatabase database = FirebaseDatabase.instance;
  DatabaseReference ref = FirebaseDatabase.instance.ref("User_profile");
  //////////////////////////////////////////////////////////////////

  TextEditingController phoneNumbController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
   bool _isObscure=true;
  bool _isPhoneNumberValid = false;
  bool _isPasswordValid = false;
  void _validatePhoneNumber() {
    setState(() {
      _isPhoneNumberValid = phoneNumbController.text.isNotEmpty && phoneNumbController.text.length==10;
     // _isPasswordValid=passwordController.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0.0,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 80,),
            Padding(
              padding: const EdgeInsets.only(left: 16,right: 16),
              child: Text('Enter validate mobile Number and Password for Login',style: TextStyle(fontWeight: FontWeight.normal,fontSize: 16,color: Colors.grey.shade600),textAlign: TextAlign.center,),
            ),
            // Padding(
            //   padding: const EdgeInsets.only(top: 16,left: 16,right: 16),
            //   child: Text('Enter your mobile number',
            //     style: TextStyle(
            //         fontSize: 17,
            //         fontWeight: FontWeight.w500
            //     ),
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.only(left: 16,right: 16,top: 16),
              child: IntlPhoneField(
                controller: phoneNumbController,
                decoration: InputDecoration(
                  //   labelText: 'Phone Number',
                  hintText: '1XXXXXXXXX',
                  hintStyle: TextStyle(color: Colors.grey.shade400),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.black12
                    ),
                  ),
                ),
                initialCountryCode: 'BD',
                keyboardType: TextInputType.phone,
                onChanged: (_) =>_validatePhoneNumber(),


                onCountryChanged: (country) {
                  print('Country changed to: ' + country.name);
                },
              ),
            ),


           // Text('   Password',style: TextStyle(fontWeight: FontWeight.normal,color: Colors.red.shade900),),


            Container(
              padding: EdgeInsets.symmetric(horizontal: 16,vertical: 16),
              child: TextField(

                controller: passwordController,
                obscureText: _isObscure,
                keyboardType: TextInputType.text,
                cursorColor: Colors.red.shade900,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.vpn_key_sharp,size: 30,color: Colors.grey,),
                    suffixIcon: IconButton(
                      icon: Icon(_isObscure ? Icons.visibility : Icons.visibility_off),
                      onPressed: (){
                        setState(() {
                          _isObscure= !_isObscure;
                        });
                      },
                    ),
                    suffixIconColor: Colors.red,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: BorderSide(width: 1,color: Colors.grey)

                    ),


                    hintText: "Password",

                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: BorderSide(
                            color: Colors.grey,
                            width: 1.0
                        )
                    )
                ),
              ),
            ),


            Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 16,right: 16),
                child: Container(
                  height: 45,
                  width: 350,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.0),
                      color:Colors.red
                  ),
                  child: TextButton(
                    onPressed: () async{


                      final snapshot = await ref.child(phoneNumbController.text.toString()).child("profile").child("PIN Number").get();
                      final snapshotfnm = await ref.child(phoneNumbController.text.toString()).child("profile").child("full_name").get();
                      final snapshotgnm = await ref.child(phoneNumbController.text.toString()).child("profile").child("gender").get();
                      final snapshotdnm = await ref.child(phoneNumbController.text.toString()).child("profile").child("Date_of_Birth").get();
                      final snapshotEmail = await ref.child(phoneNumbController.text.toString()).child("profile").child("email").get();

                      if(snapshot.exists){

                        if(snapshot.value.toString() == passwordController.text.toString()){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MainScreen(
                              phoneNumber: phoneNumbController.text.toString(),
                              fullName: snapshotfnm.value.toString(),
                              email: snapshotEmail.value.toString(),
                              gender: snapshotgnm.value.toString(),
                              dateOfBirth: snapshotdnm.value.toString(),
                              pin: snapshot.value.toString(),)

                            ),
                          );

                        }
                        else{
                          Fluttertoast.showToast(
                              msg: "wrong password",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0
                          );
                        }

                      }
                      else{

                        Fluttertoast.showToast(
                            msg: "No Account found",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.TOP,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0
                        );
                      }




                    },
                    child: Text('LOGIN',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),



            Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 16,right: 16),
                child: Container(
                  height: 45,
                  width: 350,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.0),
                      color: Colors.red,
                  ),
                  child: TextButton(
                    onPressed: (){

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  SignUpPage(phoneNumber: phoneNumbController.text,
                         // phoneNumber: phoneNumbController.text,
                        )),
                      );

                    },
                    child: Text('SIGN UP',
                      style: TextStyle(
                          fontSize: 17,
                          color: Colors.white
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: RichText(text: TextSpan(
                text: "By tapping continue, you agree to Terms and Conditions and Privacy Policy of MyRoad.",
                style: TextStyle(color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 16
                ),

              ),
                textAlign: TextAlign.center,
              ),
            )

          ],
        ),
      ),
    );
  }
}
