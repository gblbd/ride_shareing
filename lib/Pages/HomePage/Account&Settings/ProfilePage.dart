import 'package:flutter/material.dart';

import 'EditProfilePage.dart';

class ProfilePage extends StatefulWidget {
  final String fullname;
  final String email;
  final String phoneNumber;
  final String gender;
  final String dateOfBirth;

  const ProfilePage({Key? key, required this.fullname, required this.email, required this.phoneNumber, required this.gender, required this.dateOfBirth}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Profile',

        style: TextStyle(color: Colors.black),
        ),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.account_circle,size: 100,color: Colors.grey.shade300,),

            SizedBox(height: 20,),

            Text('NAME',
              style: TextStyle(color: Colors.blueGrey.shade200,fontSize: 10),

            ),
            SizedBox(height: 5,),
            Text(widget.fullname,
              style: TextStyle(fontSize: 16),

            ),
            Divider(),
            SizedBox(height: 10,),



            Text('EMAIL',
              style: TextStyle(color: Colors.blueGrey.shade200,fontSize: 10),

            ),
            SizedBox(height: 5,),

            Text(widget.email,
              style: TextStyle(fontSize: 16),

            ),
            Divider(),
            SizedBox(height: 10,),



            Text('PHONE NUMBER',
              style: TextStyle(color: Colors.blueGrey.shade200,fontSize: 10),

            ),
            SizedBox(height: 5,),

            Text(
              "+880${widget.phoneNumber}",
              style: TextStyle(fontSize: 16),

            ),
            Divider(),
            SizedBox(height: 10,),



            Row(

              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('GENDER',
                      style: TextStyle(color: Colors.blueGrey.shade200,fontSize: 10),

                    ),
                    SizedBox(height: 5,),

                    Text(widget.gender,
                      style: TextStyle(fontSize: 16),

                    ),
                  ],
                ),
                Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('DATE OF BIRTH',
                      style: TextStyle(color: Colors.blueGrey.shade200,fontSize: 10),

                    ),
                    SizedBox(height: 5,),

                    Text(widget.dateOfBirth,
                      style: TextStyle(fontSize: 16),

                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: TextButton(
        onPressed: (){

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return EditProfilePage(phoneNumber: widget.phoneNumber,);
              },
            ),
          );


        },
        child: Text('EDIT PROFILE',
          style: TextStyle(fontSize: 18,color: Colors.black),

        ),
      ),
    );
  }
}
