import 'dart:async';
import 'dart:math';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geocoder2/geocoder2.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
//import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ride_sharing/Pages/HomePage/Bike/pickup_confirm_code.dart';
import 'package:sizer/sizer.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:timelines/timelines.dart';

import '../Car/pickup_confirm_code2.dart';
import '../Courier/SaveAddressPage.dart';

class SetOnMap extends StatefulWidget {
  final String name;
  final String phoneNum;
  final String SearchDestinations;
  final double destinationLat;
  final double destinationlong;
  final double sourceLat;
  final double sourceLong;
  final String SearchPickup;
  const SetOnMap({Key? key, required this.SearchDestinations, required this.destinationLat, required this.destinationlong, required this.sourceLat, required this.sourceLong, required this.SearchPickup, required this.name, required this.phoneNum}) : super(key: key);

  @override
  State<SetOnMap> createState() => _SetOnMapState();
}

class _SetOnMapState extends State<SetOnMap> {



  int randNumb(){

    int i=Random().nextInt(999999);
    if(i<100000){
      i=i+100000;
    }

    return i;
  }


  String RequestID="";


  DatabaseReference rf = FirebaseDatabase.instance.ref("Bike_Request");




  void UploadRequest(String destination,String name, String phoneNumber,
      String PickUp,String destinationLat, String destinationLong,String sourceLat,String sourceLong){


    DatabaseReference senderPostRef = rf.child("ride_request").push();
    senderPostRef.set({
      "Destination":"${destination}",
      "Name":"${name}",
      "Phone_number": "0${phoneNumber}",
      "PickUp": "${PickUp}",
      "destinationLat": "${destinationLat}",
      "destinationLong": "${destinationLong}",
      "sourceLat": "${sourceLat}",
      "sourceLong": "${sourceLong}",
      "Distance":"${dist/1000}",
      "Fare":"${(dist/1000)*30}",
      "pickUpStat":false,
      "picupBy":"",
      "DriverName":"",
      "Driving_licese":"",
      "vehicle_reg":"",
      "pickupCode":"${randNumb()}",
      "droppingCode":"${randNumb()}"
    }).then((value) {
      RequestID=senderPostRef.key.toString();
      setState(() {

      });
    });

  }




  Completer<GoogleMapController> _controller = Completer();
  static final CameraPosition _kGoogle = const CameraPosition(
    target: LatLng(23.8103, 90.4125),
    zoom: 10,
  );

  final List<Marker> _markers = <Marker>[
    Marker(
        markerId: MarkerId('1'),
        position: LatLng(23.8103, 90.4125),
        infoWindow: InfoWindow(
          title: 'My Position',
        )
    ),
  ];



  static final _pickup =TextEditingController();
  static final _offer =TextEditingController();
  static final _message =TextEditingController();


   final double _initFabHeight = 120.0;
   double _fabHeight = 0;
   double _panelHeightOpen = 0;
   double _panelHeightClosed = 140;


   PanelController panelController = PanelController();




List<LatLng> pLineCoordinates=[];
Set<Polyline> PolylineSet={};
PolylinePoints polylinePoints=PolylinePoints();


