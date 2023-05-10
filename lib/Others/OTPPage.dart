import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

import 'SignUpPage.dart';





class OTPsendPage extends StatefulWidget {

  const OTPsendPage({Key? key}) : super(key: key);

  @override
  State<OTPsendPage> createState() => _OTPsendPageState();
}

class _OTPsendPageState extends State<OTPsendPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: Colors.black
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),

      backgroundColor: Color(0xFFFFF8F8),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            SizedBox(height: 60,),

            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text('Enter the code sent to +8801790151259 ',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 18
                ),
              ),
            ),

            SizedBox(height: 10,),

            Padding(
              padding: const EdgeInsets.all(12.0),
              child: OTPTextField(
                length: 6,
                width: MediaQuery.of(context).size.width,
                fieldWidth: 50,
                style: TextStyle(
                    fontSize: 17
                ),
                textFieldAlignment: MainAxisAlignment.spaceAround,
                fieldStyle: FieldStyle.box,
                onCompleted: (pin) {
                  print("Completed: " + pin);
                },
              ),
            ),




            SizedBox(height: 40,),

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
                        MaterialPageRoute(builder: (context) =>  SignUpPage()),
                      );


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

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(child: Text('Code sent. Resend code in 00:57')),
            ),

          ],
        ),
      ),
    );
  }
}