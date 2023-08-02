


import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
//import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:ride_sharing/Pages/HomePage/Haritage/Confirm_estimation.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;




class EstimationPage extends StatefulWidget{

  @override
  State<EstimationPage> createState() => _EstimationPageState();
}




class _EstimationPageState extends State<EstimationPage> with TickerProviderStateMixin {

  late TabController _promoController;
  late AnimationController _animationController;
  late Animation<Offset> _animation;
  TextEditingController Search_controller=TextEditingController();

  double lat=0;
  double long=0;



  List<dynamic> _placelist=[];

  String _sessionToken="122344";
  var uuid=Uuid();






  @override
  Widget build(BuildContext context) {

    Query dbref=FirebaseDatabase.instance.ref("Heritage_Driver").child("Driver");

    // TODO: implement build
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [


            /////////////////////////////////////////////////




            Padding(
              padding: const EdgeInsets.only(left: 8,right: 8,top: 8),
              child: Row(
                children: [
                  Container(
                    height: 50,width: 320,
                    margin: const EdgeInsets.all(10),
                    decoration:  BoxDecoration(
                        border: Border.all(color: Colors.grey.shade700,width: 1),
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white
                    ),
                    child: TextField(
                      controller: Search_controller,
                      cursorColor: Colors.red.shade900,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Search destination',
                        hintStyle: TextStyle(fontSize: 17,color: Colors.black87),
                        prefixIcon: InkWell(
                          child: Icon(Icons.location_on,color: Colors.red,),
                          onTap: (){

                          },
                        ),
                        // suffixIcon: InkWell(
                        //     child: Icon(Icons.arrow_forward_ios),
                        //   onTap: (){
                        //
                        //     // Navigator.push(
                        //     //     context,
                        //     //     MaterialPageRoute(builder: (context) {
                        //     //       return SearchPage();//SetOnMap2(SearchDestinations: "SearchDestinations");
                        //     //     })
                        //     // );
                        //
                        //   },
                        //
                        // )
                      ),

                    ),




                  ),









                  // Container(
                  //   height: 50,width: 50,
                  //   margin: const EdgeInsets.all(7),
                  //   decoration: _invisible ? null : BoxDecoration(
                  //       border: Border.all(color: Colors.grey.shade700,width: 1),
                  //       borderRadius: BorderRadius.circular(10.0),
                  //       color: Colors.white
                  //   ),
                  //   child: TextButton(
                  //       style: TextButton.styleFrom(primary: Colors.white,),
                  //       onPressed: (){
                  //         Navigator.push(
                  //             context,
                  //             MaterialPageRoute(builder: (context) {
                  //               return const YourTripPage();
                  //             })
                  //         );
                  //       },
                  //       child: const Icon(Icons.add,color: Colors.red,size: 30,)),
                  // ),

                ],
              ),
            ),


            ListView.builder(
                shrinkWrap: true,
                itemCount: _placelist.length,
                itemBuilder: (context,index){

                  return ListTile(

                    title: Text(_placelist[index]['description']),

                    onTap: ()async{

                      List<Location> locations=await locationFromAddress(_placelist[index]["description"]);
                      print(locations.last.latitude);
                      print(locations.last.longitude);
                      lat=locations.last.latitude;
                      long=locations.last.longitude;

                      setState(() {
                        Search_controller.text=_placelist[index]["description"];
                      });



                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(builder: (context) {
                      //       return SearchPickUpPoint(
                      //         destinationLatitude: locations.last.latitude,
                      //         destinationLongitude: locations.last.longitude,
                      //         destinetionDetail: _placelist[index]['description'],
                      //         name: widget.Name,
                      //         phone: widget.phoneNumber,
                      //       );//SetOnMap2(SearchDestinations: "${locations.last.latitude}/${locations.last.longitude}");
                      //     })
                      // );

                    },



                  );

                }),



            ////////////////////////////////////////////////








            ListTile(
              title: Text("Starting Date : "),

              onTap: (){
                CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.date,
                  initialDateTime: DateTime(1969, 1, 1),
                  onDateTimeChanged: (DateTime newDateTime) {
                    // Do something
                  },
                );
              },
            ),

            SizedBox(
              height: 200,
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.date,
                initialDateTime: DateTime.now(),
                onDateTimeChanged: (DateTime newDateTime) {
                  // Do something
                },
              ),
            ),



            Text("Returning date"),


            SizedBox(
              height: 200,
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.date,
                initialDateTime: DateTime.now(),
                onDateTimeChanged: (DateTime newDateTime) {
                  // Do something
                },
              ),
            ),

            ListTile(
              title: Text("Total Cost : "),

            ),



            Text("Available Driver :"),



            FirebaseAnimatedList(
              physics: ScrollPhysics(),
              shrinkWrap: true,
              query: dbref,
              reverse: false,
              itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double> animation, int index) {

                return Container(
                  margin: EdgeInsets.all(8),
                  child: ListTile(

                    onTap: (){
                      Get.to(ConformEstimation(),
                          duration: Duration(milliseconds: 500), //duration of transitions, default 1 sec
                          transition: Transition.rightToLeft );

                    },

                      title: Text("Driver's Name : ${snapshot.child("Driver_Name").value.toString()}"),
                    subtitle: Column(
                      children: [
                        Text("Car Model : ${snapshot.child("carModel").value.toString()} ${snapshot.child("Car_Seat").value.toString()} Seater"),
                        Text("Phone : ${snapshot.child("phone").value.toString()}")
                      ],
                    ),
                  ),

                );
              },
            )









          ],
        ),
      ),
    );
  }



  Future<void>requestPermission()async{
    await Permission.location.request();
    // await Permission.storage.request();
    // await Permission.accessMediaLocation.request();
  }




  @override
  void initState(){
    requestPermission();
    _promoController=TabController(length: 2, vsync: this);
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _animation = Tween<Offset>(
      begin: Offset(1.0, 0.0),
      end: Offset(0.0, 1.0),
      // begin: 0.0,
      //end: 1.0
    ).animate(_animationController) ;

    Search_controller.addListener(() {

      Onchange();
    });




  }








  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }




  void Onchange(){

    if(_sessionToken==null){

      setState(() {
        _sessionToken=uuid.v4();
      });

    }

    getSuggestion(Search_controller.text);

  }

  void getSuggestion(String input)async{

    String KPLACE_API_KEY="AIzaSyBsPxSFf2or6oZnbq7urgrxlakTiVqTmjQ";
    String baseUrl="https://maps.googleapis.com/maps/api/place/autocomplete/json";
    String request='https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$input&types=establishment&key=AIzaSyBsPxSFf2or6oZnbq7urgrxlakTiVqTmjQ&sessiontoken=122344&components=country:bd';

    var response=await http.get(Uri.parse(request));

    if(response.statusCode==200){

      setState(() {
        _placelist=jsonDecode(response.body)['predictions'];
      });

    }else{
      throw Exception("Unable to load data");
    }


  }








}