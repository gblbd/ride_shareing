//import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
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

  ///////////////////////////////////////////////////







  ////////////////////////////////////////


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      showDialog(context: context, builder: (context)=>AlertDialog(
        content: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Location : ",

                  style: GoogleFonts.openSans(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),


                ),
                Text("\nThis app will use your location data for app functionality and for best user experience."
                    " this location data will be collected only when you use the app."
                    " The location data collection doesn't run or work in the background. "
                    "It doesnt collect or share data when the app will remain idle. "
                    "This location data is used for the feature of finding your pickup point. "
                    " location, destinetion and calculating the distance and estimating fare of ride\n"
                    "this loction data is used in : \n # ride sharing with car feature\n # Ride sharing with bike feature"
                    "this app never provide any ads/support or advertising/support ads.",

                  style: GoogleFonts.openSans(
                    fontSize: 16,
                    //fontWeight: FontWeight.bold
                  ),

                ),


                Text("User Data Safty :",

                  style: GoogleFonts.openSans(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),

                ),

                Text("\nMy road never use, analyze or share user data. "
                    "The data transfered through a encrypted channel with firebase security \n\n\n\n If you are agree with us please press the agree button and enjoy the best experience",

                  style: GoogleFonts.openSans(
                    fontSize: 16,
                    //fontWeight: FontWeight.bold
                  ),

                ),

                SizedBox(height: 25,),





              ],
            ),
          ),
        ),
        actions: [
          TextButton(onPressed: ()=>Navigator.pop(context), child: Text("Agree"))
        ],
      ));
    });


  }




  @override
  Widget build(BuildContext context) {

    // Fluttertoast.showToast(
    //     msg: "This app will collect User name, location data and email for functionality\n if you want to continue please login",
    //     toastLength: Toast.LENGTH_LONG,
    //     gravity: ToastGravity.CENTER,
    //     timeInSecForIosWeb: 1,
    //     backgroundColor: Colors.red,
    //     textColor: Colors.white,
    //     fontSize: 16.0
    // );


    // AwesomeDialog(
    //     context: context,
    //     dialogType: DialogType.info,
    //     animType: AnimType.rightSlide,
    //     title: 'Dialog Title',
    //     desc: 'Dialog description here.............',
    //     btnCancelOnPress: () {},
    // btnOkOnPress: () {},
    // )..show();


    //_showMyDialog();











    return Scaffold(
      // appBar: AppBar(
      //  // title: Image.asset('assets/images/My_Road_Logo.png',height: 50,width: 100,),
      //   backgroundColor: Colors.white,
      //   iconTheme: IconThemeData(color: Colors.black),
      //   elevation: 0.0,
      // ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/images/My_Road_Logo.png',height: 140,width: 360,),
            //SizedBox(height: 80,),
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
