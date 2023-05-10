import 'package:flutter/material.dart';

import '../MainScreen.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 0.0,
        title: Text("Terms & Conditions",
          style: TextStyle(color: Colors.black),
        ),
        titleSpacing: 85,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                height: 500,
                color: Colors.blueGrey.shade50,
                child: Column(
                  children: [
                    SizedBox(height: 20,),

                    Center(child: Text("We have updated our Terms & Conditions!",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.bold
                      ),
                      textAlign: TextAlign.center,
                    ),),
                    SizedBox(height: 100,),

                    Center(child: Image.asset("assets/images/Terms.png")),

                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: RichText(text: TextSpan(
                text: 'By tapping "AGREE AND CONTINUE" you agree with our Terms and conditions and Privacy Policy',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500
                ),

              ),
                textAlign: TextAlign.center,
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 16,right: 16,top: 16),
                child: Container(
                  height: 50,
                  width: 350,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.0),
                      color: Colors.red
                  ),
                  child: TextButton(
                    onPressed: (){

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  MainScreen()),
                      );


                    },
                    child: Text('AGREE AND CONTINUE',
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


          ],
        ),
      ),
    );
  }
}
