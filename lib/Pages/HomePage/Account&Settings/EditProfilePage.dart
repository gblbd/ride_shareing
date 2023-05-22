import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class EditProfilePage extends StatefulWidget {
  final String phoneNumber;

  const EditProfilePage({Key? key, required this.phoneNumber}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {

  FirebaseDatabase database = FirebaseDatabase.instance;
  DatabaseReference ref = FirebaseDatabase.instance.ref("User_profile");

  TextEditingController fullnameContrillerUp=TextEditingController();
  TextEditingController emailAddressControllerUp=TextEditingController();
  TextEditingController phoneNumbUP=TextEditingController();
  // TextEditingController PIN=TextEditingController();

  bool _isObscure=true;


  DateTime selectedDate = DateTime.now();

  String GenderTypeUp='Male';
  TextEditingController _dobUp=TextEditingController();
  @override
  void initState(){
    _dobUp.text="";
    super.initState();
    // DatabaseReference ref = FirebaseDatabase.instance.ref("User_profile").child("profile");
    ProfileData();

  }
  void ProfileData() async{
    DataSnapshot snapshot=await ref.child(widget.phoneNumber).child("profile").get();
    Map profile=snapshot.value as Map;
    setState(() {

      fullnameContrillerUp.text=profile['full_name'];
      emailAddressControllerUp.text=profile['email'];
      _dobUp.text=profile['Date_of_Birth'];


    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Edit profile',
          style: TextStyle(
              color: Colors.black
          ),
        ),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
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
                  controller: fullnameContrillerUp,
                  decoration: InputDecoration(
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
                  controller: emailAddressControllerUp,
                  decoration: InputDecoration(
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
                  controller: _dobUp,
                  decoration: InputDecoration(
                      border: InputBorder.none
                  ),
                  cursorColor: Colors.red.shade700,

                ),
              ),
            ),
          ),



        ],
      ),
      bottomNavigationBar: TextButton(
        onPressed: ()async{
          await ref.child(widget.phoneNumber).child("profile").update({
            "full_name":fullnameContrillerUp.text,
            "email":emailAddressControllerUp.text,
            "Date_of_Birth":_dobUp.text
          }).then((value) {
            Navigator.pop(context);
            Navigator.pop(context);
          });




        },
        child: Text('Update Profile',
          style: TextStyle(fontSize: 18,color: Colors.black),

        ),
      ),

    );

  }
}
