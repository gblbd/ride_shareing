import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
      GenderTypeUp=profile['gender'];


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
        crossAxisAlignment: CrossAxisAlignment.start,
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
                      label: Text('Full Name'),
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
                  controller: emailAddressControllerUp,
                  decoration: InputDecoration(
                      label: Text('Enter Email'),
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
                  controller: _dobUp,
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
                        _dobUp.text = formattedDate;
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
                    groupValue: GenderTypeUp,
                    onChanged: (value){
                      setState(() {
                        GenderTypeUp = value.toString();
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
                    groupValue: GenderTypeUp,
                    onChanged: (value){
                      setState(() {
                        GenderTypeUp = value.toString();
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
                    groupValue: GenderTypeUp,
                    onChanged: (value){
                      setState(() {
                        GenderTypeUp = value.toString();
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


        ],
      ),
      bottomNavigationBar: TextButton(
        onPressed: ()async{
          await ref.child(widget.phoneNumber).child("profile").update({
            "full_name":fullnameContrillerUp.text,
            "email":emailAddressControllerUp.text,
            "Date_of_Birth":_dobUp.text,
            "gender":GenderTypeUp

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
