import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import 'OTPPage.dart';

class LoginWithPhoneNum extends StatelessWidget {
  const LoginWithPhoneNum({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0.0,
      ),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 80,),
          Padding(
            padding: const EdgeInsets.only(top: 16,left: 16,right: 16),
            child: Text('Enter your mobile number',
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: IntlPhoneField(
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
              onChanged: (phone) {
                print(phone.completeNumber);
              },
              onCountryChanged: (country) {
                print('Country changed to: ' + country.name);
              },
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
                    color: Colors.red.shade300
                ),
                child: TextButton(
                  onPressed: (){

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  OTPsendPage()),
                    );


                  },
                  child: Text('CONTINUE',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white
                    ),
                  ),
                ),
              ),
            ),
          ),
          // Center(
          //   child: Padding(
          //     padding: const EdgeInsets.all(8.0),
          //     child: Center(child: Text("OR")),
          //   ),
          // ),
          // Center(
          //   child: Padding(
          //     padding: const EdgeInsets.only(left: 16,right: 16),
          //     child: Container(
          //       height: 45,
          //       width: 350,
          //       decoration: BoxDecoration(
          //           borderRadius: BorderRadius.circular(6.0),
          //           color: Colors.blue.shade700
          //       ),
          //       child: TextButton(
          //         onPressed: (){},
          //         child: Row(
          //           children: [
          //             Icon(Icons.facebook,size: 30,
          //               color: Colors.white,
          //             ),
          //             SizedBox(width: 40,),
          //             Text('Continue with Facebook',
          //               style: TextStyle(
          //                   fontSize: 17,
          //                   color: Colors.white
          //               ),
          //               textAlign: TextAlign.center,
          //             ),
          //           ],
          //         ),
          //       ),
          //     ),
          //   ),
          // ),

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
    );
  }
}
