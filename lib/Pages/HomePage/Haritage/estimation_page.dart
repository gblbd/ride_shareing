


import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
//import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:ride_sharing/Pages/HomePage/Haritage/Confirm_estimation.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;

import '../Courier/data_list.dart';




class EstimationPage extends StatefulWidget{

  final double rate;


  final List<dynamic>selectedItem;

  const EstimationPage({super.key, required this.selectedItem, required this.rate});

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

  String vehicle = DataList().VehicleList[0];

 // DateTime? Starting_DateTime,Returning_DateandTime;



  List<dynamic> _placelist=[];

  String _sessionToken="122344";
  var uuid=Uuid();




  /////////////////////////////////////////////////////


  String _selectedDate = '';
  String _dateCount = '';
  String _range = '';
  String _rangeCount = '';

  String? Startdate,Enddate;

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    /// The argument value will return the changed date as [DateTime] when the
    /// widget [SfDateRangeSelectionMode] set as single.
    ///
    /// The argument value will return the changed dates as [List<DateTime>]
    /// when the widget [SfDateRangeSelectionMode] set as multiple.
    ///
    /// The argument value will return the changed range as [PickerDateRange]
    /// when the widget [SfDateRangeSelectionMode] set as range.
    ///
    /// The argument value will return the changed ranges as
    /// [List<PickerDateRange] when the widget [SfDateRangeSelectionMode] set as
    /// multi range.
    setState(() {
      if (args.value is PickerDateRange) {
        Startdate= '${DateFormat('dd/MM/yyyy').format(args.value.startDate)}';
        Enddate= ' ${DateFormat('dd/MM/yyyy').format(args.value.endDate ?? args.value.startDate)}';
        _range = '${DateFormat('dd/MM/yyyy').format(args.value.startDate)} -'
        // ignore: lines_longer_than_80_chars
            ' ${DateFormat('dd/MM/yyyy').format(args.value.endDate ?? args.value.startDate)}';
      } else if (args.value is DateTime) {
        _selectedDate = args.value.toString();
      } else if (args.value is List<DateTime>) {
        _dateCount = args.value.length.toString();
      } else {
        _rangeCount = args.value.length.toString();
      }
    });
  }




  ///////////////////////////////////////////////////






  @override
  Widget build(BuildContext context) {

    Query dbref=FirebaseDatabase.instance.ref("Heritage_Driver").child("Driver");

    // TODO: implement build
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [





            /////////////////////////////////////////////////


            ListTile(
              title: Text("Select Pickup Point : ",
                style: GoogleFonts.openSans(
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),


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
                        hintText: 'Search Pickup Point',
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








            // ListTile(
            //   title: Text("Starting Date : ",
            //     style: GoogleFonts.openSans(
            //       fontSize: 18,
            //       fontWeight: FontWeight.bold
            //     ),
            //   ),
            // ),
            //
            // SizedBox(
            //   height: 200,
            //   child: CupertinoDatePicker(
            //     mode: CupertinoDatePickerMode.date,
            //     initialDateTime: DateTime.now(),
            //     onDateTimeChanged: (DateTime StartDateTime) {
            //       // Do something
            //       setState(() {
            //         Starting_DateTime=StartDateTime;
            //       });
            //
            //     },
            //   ),
            // ),


            ListTile(
              title: Text("Travelling date range : ",
                style: GoogleFonts.openSans(
                  fontSize: 18,
                  fontWeight: FontWeight.bold
              ),
              ),
            ),


            Container(

              margin: EdgeInsets.symmetric(horizontal: 20),

              child: SfDateRangePicker(
                onSelectionChanged: _onSelectionChanged,
                selectionMode: DateRangePickerSelectionMode.range,
                initialSelectedRange: PickerDateRange(
                    DateTime.now().subtract(const Duration(days: 4)),
                    DateTime.now().add(const Duration(days: 3))),
              ),
            ),





            // SizedBox(
            //   height: 200,
            //   child: CupertinoDatePicker(
            //     mode: CupertinoDatePickerMode.date,
            //     initialDateTime: DateTime.now(),
            //     onDateTimeChanged: (DateTime ReturnDateTime) {
            //       setState(() {
            //         Returning_DateandTime=Returning_DateandTime;
            //       });
            //
            //     },
            //   ),
            // ),



            Container(
              height: 58,width: 80.w,
              //margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey,width: 1),
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.white
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child:   Container(
                  child: DropdownButtonHideUnderline(
                    child: ButtonTheme(
                      //alignedDropdown: true,
                      child: DropdownButton<String>(
                        value: vehicle,
                        icon: const Icon(Icons.arrow_drop_down,size: 20,),
                        //elevation: 16,
                        style: const TextStyle(color: Colors.black),
                        onChanged: (String? value) {
                          setState(() {
                            vehicle = value!;
                          });
                        },
                         items: DataList().VehicleList.map<DropdownMenuItem<String>>((String value) {
                           return DropdownMenuItem<String>(
                             value: value,
                             child: Text(value),
                           );
                         }).toList(),
                        //DataList().VehicleList()
                        // Thana1[DistrictValue].map<DropdownMenuItem<String>>((String value) {
                        //   return DropdownMenuItem<String>(
                        //     value: value,
                        //     child: Text(value,
                        //       style: TextStyle(
                        //           fontSize: 16,
                        //           fontWeight: FontWeight.w400
                        //       ),
                        //     ),
                        //   );
                        // }).toList(),
                      ),
                    ),
                  ),
                ),
              ),

            ),




            ElevatedButton(
                onPressed: (){

                  if(lat==0||long==0||Startdate==null||Enddate==null){

                  }else{
                    Get.to(
                        ConformEstimation(
                          Starting_Date: "${Startdate}",
                          returningDate: "${Enddate}",
                          Cost: "425", TotalDistance: "789",
                          selectedItem: widget.selectedItem,
                          pickupLat: lat,
                          pickupLong: long,
                          pickupPoint: "${Search_controller.text}",
                          Rate: widget.rate,
                          carModel: vehicle,
                        ),

                        duration: Duration(milliseconds: 100), //duration of transitions, default 1 sec
                        transition: Transition.rightToLeft );
                  }




            },
                child: Text("Proceed"))






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