  triggerNotification()
  {
    AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: 10,
          channelKey: 'basic_channel',
          title: 'Rider on Search',
          body: 'When the nearby rider will accept your ride request, they will contact with you via SMS or direct call. Thank You!',

        )
    );
  }
  // @override
  // void initState() {
  //
  //
  //   AwesomeNotifications().isNotificationAllowed().then((isAllowed){
  //
  //     if(!isAllowed)
  //     {
  //       AwesomeNotifications().requestPermissionToSendNotifications();
  //     }
  //
  //   });
  //   super.initState();
  //
  //   //
  //   // rf.child("notification").onChildAdded.listen((event) {
  //   //   showNotification(event.snapshot.value);
  //   // });
  // }

  Future<void>onSelectNotification(String payload)async{

  }

  Future<void>showNotification(String data)async{

  }
  @override
  void initState() {
    AwesomeNotifications().isNotificationAllowed().then((isAllowed){

      if(!isAllowed)
      {
        AwesomeNotifications().requestPermissionToSendNotifications();
      }

    });
    // TODO: implement initState
    super.initState();

    _getPolyline();

    priceBike();
  }









  _getPolyline() async {
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      'AIzaSyBsPxSFf2or6oZnbq7urgrxlakTiVqTmjQ',
      PointLatLng(widget.sourceLat, widget.sourceLong),
      PointLatLng(widget.destinationLat, widget.destinationlong),
      //travelMode: TravelMode.driving,
    );
    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        pLineCoordinates.add(LatLng(point.latitude, point.longitude));
        print("Points :::::${pLineCoordinates}");
        print("SourcePoints :::::${widget.sourceLat} ${widget.sourceLong}");
        print("DestinationPoints :::::${widget.destinationLat} ${widget.destinationlong}");
      });
    }

    PolylineSet.clear();

    setState(() {
      Polyline polyline=Polyline(
          polylineId: PolylineId("PolylineID"),
          color: Colors.purple,
          jointType: JointType.round,
          points: pLineCoordinates,
          width: 5,
          startCap: Cap.roundCap,
          endCap: Cap.roundCap,
          geodesic: true
      );
      PolylineSet.add(polyline);
      print("Polyline:::::::::::::::::::::::::::::::::::::::: $polyline");
    });

  }


  double dist=0.00;

  Future<double> getDistance() async {


    double distanceInMetre=await Geolocator.distanceBetween(widget.sourceLat, widget.sourceLong, widget.destinationLat, widget.destinationlong);


    dist=distanceInMetre;
    double fare=(dist/1000)*20;

    return distanceInMetre;

  }



  FirebaseDatabase database = FirebaseDatabase.instance;
  DatabaseReference ref = FirebaseDatabase.instance.ref("Bike_Request");

  final List<String>cancellationReasons=[
    'Rider refused to pick me up from my pickup location',
    'My pickup/destination location was incorrect',
    'Rider refused to go to my destination',
    'I waited too long',
    'Rider is far away from me',
    'Rider refused to take digital payment',
    "I don't need a ride right now",
    'Rider was rude',
    'Vehicle/person was not the same',
    'Rider unreasonable',
    'Other'
  ];


  Future<void> priceBike() async {



     //price = (await ) as double;

     setState(() {

     });



  }

   @override
  Widget build(BuildContext context) {

     _panelHeightOpen = MediaQuery.of(context).size.height * .99;






     LatLng SourceLocation=LatLng(widget.sourceLat, widget.sourceLong);
     LatLng DestinationLocation=LatLng(widget.destinationLat, widget.destinationlong);

     getDistance();


     ///////////////////////////////////////////////////////////\\\\

     rf.child("ride_request").child(RequestID).onValue.listen((event) {



       String pickupStat= event.snapshot.child("pickUpStat").value.toString();
       String pickUpCode= event.snapshot.child("pickupCode").value.toString();
       String dropdownCode= event.snapshot.child("droppingCode").value.toString();
       String PickupBy= event.snapshot.child("picupBy").value.toString();
       String DriversName=event.snapshot.child("DriverName").value.toString();
       String DrivingLicence=event.snapshot.child("Driving_licese").value.toString();
       String VehicleReg=event.snapshot.child("vehicle_reg").value.toString();


       if(pickupStat=="true"){

         Navigator.pop(context);

         Navigator.push(
             context,
             MaterialPageRoute(builder: (context) {
               return PickupConfirmPage2(
                 PickUpCode: pickUpCode,
                 DroppingCode: dropdownCode,
                 PickedBy: PickupBy,
                 RequestID: RequestID,
                 Drivername: '${DriversName}',
                 DrivingLicenseNumb: '${DrivingLicence}',
                 VehicleReg: '${VehicleReg}',




               );
             })
         );



       }



     });



     ////////////////////////////////////////////////////////







     return Scaffold(
       extendBody: true,
       backgroundColor: Colors.white,
       body: Stack(
         children: [
           Container  (
             child: SafeArea(
               child: Stack(
                 children: [

                   GoogleMap(
                     polylines: PolylineSet,
                     myLocationEnabled: true,
                     zoomGesturesEnabled: true,
                     zoomControlsEnabled: true,
                     myLocationButtonEnabled: true,
                     initialCameraPosition: CameraPosition(
                         target: SourceLocation,//LatLng(currentLocation.latitude!,currentLocation.longitude!),
                         zoom: 14.5),
                     markers: {
                       Marker(
                           markerId: MarkerId("Source"),
                           position: SourceLocation//LatLng(currentLocation!.latitude!,currentLocation!.longitude!)
                       ),
                       Marker(
                           markerId: MarkerId("Destination"),
                           position: DestinationLocation
                       )
                     },


                   ),

                   Positioned(
                       left: 10.0,
                       child: CircleAvatar(
                         backgroundColor: Colors.white,
                         child: TextButton(
                           onPressed: (){
                             Navigator.pop(context);
                           },
                           child: Icon(Icons.arrow_back_sharp,color: Colors.black54,),
                         ),
                       )
                   ),

                 ],
               ),
             ),
           ),
           SlidingUpPanel(

             controller: panelController,
             maxHeight: _panelHeightOpen,
             minHeight: _panelHeightClosed,
             parallaxEnabled: true,
             parallaxOffset: .5,
             panelBuilder: (sc) => _panel(sc),
             borderRadius: BorderRadius.only(
                 topLeft: Radius.circular(10.0),
                 topRight: Radius.circular(10.0)),
             onPanelSlide: (double pos) =>
                 setState(() {
                   _fabHeight = pos * (_panelHeightOpen - _panelHeightClosed) +
                       _initFabHeight;
                 }),
             isDraggable: false,
           ),

         ],
       ),
    );
  }
   Widget _panel(ScrollController sc) {
     return MediaQuery.removePadding(
         context: context,
         removeTop: true,
         child: ListView(
           shrinkWrap: true,
           controller: sc,
           children: [
             Padding(
               padding: const EdgeInsets.only(top: 16,left: 16,right: 16),
               child: Container(
                 height: 8.h,width: 60.w,
                 decoration: BoxDecoration(
                   border: Border.all(color: Colors.grey.shade900,width: 0.1),
                   borderRadius: BorderRadius.circular(6.0),
                   color: Colors.white,
                 ),
                 child: Row(
                   children: [
                     Icon(Icons.location_on,size: 24,color: Colors.red,),
                     SizedBox(width: 10,),
                     Container(
                       width: 80.w,
                       child: SingleChildScrollView(
                         scrollDirection: Axis.horizontal,
                         child: Text(widget.SearchDestinations.isEmpty ?'Enter Destination':widget.SearchDestinations.toString(),
                             style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w400),
                           maxLines: 10,

                         ),
                       ),
                     ),
                   ],
                 ),

               ),
             ),
             Padding(
               padding: const EdgeInsets.all(16),
               child: Row(
                 children: [
                   Container(
                     height: 45,width: 260,
                     color: Colors.white,
                     child: ElevatedButton(
                       style: ElevatedButton.styleFrom(
                         primary: Colors.red.shade600,
                       ),
                       onPressed: () async{
                         /////////////////////////////////////////////
                         DatabaseReference ref=FirebaseDatabase.instance.ref('price');
                         final DataSnapshot snapshot=await ref.child('bike').get();
                        final double price = snapshot.value !=null ? double.parse(snapshot.value.toString()):0.0;
//////////////////////////////////////////////////
                         UploadRequest(
                             widget.SearchDestinations,widget.name,widget.phoneNum,
                             widget.SearchPickup,widget.destinationLat.toString(),widget.destinationlong.toString(),
                             widget.sourceLat.toString(),widget.sourceLong.toString()
                         );
                         triggerNotification();
                             //.then((value) =>
                         showModalBottomSheet(
                             isScrollControlled: false,
                             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
                             isDismissible: false,
                             enableDrag: false,
                             context: context,
                             builder: (BuildContext context){
                               return Padding(
                                 padding: EdgeInsets.only(
                                   left: 8,
                                   right: 8,
                                   top: 10,
                                   bottom: MediaQuery.of(context).viewInsets.bottom + 0.5,
                                 ),
                                 child: SingleChildScrollView(
                                   child: Container(
                                     height: 460,
                                     child: Padding(
                                       padding: const EdgeInsets.all(8.0),
                                       child: Column(
                                         crossAxisAlignment: CrossAxisAlignment.start,
                                         children: [
                                           SizedBox(height: 20,),

                                           Text('Finding nearby rides..',
                                               style: TextStyle(
                                                 color: Colors.black,fontSize: 18,
                                               )
                                           ),
                                           SizedBox(height: 10,),

                                           RichText(text: TextSpan(text: 'We have sent your ride request to the nearby riders',
                                               style: TextStyle(
                                                 color: Colors.grey,fontSize: 12,
                                               )),

                                           ),
                                           SizedBox(height: 20,),
                                           LinearProgressIndicator(color: Colors.red,
                                             backgroundColor: Colors.red.shade50,
                                           ),



                                           // ListTile(
                                           //   leading: Icon(Icons.account_circle,size: 50,color: Colors.grey,),
                                           //   title: Text("Osman Goni"),
                                           //   subtitle: Text("⭐ 4.73 | 224 Trips"),
                                           //
                                           //   onTap: (){
                                           //     // Navigator.push(
                                           //     //     context,
                                           //     //     MaterialPageRoute(builder: (context) {
                                           //     //       return PickupConfirmPage();
                                           //     //     })
                                           //     // );
                                           //   },
                                           //
                                           // ),





                                           Text("Your Trip"),
                                           SizedBox(height: 20,),

                                           SingleChildScrollView(
                                             scrollDirection: Axis.horizontal,
                                             child: Column(
                                               crossAxisAlignment: CrossAxisAlignment.start,
                                               children: [
                                                 Row(
                                                   children: [
                                                     Icon(Icons.man,size: 30,color: Colors.grey.shade600,),
                                                     Text(widget.SearchPickup),
                                                   ],
                                                 ),
                                                 SizedBox(
                                                   height: 20.0,width: 30,
                                                   child: TimelineNode(
                                                     startConnector: SolidLineConnector(color: Colors.grey.shade300,thickness: 1,),
                                                     endConnector: SolidLineConnector(color: Colors.grey.shade300,thickness: 1,),
                                                   ),
                                                 ),
                                                 Row(
                                                   children: [
                                                     Icon(Icons.location_on,size: 28,color: Colors.red.shade600,),
                                                     SizedBox(width: 5,),
                                                     Text(widget.SearchDestinations ),
                                                   ],
                                                 ),


                                                 // Text("Total distance :${dist/1000}"),

                                                 // Text("Estimated Fare : ${(dist/1000)*20} BDT")



                                               ],
                                             ),
                                           ),

                                           Divider(),
                                           SizedBox(height: 10,),

                                           Row(
                                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                             children: [
                                               Text("Total Distance",
                                                   style: TextStyle(
                                                       color: Colors.black,fontSize: 14,
                                                       fontWeight: FontWeight.w500

                                                   )
                                               ),
                                               Text("${(dist/1000).toStringAsFixed(3)} Km",
                                                   style: TextStyle(
                                                       color: Colors.black,fontSize: 14,
                                                       fontWeight: FontWeight.w500

                                                   )
                                               ),
                                             ],
                                           ),
                                           SizedBox(height: 10,),

                                           
                                           Row(
                                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                             children: [
                                               Text('Pay via Cash',
                                                   style: TextStyle(
                                                       color: Colors.black,fontSize: 16,
                                                       fontWeight: FontWeight.w600

                                                   )
                                               ),
                                               //Text('${((dist/1000)*30).toStringAsFixed(2)} BDT',
                                               Text('${((dist/1000)*price).toStringAsFixed(2)} BDT',
                                                   style: TextStyle(
                                                       color: Colors.black,fontSize: 18,
                                                       fontWeight: FontWeight.w600
                                                   )
                                               ),
                                             ],
                                           ),
                                           SizedBox(height: 10,),

                                           RichText(text: TextSpan(text: 'This is the estimated fare. This may vary.',
                                               style: TextStyle(
                                                 color: Colors.grey.shade400,fontSize: 14,
                                               )),

                                           ),
                                           Divider(),
                                           TextButton(onPressed: (){

                                             showModalBottomSheet(
                                                 isScrollControlled: false,
                                                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
                                                 isDismissible: false,
                                                 enableDrag: false,
                                                 context: context,
                                                 builder: (BuildContext context){
                                                   return Padding(
                                                     padding: EdgeInsets.only(
                                                       left: 8,
                                                       right: 8,
                                                       top: 10,
                                                       bottom: MediaQuery.of(context).viewInsets.bottom + 0.5,),
                                                     child: Container(
                                                       height: 30.h,
                                                       child: Padding(
                                                         padding: EdgeInsets.all(8.0),
                                                         child: Column(
                                                           children: [
                                                             RichText(text: TextSpan(text: 'Are you sure you want to cancel this ride?',
                                                                 style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w600))),
                                                             SizedBox(height: 10,),
                                                             RichText(text: TextSpan(text: 'Riders are waiting near you to take you to your destination.',
                                                                 style: TextStyle(color: Colors.black,fontSize: 16))),
                                                             SizedBox(height: 10,),
                                                             Divider(thickness: 2,),
                                                             Row(
                                                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                               children: [
                                                                 Container(
                                                                   child: TextButton(
                                                                       onPressed: () async{
                                                                         await showModalBottomSheet(
                                                                           isScrollControlled: false,
                                                                           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
                                                                           isDismissible: false,
                                                                           enableDrag: false,
                                                                           context: context,
                                                                           builder: (BuildContext context) {
                                                                             return Padding(
                                                                               padding: EdgeInsets.only(
                                                                                 left: 8,
                                                                                 right: 8,
                                                                                 top: 10,
                                                                                 bottom: MediaQuery.of(context).viewInsets.bottom + 0.5,
                                                                               ),
                                                                               child: Container(
                                                                                 height: 60.h,
                                                                                 child: Padding(
                                                                                   padding: const EdgeInsets.all(8.0),
                                                                                   child: Column(
                                                                                     crossAxisAlignment: CrossAxisAlignment.start,
                                                                                     children: [
                                                                                       Text("Cancellation reason",
                                                                                         style: TextStyle(
                                                                                             color: Colors.black87,fontSize: 18,fontWeight: FontWeight.w600
                                                                                         ),
                                                                                       ),
                                                                                       Divider(),
                                                                                       Container(
                                                                                         height: 47.h,
                                                                                         child: ListView.builder(
                                                                                             itemExtent: 40,
                                                                                             itemCount: cancellationReasons.length,
                                                                                             itemBuilder: (BuildContext context, int index){
                                                                                               return ListTile(
                                                                                                 title: Text(cancellationReasons[index].toString()),
                                                                                                   onTap: (){
                                                                                                     print('reason:::::${cancellationReasons[index]}');
                                                                                                     String selectedReason=cancellationReasons[index];
                                                                                                   Navigator.pop(context);Navigator.pop(context);



                                                                                                   // setState(() {
                                                                                                   //
                                                                                                   // });
                                                                                                 },
                                                                                               );
                                                                                             }
                                                                                         ),

                                                                                       ),

                                                                                     ],
                                                                                   ),
                                                                                 ),
                                                                               ),
                                                                             );
                                                                           },
                                                                         ).then((value) =>  Navigator.pop(context));



                                                                       },
                                                                       child: Text('Yes',style: TextStyle(
                                                                           color: Colors.white,fontSize: 16
                                                                       ),)),
                                                                   height: 60,width: 150,
                                                                   decoration: BoxDecoration(
                                                                       borderRadius: BorderRadius.circular(6),
                                                                       color: Colors.red.shade500
                                                                   ),
                                                                 ),
                                                                 Container(
                                                                   child: TextButton(
                                                                       onPressed: (){
                                                                         Navigator.pop(context);

                                                                         //Navigator.pop(context);
                                                                       },
                                                                       child: Text('No',style: TextStyle(
                                                                           color: Colors.black87,fontSize: 16
                                                                       ),)),
                                                                   height: 60,width: 150,
                                                                   decoration: BoxDecoration(
                                                                       borderRadius: BorderRadius.circular(6),
                                                                       color: Colors.grey.shade300
                                                                   ),

                                                                 ),
                                                               ],
                                                             )
                                                           ],
                                                         ),
                                                       ),

                                                     ),
                                                   );
                                                 }
                                             );

                                           },


                                             child: Row(
                                               children: [
                                                 Text('Cancel this Ride?'),
                                                 Spacer(),
                                                 Text('Cancel now ×')
                                               ],
                                             ),
                                           )

                                         ],
                                       ),
                                     ),
                                   ),
                                 ),
                               );
                             }
                             );
                         // await ref.child("ride_request").push().set({
                         //   "Name":"${widget.name.toString()}",
                         //   "Phone_number":"${widget.phoneNum.toString()}",
                         //   "PickUp":"${widget.SearchPickup.toString()}",
                         //   "Destination":"${widget.SearchDestinations.toString()}",
                         //   "sourceLat":"${widget.sourceLat.toString()}",
                         //   "sourceLong":"${widget.sourceLong.toString()}",
                         //   "destinationLat":"${widget.destinationLat.toString()}",
                         //   "destinationLong":"${widget.destinationlong.toString()}",
                         //   "Fare":"${((dist/1000)*20).toStringAsFixed(2).toString()} BDT",
                         //   "Distance":"${(dist/1000).toStringAsFixed(3).toString()} Km "
                         //
                         // }).then((value) =>
                         //     showModalBottomSheet(
                         //     isScrollControlled: false,
                         //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
                         //     isDismissible: false,
                         //     enableDrag: false,
                         //     context: context,
                         //     builder: (BuildContext context){
                         //       return Padding(
                         //         padding: EdgeInsets.only(
                         //           left: 8,
                         //           right: 8,
                         //           top: 10,
                         //           bottom: MediaQuery.of(context).viewInsets.bottom + 0.5,
                         //         ),
                         //         child: SingleChildScrollView(
                         //           child: Container(
                         //             height: 460,
                         //             child: Padding(
                         //               padding: const EdgeInsets.all(8.0),
                         //               child: Column(
                         //                 crossAxisAlignment: CrossAxisAlignment.start,
                         //                 children: [
                         //                   SizedBox(height: 20,),
                         //
                         //                   Text('Finding nearby rides..',
                         //                       style: TextStyle(
                         //                         color: Colors.black,fontSize: 18,
                         //                       )
                         //                   ),
                         //                   SizedBox(height: 10,),
                         //
                         //                   RichText(text: TextSpan(text: 'We have sent your ride request to the nearby riders',
                         //                       style: TextStyle(
                         //                         color: Colors.grey,fontSize: 12,
                         //                       )),
                         //
                         //                   ),
                         //                   SizedBox(height: 20,),
                         //                   LinearProgressIndicator(color: Colors.red,
                         //                     backgroundColor: Colors.red.shade50,
                         //                   ),
                         //
                         //
                         //
                         //                   ListTile(
                         //                     leading: Icon(Icons.account_circle,size: 50,color: Colors.grey,),
                         //                     title: Text("Osman Goni"),
                         //                     subtitle: Text("⭐ 4.73 | 224 Trips"),
                         //
                         //                     onTap: (){
                         //                       Navigator.push(
                         //                           context,
                         //                           MaterialPageRoute(builder: (context) {
                         //                             return PickupConfirmPage();
                         //                           })
                         //                       );
                         //                     },
                         //
                         //                   ),
                         //
                         //
                         //
                         //
                         //
                         //                   Text("Your Trip"),
                         //                   SizedBox(height: 20,),
                         //
                         //                   SingleChildScrollView(
                         //                     scrollDirection: Axis.horizontal,
                         //                     child: Column(
                         //                       crossAxisAlignment: CrossAxisAlignment.start,
                         //                       children: [
                         //                         Row(
                         //                           children: [
                         //                             Icon(Icons.man,size: 30,color: Colors.grey.shade600,),
                         //                             Text(widget.SearchPickup),
                         //                           ],
                         //                         ),
                         //                         SizedBox(
                         //                           height: 20.0,width: 30,
                         //                           child: TimelineNode(
                         //                             startConnector: SolidLineConnector(color: Colors.grey.shade300,thickness: 1,),
                         //                             endConnector: SolidLineConnector(color: Colors.grey.shade300,thickness: 1,),
                         //                           ),
                         //                         ),
                         //                         Row(
                         //                           children: [
                         //                             Icon(Icons.location_on,size: 28,color: Colors.red.shade600,),
                         //                             SizedBox(width: 5,),
                         //                             Text(widget.SearchDestinations ),
                         //                           ],
                         //                         ),
                         //
                         //
                         //                         // Text("Total distance :${dist/1000}"),
                         //
                         //                        // Text("Estimated Fare : ${(dist/1000)*20} BDT")
                         //
                         //
                         //
                         //                       ],
                         //                     ),
                         //                   ),
                         //
                         //                   Divider(),
                         //                   SizedBox(height: 10,),
                         //
                         //                   Row(
                         //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         //                     children: [
                         //                       Text("Total Distance",
                         //                           style: TextStyle(
                         //                               color: Colors.black,fontSize: 14,
                         //                               fontWeight: FontWeight.w500
                         //
                         //                           )
                         //                       ),
                         //                       Text("${(dist/1000).toStringAsFixed(3)} Km",
                         //                           style: TextStyle(
                         //                               color: Colors.black,fontSize: 14,
                         //                               fontWeight: FontWeight.w500
                         //
                         //                           )
                         //                       ),
                         //                     ],
                         //                   ),
                         //                   SizedBox(height: 10,),
                         //
                         //                   Row(
                         //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         //                     children: [
                         //                       Text('Pay via Cash',
                         //                           style: TextStyle(
                         //                             color: Colors.black,fontSize: 16,
                         //                               fontWeight: FontWeight.w600
                         //
                         //                           )
                         //                       ),
                         //                       Text('${((dist/1000)*20).toStringAsFixed(2)} BDT',
                         //                           style: TextStyle(
                         //                             color: Colors.black,fontSize: 18,
                         //                             fontWeight: FontWeight.w600
                         //                           )
                         //                       ),
                         //                     ],
                         //                   ),
                         //                   SizedBox(height: 10,),
                         //
                         //                   RichText(text: TextSpan(text: 'This is the estimated fare. This may vary.',
                         //                       style: TextStyle(
                         //                         color: Colors.grey.shade400,fontSize: 14,
                         //                       )),
                         //
                         //                   ),
                         //                   Divider(),
                         //                   TextButton(onPressed: (){
                         //
                         //                     showModalBottomSheet(
                         //                         isScrollControlled: false,
                         //                         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
                         //                         isDismissible: false,
                         //                         enableDrag: false,
                         //                         context: context,
                         //                         builder: (BuildContext context){
                         //                           return Padding(
                         //                             padding: EdgeInsets.only(
                         //                               left: 8,
                         //                               right: 8,
                         //                               top: 10,
                         //                               bottom: MediaQuery.of(context).viewInsets.bottom + 0.5,),
                         //                             child: Container(
                         //                                height: 20.h,
                         //                               child: Padding(
                         //                                 padding: EdgeInsets.all(8.0),
                         //                                 child: Column(
                         //                                   children: [
                         //                                     RichText(text: TextSpan(text: 'Are you sure you want to cancel this ride?',
                         //                                         style: TextStyle(color: Colors.black,fontSize: 18))),
                         //
                         //                                   ],
                         //                                 ),
                         //                               ),
                         //                             ),
                         //                           );
                         //                         }
                         //                     );
                         //
                         //                   },
                         //
                         //
                         //                     child: Row(
                         //                       children: [
                         //                         Text('Cancel this Ride?'),
                         //                         Spacer(),
                         //                         Text('Cancel now ×')
                         //                       ],
                         //                     ),
                         //                   )
                         //
                         //                 ],
                         //               ),
                         //             ),
                         //           ),
                         //         ),
                         //       );
                         //     }
                         //
                         // )
                         // );






                       },
                       child: Text('Confirm Destination',style: TextStyle(fontWeight: FontWeight.normal,fontSize: 16)),
                     ),
                   ),
                   Spacer(),



                   // Container(
                   //   height: 46,width: 50,
                   //   decoration: BoxDecoration(
                   //       borderRadius: BorderRadius.circular(10.0),
                   //       color: Colors.grey.shade200
                   //   ),
                   //   child: TextButton(
                   //       onPressed: (){
                   //
                   //         Navigator.push(
                   //             context,
                   //             MaterialPageRoute(builder: (context) {
                   //               return SaveAddressPage();
                   //             })
                   //         );
                   //       },
                   //       child: Center(child: Icon(Icons.star_rate_rounded,size: 30,color: Colors.grey.shade700,))
                   //   ),
                   // )





                 ],
               ),
             )

           ],
         )
     );
   }

}


