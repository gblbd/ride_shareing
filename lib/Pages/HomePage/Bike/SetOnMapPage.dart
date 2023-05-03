import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../Courier/SaveAddressPage.dart';

class SetOnMap extends StatefulWidget {
  const SetOnMap({Key? key}) : super(key: key);

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

  Future<Position> getUserCurrentLocation() async {
    await Geolocator.requestPermission().then((value){
    }).onError((error, stackTrace) async {
      await Geolocator.requestPermission();
      print("ERROR"+error.toString());
    });
    return await Geolocator.getCurrentPosition();
  }

  static final _pickup =TextEditingController();
  static final _offer =TextEditingController();
  static final _message =TextEditingController();


   final double _initFabHeight = 120.0;
   double _fabHeight = 0;
   double _panelHeightOpen = 0;
   double _panelHeightClosed = 140;


   PanelController panelController = PanelController();

  bool _showBox = false;

   @override
  Widget build(BuildContext context) {

     _panelHeightOpen = MediaQuery.of(context).size.height * .99;

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
                     initialCameraPosition: _kGoogle,
                     markers: Set<Marker>.of(_markers),
                     mapType: MapType.hybrid,
                     myLocationEnabled: true,
                     compassEnabled: true,
                     onMapCreated: (GoogleMapController controller){
                       _controller.complete(controller);
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
                   Positioned(
                     right: 8,
                     top: 400,
                     child: FloatingActionButton(
                       mini: true,
                       backgroundColor: Colors.white,

                       onPressed: () async{
                         getUserCurrentLocation().then((value) async {
                           print(value.latitude.toString() +" "+value.longitude.toString());

                           _markers.add(
                               Marker(
                                 markerId: MarkerId("1"),
                                 position: LatLng(value.latitude, value.longitude),
                                 infoWindow: InfoWindow(
                                   title: 'My Current Location',
                                 ),
                               )
                           );

                           CameraPosition cameraPosition = new CameraPosition(
                             target: LatLng(value.latitude, value.longitude),
                             zoom: 10,
                           );

                           final GoogleMapController controller = await _controller.future;
                           controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
                           // setState(() {
                           // });
                         });
                       },
                       child: Icon(Icons.local_activity,size: 16,color: Colors.green,),
                     ),

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
           controller: sc,
           children: [
             Padding(
               padding: const EdgeInsets.only(top: 16,left: 16,right: 16),
               child: Container(
                 height: 50,width: 330,
                 decoration: BoxDecoration(
                   border: Border.all(color: Colors.grey.shade900,width: 0.1),
                   borderRadius: BorderRadius.circular(6.0),
                   color: Colors.white,
                 ),
                 child: TextField(
                   controller: _pickup,
                   cursorColor: Colors.red.shade900,
                   decoration: InputDecoration(
                     border: InputBorder.none,
                     hintText: 'Enter Pickup Point',
                     hintStyle: TextStyle(fontSize: 16,color: Colors.grey),
                     prefixIcon: Icon(Icons.location_on,size: 18,color: Colors.red.shade700,),
                   ),
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


                         showModalBottomSheet(
                         isScrollControlled: false,
                         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
                         isDismissible: false,
                         enableDrag: false,
                         context: context,
                         builder: (BuildContext context){
                           return Padding(
                               padding: EdgeInsets.only(
                               left: 8,right: 8,
                               top: 10,
                               bottom: MediaQuery.of(context).viewInsets.bottom + 0.5,),
                             child: Container(
                               height: 350,
                               child: SingleChildScrollView(
                                 child: Column(
                                   children: [
                                     Padding(
                                       padding: const EdgeInsets.only(left: 20,right: 8,),
                                       child: Row(
                                         children: [
                                           Text('Ride by',
                                             style: TextStyle(
                                                 fontSize: 20
                                             ),
                                           ),
                                           Spacer(),
                                           IconButton(
                                               onPressed: (){
                                                 Navigator.pop(context);
                                               },
                                               icon: Icon(Icons.close))
                                         ],
                                       ),
                                     ),








                                     Padding(
                                       padding: const EdgeInsets.all(8.0),
                                       child: GestureDetector(
                                         onTap: (){

                                           showModalBottomSheet(
                                           isScrollControlled: false,
                                           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
                                           isDismissible: false,
                                           enableDrag: false,
                                           context: context,
                                           builder: (BuildContext context){
                                             return Padding(
                                               padding: EdgeInsets.only(
                                                 left: 8,right: 8,
                                                 top: 10,
                                                 bottom: MediaQuery.of(context).viewInsets.bottom + 0.5,),
                                               child: Container(
                                                 height: 420,
                                                 child: Padding(
                                                   padding: const EdgeInsets.all(8.0),
                                                   child: SingleChildScrollView(
                                                     child: Column(
                                                       crossAxisAlignment: CrossAxisAlignment.start,
                                                       children: [
                                                         Center(child: Image.asset('assets/images/motor_bike.png',height: 70,width: 80,)),
                                                         Text('Bike',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                                                         SizedBox(height: 10,),
                                                         Text('Quickest way of individual commute and our most affordable option. Wear a mask, stay safe.',
                                                           style: TextStyle(fontSize: 12,color: Colors.grey.shade400),),
                                                         SizedBox(height: 10,),
                                                         Row(
                                                           children: [
                                                             Text('Base fare'),Spacer(),
                                                             Text('৳25.00'),
                                                           ],
                                                         ),
                                                         SizedBox(height: 5,),

                                                         Row(
                                                           children: [
                                                             Text('Per Kilometer'),Spacer(),
                                                             Text('৳15.00'),
                                                           ],
                                                         ),
                                                         SizedBox(height: 5,),

                                                         Row(
                                                           children: [
                                                             Text('Per Minute'),Spacer(),
                                                             Text('৳0.50'),
                                                           ],
                                                         ),
                                                         SizedBox(height: 5,),

                                                         Row(
                                                           children: [
                                                             Text('Safety Coverage Fee'),Spacer(),
                                                             Text('৳2.00'),
                                                           ],
                                                         ),
                                                         SizedBox(height: 5,),

                                                         Row(
                                                           children: [
                                                             Text('Minimum Fare'),Spacer(),
                                                             Text('৳50.00'),
                                                           ],
                                                         ),
                                                         SizedBox(height: 10,),

                                                         RichText(
                                                           text: TextSpan(
                                                           text: 'Your fare will be the price presented before the trip or based on rates above and other applicable surcharges and adjustments.',
                                                               style: TextStyle(color: Colors.grey)),

                                                         ),
                                                         SizedBox(height: 10,),

                                                         Padding(
                                                           padding: const EdgeInsets.all(8),
                                                           child: Center(
                                                             child: Container(
                                                               height: 45,
                                                               width: 320,
                                                               color: Colors.white,
                                                               child: ElevatedButton(
                                                                 style: ElevatedButton.styleFrom(
                                                                   primary: Colors.red.shade600,
                                                                 ),
                                                                 onPressed: () async{

                                                                   Navigator.pop(context);

                                                                   // Navigator.push(
                                                                   //     context,
                                                                   //     MaterialPageRoute(builder: (context) {
                                                                   //       return KioskOrderConfirmationPage();
                                                                   //     })
                                                                   // );
                                                                 },
                                                                 child: Text('I Understand',style: TextStyle(fontWeight: FontWeight.normal,fontSize: 16)),
                                                               ),
                                                             ),
                                                           ),
                                                         ),

                                                       ],
                                                     ),
                                                   ),
                                                 ),
                                               ),
                                             );
                                           }
                                           );

                                         },
                                         child: Container(
                                           height: 140,width: 160,
                                           child: Card(
                                             child: Column(
                                               children: [
                                                 Image.asset('assets/images/motor_bike.png',height: 70,width: 80,),
                                                 Text('BIKE'),SizedBox(height: 5,),
                                                 Text('৳52'),
                                               ],
                                             ),
                                           ),
                                         ),
                                       ),
                                     ),
                                     SizedBox(height: 10,),
                                     _showBox ? Container(
                                       height: 50, width: 320,
                                       decoration: BoxDecoration(
                                         border: Border.all(color: Colors.grey.shade900,width: 0.1),
                                         borderRadius: BorderRadius.circular(6.0),
                                         color: Colors.white,
                                       ),
                                       child: Center(
                                         child: ListTile(
                                           leading: Icon(Icons.money,size: 20,color: Colors.grey,),
                                           title: Text('Offer your own fare'),
                                           trailing: Icon(Icons.arrow_forward_ios_sharp,size: 16,color: Colors.grey,),
                                           onTap: (){


                                             showModalBottomSheet(
                                             isScrollControlled: true,
                                             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
                                             isDismissible: false,
                                             enableDrag: false,
                                             context: context,
                                             builder: (BuildContext context){
                                               return Padding(
                                                 padding: EdgeInsets.only(
                                                   left: 8,right: 8,
                                                   top: 10,
                                                   bottom: MediaQuery.of(context).viewInsets.bottom + 0.5,),
                                               child: Container(
                                                 height: 250,
                                                 child: Padding(
                                                   padding: const EdgeInsets.all(8.0),
                                                   child: SingleChildScrollView(
                                                     child: Column(
                                                       crossAxisAlignment: CrossAxisAlignment.start,
                                                       children: [
                                                         Text('Offer a reasonable fare',style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w500)),
                                                         SizedBox(height: 10,),
                                                         Text('Suggested fare ৳101'),
                                                         SizedBox(height: 10,),

                                                         Container(
                                                           height: 60,
                                                           decoration: BoxDecoration(
                                                             border: Border.all(color: Colors.grey.shade900,width: 0.1),
                                                             borderRadius: BorderRadius.circular(6.0),
                                                             color: Colors.white,
                                                           ),
                                                           child: Padding(
                                                             padding: const EdgeInsets.all(12.0),
                                                             child: TextField(
                                                               controller: _offer,
                                                               cursorColor: Colors.red.shade900,
                                                               decoration: InputDecoration(
                                                                 border: InputBorder.none,
                                                                 hintText: 'Enter your offer',
                                                                 hintStyle: TextStyle(fontSize: 16,color: Colors.grey),
                                                                 //prefixIcon: Icon(Icons.location_on,size: 18,color: Colors.red.shade700,),
                                                               ),
                                                             ),
                                                           ),
                                                         ),
                                                         SizedBox(height: 10,),

                                                         Padding(
                                                           padding: const EdgeInsets.all(8.0),
                                                           child: Container(
                                                               height: 30,width: 330,
                                                               decoration: BoxDecoration(
                                                                 //border: Border.all(color: Colors.red,width: 0.1),
                                                                 borderRadius: BorderRadius.circular(6.0),
                                                                 color: Colors.green.shade50,
                                                               ),
                                                               child: Center(child: Text('Your promo will be applied to your offered fare',
                                                                 style: TextStyle(color: Colors.green.shade900,fontSize: 13),textAlign: TextAlign.center,))),
                                                         ),


                                                         Padding(
                                                           padding: const EdgeInsets.all(8.0),
                                                           child: Row(
                                                             children: [
                                                               Container(
                                                                 height: 45,width: 150,
                                                                 color: Colors.white,
                                                                 child: ElevatedButton(
                                                                   style: ElevatedButton.styleFrom(
                                                                     primary: Colors.grey.shade100,
                                                                   ),
                                                                   onPressed: (){
                                                                     Navigator.pop(context);

                                                                   },
                                                                   child: Text('Cancel',style: TextStyle(fontWeight: FontWeight.normal,fontSize: 16,color: Colors.black54)),
                                                                 ),
                                                               ),
                                                               Spacer(),
                                                               Container(
                                                                 height: 45,width: 150,
                                                                 color: Colors.white,
                                                                 child: ElevatedButton(
                                                                   style: ElevatedButton.styleFrom(
                                                                     primary: Color(0xFFF59191),
                                                                   ),
                                                                   onPressed: () async{


                                                                     showModalBottomSheet(
                                                                     isScrollControlled: true,
                                                                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
                                                                     isDismissible: false,
                                                                     enableDrag: false,
                                                                     context: context,
                                                                     builder: (BuildContext context){

                                                                       return Padding(
                                                                         padding: EdgeInsets.only(
                                                                           left: 8,right: 8,
                                                                           top: 10,
                                                                           bottom: MediaQuery.of(context).viewInsets.bottom + 0.5,),
                                                                         child: Container(
                                                                           height: 550,
                                                                           child: Column(
                                                                             children: [
                                                                               Padding(
                                                                                 padding: const EdgeInsets.all(8.0),
                                                                                 child: Container(
                                                                                   height: 80,width: 320,
                                                                                   decoration: BoxDecoration(
                                                                                     //border: Border.all(color: Colors.red,width: 0.1),
                                                                                     borderRadius: BorderRadius.circular(6.0),
                                                                                     color: Colors.blueGrey.shade50,
                                                                                   ),
                                                                                   child: Column(
                                                                                     children: [
                                                                                       SizedBox(height: 20,),
                                                                                       Text('DHK METRO GA 37-8397',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18,color: Colors.black)),
                                                                                       Row(
                                                                                         mainAxisAlignment: MainAxisAlignment.center,
                                                                                         children: [
                                                                                           Image.asset('assets/images/Carr.png',height: 20,width: 30,),
                                                                                           Text('Axio Fielder'),
                                                                                         ],
                                                                                       ),
                                                                                     ],
                                                                                   ),
                                                                                 ),
                                                                               ),
                                                                               Padding(
                                                                                 padding: const EdgeInsets.only(left: 8,top: 10   ,right: 10,bottom: 10),
                                                                                 child: Row(
                                                                                   children: [
                                                                                     Icon(Icons.account_circle,size: 60,color: Colors.grey,),
                                                                                     SizedBox(width: 10,),
                                                                                     Column(
                                                                                       crossAxisAlignment: CrossAxisAlignment.start,
                                                                                       children: [
                                                                                         Text('Osman Goni',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 16,color: Colors.black)),
                                                                                         Text('⭐ 4.73 | 224 Trips',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 15,color: Colors.grey.shade500)),
                                                                                       ],
                                                                                     )
                                                                                   ],
                                                                                 ),
                                                                               ),
                                                                               Padding(
                                                                                 padding: const EdgeInsets.all(8.0),
                                                                                 child: Row(
                                                                                   children: [
                                                                                     Container(
                                                                                       height: 40,width: 270,
                                                                                       decoration: BoxDecoration(
                                                                                         border: Border.all(color: Colors.grey.shade900,width: 0.1),
                                                                                         borderRadius: BorderRadius.circular(24.0),
                                                                                         color: Colors.blueGrey.shade50,
                                                                                       ),
                                                                                       child: TextField(
                                                                                         controller: _message,
                                                                                         cursorColor: Colors.red.shade900,
                                                                                         decoration: InputDecoration(
                                                                                           border: InputBorder.none,
                                                                                           hintText: 'Send a free message',
                                                                                           hintStyle: TextStyle(fontSize: 16,color: Colors.grey),
                                                                                           prefixIcon: Icon(Icons.message_rounded,size: 20,color: Colors.blueGrey.shade700,),
                                                                                         ),
                                                                                       ),
                                                                                     ),
                                                                                     Spacer(),
                                                                                     Container(
                                                                                       height: 40,width: 40,
                                                                                       decoration: BoxDecoration(
                                                                                         border: Border.all(color: Colors.grey.shade900,width: 0.1),
                                                                                        // borderRadius: BorderRadius.circular(6.0),
                                                                                         shape: BoxShape.circle,
                                                                                         color: Colors.blueGrey.shade50,
                                                                                       ),
                                                                                       child: GestureDetector(
                                                                                         onTap: (){},
                                                                                           child: Icon(Icons.phone)),
                                                                                     ),

                                                                                   ],
                                                                                 ),
                                                                               ),
                                                                               Padding(
                                                                                 padding: const EdgeInsets.all(8.0),
                                                                                 child: Container(
                                                                                     height: 30,width: 330,
                                                                                     decoration: BoxDecoration(
                                                                                       //border: Border.all(color: Colors.red,width: 0.1),
                                                                                       borderRadius: BorderRadius.circular(6.0),
                                                                                       color: Colors.green.shade50,
                                                                                     ),
                                                                                     child: Center(
                                                                                         child: Row(
                                                                                           children: [
                                                                                             SizedBox(width: 5,),
                                                                                             Icon(Icons.security_rounded,size: 12,color: Colors.green,),
                                                                                             SizedBox(width: 5,),
                                                                                             Text('Rides are safer how with safety coverage',
                                                                                               style: TextStyle(color: Colors.green.shade900,fontSize: 13),textAlign: TextAlign.center,),
                                                                                             Spacer(),
                                                                                             Icon(Icons.arrow_forward_ios_sharp,size: 12,color: Colors.green,),
                                                                                             SizedBox(width: 5,),


                                                                                           ],
                                                                                         ))),
                                                                               ),
                                                                               Padding(
                                                                                 padding: const EdgeInsets.all(8.0),
                                                                                 child: Row(
                                                                                   children: [
                                                                                     Text('Your Trip'),Spacer(),
                                                                                    GestureDetector(
                                                                                      onTap: (){},
                                                                                      child: Row(
                                                                                        children: [
                                                                                          Text('Add/Edit',style: TextStyle(color: Colors.green.shade900),),
                                                                                          Icon(Icons.edit,size: 12,color: Colors.green.shade900)
                                                                                        ],
                                                                                      ),
                                                                                    )
                                                                                   ],
                                                                                 ),
                                                                               ),
                                                                               Padding(
                                                                                 padding: const EdgeInsets.all(8.0),
                                                                                 child: GestureDetector(
                                                                                   onTap: (){},
                                                                                   child: Row(
                                                                                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                     children: [
                                                                                       Icon(Icons.location_on,size: 18,color: Colors.red.shade600,),
                                                                                       SizedBox(width: 10,),
                                                                                       Text('Jasimuddin Circle, Sector 3, Uttara'),
                                                                                       Spacer(),
                                                                                       Icon(Icons.arrow_drop_down,size: 18,color: Colors.grey.shade500,),
                                                                                     ],
                                                                                   ),
                                                                                 ),
                                                                               ),
                                                                               Padding(
                                                                                 padding: const EdgeInsets.only(left: 8,right: 8,top: 8),
                                                                                 child: Divider(),
                                                                               ),
                                                                               Padding(
                                                                                 padding: const EdgeInsets.all(8.0),
                                                                                 child: Column(
                                                                                   crossAxisAlignment: CrossAxisAlignment.start,
                                                                                   children: [
                                                                                     Row(
                                                                                       children: [
                                                                                         Text('Pay via Cash',style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w500)),
                                                                                         Spacer(),
                                                                                         Text('৳194',style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w500))
                                                                                       ],
                                                                                     ),
                                                                                     Text('This is the estimated fare.This may vary.',style: TextStyle(color: Colors.grey,fontSize: 14,fontWeight: FontWeight.w300)),
                                                                                   ],
                                                                                 ),
                                                                               ),
                                                                               Padding(
                                                                                 padding: const EdgeInsets.only(left: 8,right: 8,top: 6),
                                                                                 child: Divider(),
                                                                               ),
                                                                               Padding(
                                                                                 padding: const EdgeInsets.all(8.0),
                                                                                 child: Row(
                                                                                   children: [
                                                                                     Text('Want to share this ride?'),
                                                                                     Spacer(),
                                                                                     GestureDetector(
                                                                                       onTap: (){},
                                                                                       child: Row(
                                                                                         children: [
                                                                                           Text('Share Now',style: TextStyle(color: Colors.green.shade900),),
                                                                                           Icon(Icons.share,size: 12,color: Colors.green.shade900)
                                                                                         ],
                                                                                       ),
                                                                                     )
                                                                                   ],
                                                                                 ),
                                                                               ),
                                                                               Padding(
                                                                                 padding: const EdgeInsets.only(left: 8,right: 8,top: 6),
                                                                                 child: Divider(),
                                                                               ),
                                                                               Padding(
                                                                                 padding: const EdgeInsets.all(8.0),
                                                                                 child: Row(
                                                                                   children: [
                                                                                     Text('Cancel this ride?'),
                                                                                     Spacer(),
                                                                                     GestureDetector(
                                                                                       onTap: (){

                                                                                         showModalBottomSheet(
                                                                                         isScrollControlled: false,
                                                                                         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
                                                                                         isDismissible: false,
                                                                                         enableDrag: false,
                                                                                         context: context,
                                                                                         builder: (BuildContext context){
                                                                                           return Padding(
                                                                                             padding: EdgeInsets.only(
                                                                                               left: 8,right: 8,
                                                                                               top: 10,
                                                                                               bottom: MediaQuery.of(context).viewInsets.bottom + 0.5,),
                                                                                           child: Container(
                                                                                             height: 200,
                                                                                             child: Column(
                                                                                               children: [
                                                                                                 Text('Your ride is waiting for you. Do you really want to cancel it?',
                                                                                                 style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w500)
                                                                                                 ),
                                                                                                 SizedBox(height: 10,),
                                                                                                 Text('You might be charged a penalty for canceling this ride.',
                                                                                                     style: TextStyle(color: Colors.grey.shade700,fontSize: 16,fontWeight: FontWeight.w300)
                                                                                                 ),
                                                                                                 SizedBox(height: 10,),
                                                                                                 Divider(),
                                                                                                 Row(
                                                                                                   children: [
                                                                                                     Padding(
                                                                                                       padding: const EdgeInsets.all(8.0),
                                                                                                       child: Container(
                                                                                                         height: 45,width: 150,
                                                                                                         color: Colors.white,
                                                                                                         child: ElevatedButton(
                                                                                                           style: ElevatedButton.styleFrom(
                                                                                                             primary: Colors.grey.shade100,
                                                                                                           ),
                                                                                                           onPressed: (){
                                                                                                             Navigator.pop(context);
                                                                                                             Navigator.pop(context);
                                                                                                             Navigator.pop(context);

                                                                                                           },
                                                                                                           child: Text('Yes',style: TextStyle(fontWeight: FontWeight.normal,fontSize: 16,color: Colors.black54)),
                                                                                                         ),
                                                                                                       ),
                                                                                                     ),
                                                                                                     Padding(
                                                                                                       padding: const EdgeInsets.all(8.0),
                                                                                                       child: Container(
                                                                                                         height: 45,width: 150,
                                                                                                         color: Colors.white,
                                                                                                         child: ElevatedButton(
                                                                                                           style: ElevatedButton.styleFrom(
                                                                                                             primary: Colors.red.shade600,
                                                                                                           ),
                                                                                                           onPressed: () async{
                                                                                                             Navigator.pop(context);

                                                                                                           },
                                                                                                           child: Text('No',style: TextStyle(fontWeight: FontWeight.normal,fontSize: 16)),
                                                                                                         ),
                                                                                                       ),
                                                                                                     ),
                                                                                                   ],
                                                                                                 ),
                                                                                               ],
                                                                                             ),
                                                                                           ),

                                                                                           );
                                                                                         }
                                                                                         );


                                                                                       },
                                                                                       child: Row(
                                                                                         children: [
                                                                                           Text('Cancel Now',style: TextStyle(color: Colors.red.shade900),),
                                                                                           Icon(Icons.close,size: 12,color: Colors.red.shade900)
                                                                                         ],
                                                                                       ),
                                                                                     )
                                                                                   ],
                                                                                 ),
                                                                               ),

                                                                             ],
                                                                           ),
                                                                         ),
                                                                       );
                                                                     }
                                                                     );

                                                                   },
                                                                   child: Text('Find a Ride',style: TextStyle(fontWeight: FontWeight.normal,fontSize: 16)),
                                                                 ),
                                                               ),
                                                             ],
                                                           ),
                                                         ),

                                                       ],
                                                     ),
                                                   ),
                                                 ),
                                               ),
                                               );
                                             }
                                             );

                                           },
                                         ),
                                       ),
                                     ) : SizedBox(),


                                     Padding(
                                       padding: const EdgeInsets.all(8),
                                       child: Container(
                                         height: 45,width: 320,
                                         color: Colors.white,
                                         child: ElevatedButton(
                                           style: ElevatedButton.styleFrom(
                                             primary: Colors.red.shade600,
                                           ),
                                           onPressed: () async{


                                             showModalBottomSheet(
                                             isScrollControlled: true,
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
                                                 height: 350,
                                                 child: Column(
                                                   children: [
                                                     Row(
                                                       children: [
                                                         Spacer(),
                                                         IconButton(
                                                             onPressed: (){
                                                               Navigator.pop(context);
                                                             },
                                                             icon: Icon(Icons.close)),
                                                       ],
                                                     ),
                                                     Image.asset('assets/images/destination.png',height: 110,width: 200,),
                                                     SizedBox(height: 10,),
                                                     Text('Destination Address is too close',
                                                         style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w500)),
                                                     SizedBox(height: 10,),
                                                     Padding(
                                                       padding: const EdgeInsets.all(8.0),
                                                       child: RichText(text: TextSpan(
                                                         text: 'The distance to your destination is only a short walk away. Pick a farther destination.',
                                                           style: TextStyle(color: Colors.grey,),
                                                       ),
                                                         textAlign: TextAlign.center,
                                                       ),
                                                     ),
                                                     SizedBox(height: 10,),
                                                     Container(
                                                       height: 45,width: 320,
                                                       color: Colors.white,
                                                       child: ElevatedButton(
                                                         style: ElevatedButton.styleFrom(
                                                           primary: Colors.red.shade600,
                                                         ),
                                                         onPressed: () async{
                                                           Navigator.pop(context);
                                                           Navigator.pop(context);
                                                         },
                                                         child: Text('Update Destination Address',style: TextStyle(fontWeight: FontWeight.normal,fontSize: 16)),
                                                       ),
                                                     ),



                                                   ],
                                                 ),
                                               ),
                                               );
                                             }
                                             );

                                           },
                                           child: Text('Find a Ride',style: TextStyle(fontWeight: FontWeight.normal,fontSize: 16)),
                                         ),
                                       ),
                                     ),

                                   ],
                                 ),
                               ),
                             ),
                           );
                         }
                         );

                        // Navigator.pop(context);

                       },
                       child: Text('Confirm',style: TextStyle(fontWeight: FontWeight.normal,fontSize: 16)),
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
