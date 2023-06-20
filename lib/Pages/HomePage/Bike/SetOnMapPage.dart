import 'dart:async';

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

  // Future<Position> getUserCurrentLocation() async {
  //   await Geolocator.requestPermission().then((value){
  //   }).onError((error, stackTrace) async {
  //     await Geolocator.requestPermission();
  //     print("ERROR"+error.toString());
  //   });
  //   return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high,
  //   forceAndroidLocationManager: true);
  // }
  //

  // LatLng? pickLocation;
  // String? _address;
  // //LocationPermission? _locationPermission;
  //
  // getAddressFromLatLng()async{
  //   try{
  //     GeoData data =await Geocoder2.getDataFromCoordinates(
  //       latitude: pickLocation!.latitude,
  //       longitude: pickLocation!.longitude,
  //       googleMapApiKey: mapKey
  //     );
  //     setState(() {
  //       _address=data.address;
  //     });
  //   }catch(e){
  //     print(e);
  //   }
  // }

  // checkIfLocationPermissionAllowed()async{
  //   _locationPermission=await Geolocator.requestPermission();
  //
  //   if(_locationPermission==LocationPermission.denied){
  //     _locationPermission=await Geolocator.requestPermission();
  //   }
  // }


  // @override
  // void initState(){
  //   super.initState();
  //   //checkIfLocationPermissionAllowed();
  // }

  // late LatLng _center;
  // late String _currentAddress;

  // @override
  // void initState() {
  //   super.initState();
  //   _getLocation();
  // }
  // void _getLocation() async {
  //   Position position = await Geolocator.getCurrentPosition(
  //       desiredAccuracy: LocationAccuracy.high);
  //   setState(() {
  //     _center = LatLng(position.latitude, position.longitude);
  //     _getAddressFromLatLng();
  //   });
  // }
  //
  // void _getAddressFromLatLng() async {
  //   try {
  //     List<Placemark> placemarks =
  //     await placemarkFromCoordinates(_center.latitude, _center.longitude);
  //
  //     Placemark place = placemarks[0];
  //
  //     setState(() {
  //       _currentAddress =
  //       "${place.name}, ${place.subLocality}, ${place.postalCode}, ${place.country}";
  //     });
  //   } catch (e) {
  //     print(e);
  //   }
  // }


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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getPolyline();
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


   @override
  Widget build(BuildContext context) {

     _panelHeightOpen = MediaQuery.of(context).size.height * .99;



     LatLng SourceLocation=LatLng(widget.sourceLat, widget.sourceLong);
     LatLng DestinationLocation=LatLng(widget.destinationLat, widget.destinationlong);

     getDistance();



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
                         await ref.child("ride_request").push().set({
                           "Name":"${widget.name.toString()}",
                           "Phone_number":"${widget.phoneNum.toString()}",
                           "PickUp":"${widget.SearchPickup.toString()}",
                           "Destination":"${widget.SearchDestinations.toString()}",
                           "sourceLat":"${widget.sourceLat.toString()}",
                           "sourceLong":"${widget.sourceLong.toString()}",
                           "destinationLat":"${widget.destinationLat.toString()}",
                           "destinationLong":"${widget.destinationlong.toString()}",
                           "Fare":"${((dist/1000)*20).toStringAsFixed(2).toString()} BDT",
                           "Distance":"${(dist/1000).toStringAsFixed(3).toString()} Km "

                         }).then((value) => showModalBottomSheet(
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



                                           ListTile(
                                             leading: Icon(Icons.account_circle,size: 50,color: Colors.grey,),
                                             title: Text("Osman Goni"),
                                             subtitle: Text("⭐ 4.73 | 224 Trips"),

                                             onTap: (){
                                               Navigator.push(
                                                   context,
                                                   MaterialPageRoute(builder: (context) {
                                                     return PickupConfirmPage();
                                                   })
                                               );
                                             },

                                           ),





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
                                               Text('${((dist/1000)*20).toStringAsFixed(2)} BDT',
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
                                                        height: 20.h,
                                                       child: Padding(
                                                         padding: EdgeInsets.all(8.0),
                                                         child: Column(
                                                           children: [
                                                             RichText(text: TextSpan(text: 'Are you sure you want to cancel this ride?'))
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

                         )
                         );






                       },
                       child: Text('Confirm Destination',style: TextStyle(fontWeight: FontWeight.normal,fontSize: 16)),
                     ),
                   ),
                   Spacer(),
                   Container(
                     height: 46,width: 50,
                     decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(10.0),
                         color: Colors.grey.shade200
                     ),
                     child: TextButton(
                         onPressed: (){

                           Navigator.push(
                               context,
                               MaterialPageRoute(builder: (context) {
                                 return SaveAddressPage();
                               })
                           );
                         },
                         child: Center(child: Icon(Icons.star_rate_rounded,size: 30,color: Colors.grey.shade700,))
                     ),
                   )
                 ],
               ),
             )

           ],
         )
     );
   }



}


