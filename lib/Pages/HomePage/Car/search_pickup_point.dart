


import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geocoding/geocoding.dart';
//import 'package:geolocator/geolocator.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;

import '../Bike/YourTripPage.dart';
import 'SetOnMapPage2.dart';
import 'SetOnMapPageForCar.dart';

class SearchPickUpPoint extends StatefulWidget {

  final double destinationLatitude;
  final double destinationLongitude;
  final String destinetionDetail;

  const SearchPickUpPoint({super.key, required this.destinationLatitude, required this.destinationLongitude, required this.destinetionDetail});


  //const SearchPickUpPoint({Key? key}) : super(key: key);

  @override
  State<SearchPickUpPoint> createState() => _SearchPickUpPointState();
}

class _SearchPickUpPointState extends State<SearchPickUpPoint> with TickerProviderStateMixin {


  List<LatLng> polyCordinates=[];
  TextEditingController Search_controller=TextEditingController();

  var uuid=Uuid();

  List<dynamic> _placelist=[];

  String _sessionToken="122344";

  ///////////////////////////////////////////////////////////////////


  // @override
  // void initState(){
  //   super.initState();
  //
  //   Search_controller.addListener(() {
  //
  //     Onchange();
  //   });
  //
  //
  // }

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








  ////////////////////////////////////////////////////////////


  //static const LatLng SourceLocation=LatLng(37.3305, -122.03272);



  Set<Polyline> PolylineSet={};

  // Future<void> getpolyline() async {
  //
  //   PolylinePoints polylinePoints=PolylinePoints();
  //
  //   PolylineResult result=await polylinePoints.getRouteBetweenCoordinates(
  //       "AIzaSyBsPxSFf2or6oZnbq7urgrxlakTiVqTmjQ",
  //       PointLatLng(SourceLocation.latitude,SourceLocation.longitude),
  //       PointLatLng(DestinationLocation.latitude, DestinationLocation.longitude));
  //
  //   result.points.forEach((location) {
  //     polyCordinates.add(LatLng(location.latitude, location.longitude));
  //   });
  //
  //   _polyline.add(
  //       Polyline(
  //           polylineId: PolylineId("1"),
  //           points: [SourceLocation,DestinationLocation],//polyCordinates,
  //           width: 6,
  //           color: Colors.red
  //       )
  //   );
  //
  //   setState(() {
  //
  //   });
  //
  //
  //
  // }



  ///////////////////////////////////////////////////////








  late AnimationController _animationController;
  late Animation<Offset> _animation;

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
  //   return await Geolocator.getCurrentPosition();
  // }

  static final _code=TextEditingController();
  static final _destination=TextEditingController();

  late TabController _promoController;



  bool _isExpand=false;
  bool _invisible = true;
  bool expand = true;


  @override
  void initState(){
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

  bool Expand=false;

  final double _initFabHeight = 120.0;
  double _fabHeight = 0;
  double _panelHeightOpen = 0;
  double _panelHeightClosed = 200;


  PanelController panelController = PanelController();

  @override
  Widget build(BuildContext context) {
    _panelHeightOpen = MediaQuery.of(context).size.height * .99;

    LatLng SourceLocation=LatLng(widget.destinationLatitude, widget.destinationLongitude);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container  (
            child: SafeArea(
              child: Stack(
                children: [


                  // GooglePlaceAutoCompleteTextField(
                  //     textEditingController: _destination,
                  //     googleAPIKey: "AIzaSyBsPxSFf2or6oZnbq7urgrxlakTiVqTmjQ",
                  //     inputDecoration: InputDecoration(),
                  //     //debounceTime: 800 // default 600 ms,
                  //     //countries: ["in","bn"],// optional by default null is set
                  //     isLatLngRequired:true,// if you required coordinates from place detail
                  //     getPlaceDetailWithLatLng: (Prediction prediction) {
                  //       // this method will return latlng with place detail
                  //       print("placeDetails" + prediction.lng.toString());
                  //     }, // this callback is called when isLatLngRequired is true
                  //     itmClick: (Prediction prediction) {
                  //       _destination.text=prediction.description!;
                  //       _destination.selection = TextSelection.fromPosition(TextPosition(offset: prediction.description!.length));
                  //     }
                  // ),


                  GoogleMap(
                    initialCameraPosition: CameraPosition(
                        target: SourceLocation,//LatLng(currentLocation.latitude!,currentLocation.longitude!),
                        zoom: 14.5),
                    markers: {
                      Marker(
                          markerId: MarkerId("Source"),
                          position: SourceLocation//LatLng(currentLocation!.latitude!,currentLocation!.longitude!)
                      ),

                    },

                    polylines: PolylineSet,



                    // polylines: {
                    //   Polyline(
                    //     polylineId: PolylineId("routs"),
                    //     points: polyCordinates
                    //   )
                    // },
                    // mapType: MapType.hybrid,
                    // myLocationEnabled: true,
                    // compassEnabled: true,
                    // onMapCreated: (GoogleMapController controller){
                    //   _controller.complete(controller);
                    // },
                  ),



                  // GoogleMap(
                  //   initialCameraPosition: _kGoogle,
                  //   markers: Set<Marker>.of(_markers),
                  //   mapType: MapType.hybrid,
                  //   myLocationEnabled: true,
                  //   compassEnabled: true,
                  //   onMapCreated: (GoogleMapController controller){
                  //     _controller.complete(controller);
                  //   },
                  // ),
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



                        //
                        // getUserCurrentLocation().then((value) async {
                        //   print(value.latitude.toString() +" "+value.longitude.toString());
                        //
                        //   _markers.add(
                        //       Marker(
                        //         markerId: MarkerId("1"),
                        //         position: LatLng(value.latitude, value.longitude),
                        //         infoWindow: InfoWindow(
                        //           title: 'My Current Location',
                        //         ),
                        //       )
                        //   );
                        //
                        //   CameraPosition cameraPosition = new CameraPosition(
                        //     target: LatLng(value.latitude, value.longitude),
                        //     zoom: 10,
                        //   );
                        //
                        //   final GoogleMapController controller = await _controller.future;
                        //   controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
                        //   setState(() {
                        //   });
                        // });
                        //





                      },
                      child: Icon(Icons.local_activity,size: 16,color: Colors.green,),
                    ),

                  ),
                  Positioned(
                      right: 10.0,
                      top: 300,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: TextButton(
                          onPressed: (){
                            showModalBottomSheet(
                                isScrollControlled: false,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
                                isDismissible: true,
                                enableDrag: false,
                                context: context,
                                builder: (BuildContext context){
                                  return Padding(
                                    padding: EdgeInsets.only(
                                      top: 10,
                                      bottom: MediaQuery.of(context).viewInsets.bottom + 0.5,
                                    ),
                                    child: Container(
                                      height: 350,
                                      child: Column(
                                        children: [
                                          Image.asset('assets/images/Safe.png'),const SizedBox(height: 15,),
                                          const Text('Safe trips with Pathao Safety Coverage',
                                            style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w400),textAlign: TextAlign.center,),
                                          const SizedBox(height: 15,),
                                          const Text('  Get coverage with only ৳2/ride',
                                            style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w300),textAlign: TextAlign.center,),
                                          const SizedBox(height: 8,),
                                          const Text('- Personal accident coverage up to BDT 5,000 \n - Medical expenses reimbursement up to BDT 1 lac',
                                            style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w300),textAlign: TextAlign.center,
                                          ),
                                          const SizedBox(height: 8,),
                                          TextButton(
                                              onPressed: (){},
                                              child: Text('Learn More',style: TextStyle(color: Colors.red.shade500),)),
                                          const SizedBox(height: 8,),
                                          Container(
                                              height: 50,width: 320,
                                              decoration: BoxDecoration(
                                                border: Border.all(color: Colors.red,width: 1),
                                                borderRadius: BorderRadius.circular(8.0),
                                                color: Colors.red,
                                              ),
                                              child: TextButton(
                                                onPressed: (){
                                                  Navigator.pop(context);
                                                },
                                                child: const Text('Got It',
                                                  style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w400),textAlign: TextAlign.center,),)
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                });
                          },
                          child: Icon(Icons.security_sharp,color: Colors.green,),
                        ),
                      )
                  ),
                  Positioned(
                      right: 10.0,
                      top: 350,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: TextButton(
                          onPressed: (){
                            showModalBottomSheet(
                                backgroundColor: Colors.blueGrey.shade50,
                                context: context,
                                isScrollControlled: true,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
                                isDismissible: false,
                                enableDrag: true,
                                useSafeArea:true,
                                builder: (BuildContext context){
                                  return Padding(
                                    padding: EdgeInsets.only(
                                      top: 6,
                                      bottom: MediaQuery.of(context).viewInsets.bottom + 0.5,
                                    ),
                                    child: Container(
                                      height: 580,
                                      child: SingleChildScrollView(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            const SizedBox(height: 4,),
                                            Row(
                                              //crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                const SizedBox(width: 10,),
                                                const Text('Add Promo',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),),Spacer(),
                                                TextButton(
                                                    onPressed: (){
                                                      Navigator.pop(context);
                                                    },
                                                    child: const Icon(Icons.close,color: Colors.black,))
                                              ],
                                            ),
                                            const SizedBox(height: 3,),
                                            Container(
                                              height: 50,width: 330,
                                              margin: const EdgeInsets.all(8),
                                              decoration: BoxDecoration(
                                                  border: Border.all(color: Colors.grey.shade200,width: 1),
                                                  borderRadius: BorderRadius.circular(10.0),
                                                  color: Colors.white
                                              ),
                                              child: TextField(
                                                cursorColor: Colors.red,
                                                decoration: const InputDecoration(
                                                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey, width: 1.0),),
                                                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey, width: 1.0),),
                                                  labelText: 'Enter Promo Code',
                                                  labelStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.normal, color: Color(0xFF1C1C25)
                                                  ),
                                                ),
                                                controller: _code,
                                                onSubmitted: (String value) {
                                                  debugPrint(value);
                                                },
                                              ),
                                            ),




                                            Divider(),


                                            SafeArea(
                                              child: Padding(
                                                padding: const EdgeInsets.all(12.0),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(10),
                                                      color:  Colors.white
                                                  ),
                                                  child: TabBar(
                                                    controller: _promoController,
                                                    indicator: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(10), // Creates border
                                                        color: Colors.red.shade50),
                                                    labelColor: Colors.red,
                                                    unselectedLabelColor: Colors.black,
                                                    // overlayColor: Color(0xFFFAFAFA),
                                                    tabs: <Widget>[
                                                      Container(
                                                        height: 35,
                                                        width: 210,
                                                        //color: Colors.white,

                                                        child: const Padding(
                                                          padding: EdgeInsets.all(9.0),
                                                          child: Text('Available Promos',),
                                                        ),
                                                      ),
                                                      Container(
                                                        height: 35,
                                                        width: 210,
                                                        child: Row(
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          children: const [
                                                            Text('Point Deals   '),
                                                            Icon(Icons.fiber_new,color: Colors.red,)
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),

                                            ),
                                            Container(
                                              height: 400,
                                              child: TabBarView(
                                                physics: NeverScrollableScrollPhysics(),
                                                controller: _promoController,
                                                children: [
                                                  ListView.builder(
                                                      itemCount: 10,
                                                      itemBuilder: (BuildContext context, int index){
                                                        return Padding(
                                                          padding: const EdgeInsets.all(4.0),
                                                          child: Card(
                                                            color: Colors.white,
                                                            elevation: 0.0,
                                                            child: Padding(
                                                              padding: const EdgeInsets.all(8.0),
                                                              child: ListTile(
                                                                title: Row(
                                                                  children: [
                                                                    Text('SPRINT120'),Spacer(),
                                                                    Container(
                                                                        height: 16,width: 30,
                                                                        decoration: BoxDecoration(
                                                                            borderRadius: BorderRadius.circular(5),
                                                                            color: Colors.red
                                                                        ),
                                                                        child: Padding(
                                                                          padding: const EdgeInsets.only(left: 5,top: 3,bottom: 3),
                                                                          child: Text('BIKE',style: TextStyle(color: Colors.white,fontSize: 10),),
                                                                        ))
                                                                  ],
                                                                ),
                                                                subtitle: Column(
                                                                  children: [
                                                                    SizedBox(height: 10,),
                                                                    Text('25% off on your next ride in Dhaka! (Up to 120BDT. minimum ride fare: 45BDT)'),
                                                                    SizedBox(height: 10,),
                                                                    Row(
                                                                      children: [
                                                                        Container(
                                                                          height: 32,
                                                                          child: TextButton(
                                                                            onPressed: (){}, child: Text('Apply Promo',style: TextStyle(color: Colors.white),),),
                                                                          decoration: BoxDecoration(
                                                                              borderRadius: BorderRadius.circular(5),
                                                                              color: Colors.red
                                                                          ),
                                                                        ),
                                                                        SizedBox(width: 10,),
                                                                        Text('Valid till April 30, 2023'),
                                                                      ],
                                                                    )
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ) ;
                                                      }
                                                  ),

                                                  ListView.builder(
                                                      itemCount: 10,
                                                      itemBuilder: (BuildContext context, int index){
                                                        return Padding(
                                                          padding: const EdgeInsets.all(4.0),
                                                          child: Card(
                                                            elevation: 0.0,
                                                            color: Colors.white,
                                                            child: Padding(
                                                              padding: const EdgeInsets.all(8.0),
                                                              child: ListTile(
                                                                title: Column(
                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                  children: [
                                                                    Text('BRONZE BUNDLE DEAL ON BIKE & CAR',style: TextStyle(color: Colors.brown.shade300,fontSize: 14)),
                                                                    SizedBox(height: 10,),
                                                                    Text('Up to TK 80 Discount on Rides',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w400)),
                                                                    SizedBox(height: 20,),
                                                                  ],
                                                                ),
                                                                subtitle: Row(
                                                                  children: [
                                                                    Text('Valid till April 15, 2023'),Spacer(),
                                                                    Container(
                                                                      height: 30,width: 90,
                                                                      decoration: BoxDecoration(
                                                                          borderRadius: BorderRadius.circular(4),
                                                                          color: Colors.red
                                                                      ),
                                                                      child: TextButton(
                                                                        onPressed: (){},
                                                                        child: Text('600 Points',style: TextStyle(color: Colors.white)),
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
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                });
                          },
                          child: Icon(Icons.percent,color: Colors.green,),
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
                topLeft: Radius.circular(18.0),
                topRight: Radius.circular(18.0)),
            onPanelSlide: (double pos) =>
                setState(() {
                  _fabHeight = pos * (_panelHeightOpen - _panelHeightClosed) +
                      _initFabHeight;
                  _isExpand=(pos>=1.0);
                  _animationController.value = pos;
                  _invisible=(pos==1.0);
                  expand=(pos==1.0);

                }),
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
          children: <Widget>[





            // Padding(
            //   padding: const EdgeInsets.only(top: 20,left: 20,right: 20),
            //   child: _isExpand ?
            //   Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       IconButton(
            //           padding: EdgeInsets.only(right: 350),
            //           onPressed: (){
            //             panelController.close();
            //           },
            //           icon: Icon(Icons.arrow_back_sharp)),
            //       SizedBox(height: 10,),
            //
            //
            //
            //
            //       Container(
            //         height: 50,width: 322,
            //         decoration: BoxDecoration(
            //             border: Border.all(color: Colors.grey.shade400,width: 1),
            //             borderRadius: BorderRadius.circular(10.0),
            //             color: Colors.white
            //         ),
            //         child: Row(
            //           children: [
            //             const SizedBox(width: 10,),
            //             Icon(Icons.person,size: 20,color: Colors.grey.shade600,),
            //             const SizedBox(width: 10,),
            //             Container(
            //               child: Column(
            //                 mainAxisAlignment: MainAxisAlignment.start,
            //                 crossAxisAlignment: CrossAxisAlignment.start,
            //                 children: [
            //                   const SizedBox(height: 10,),
            //                   Text('Pickup',style: TextStyle(fontWeight: FontWeight.normal,fontSize: 12,color: Colors.grey.shade700)),
            //                   const Text('29, Shah Magdum Avenue, Sector 12',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 12,color: Colors.black)),
            //                 ],
            //               ),
            //             )
            //           ],
            //         ),
            //       ),
            //     ],
            //   )
            //       : Container(
            //     height: 30,width: 324,
            //     decoration: BoxDecoration(
            //       border: Border.all(color: Colors.white,width: 1),
            //       borderRadius: BorderRadius.circular(8.0),
            //       color: Colors.green.shade50,
            //     ),
            //     child: TextButton(
            //       onPressed: (){
            //         showModalBottomSheet(
            //             isScrollControlled: false,
            //             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
            //             isDismissible: false,
            //             enableDrag: false,
            //             context: context,
            //             builder: (BuildContext context){
            //               return Padding(
            //                 padding: EdgeInsets.only(
            //                   top: 10,
            //                   bottom: MediaQuery.of(context).viewInsets.bottom + 0.5,
            //                 ),
            //                 child: Container(
            //                   height: 400,
            //                   child: Column(
            //                     children: [
            //                       Image.asset('assets/images/Fares.png'),const SizedBox(height: 15,),
            //                       const Text('Fares are comparatively lower now',
            //                         style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w400),textAlign: TextAlign.center,),
            //                       SizedBox(height: 15,),
            //                       const Text('  Fares are lower at this moment Request your rides as soon as possible.',
            //                         style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w300),textAlign: TextAlign.center,),
            //                       const SizedBox(height: 15,),
            //                       Container(
            //                           height: 50,width: 320,
            //                           decoration: BoxDecoration(
            //                             border: Border.all(color: Colors.red,width: 1),
            //                             borderRadius: BorderRadius.circular(8.0),
            //                             color: Colors.red,
            //                           ),
            //                           child: TextButton(
            //                             onPressed: (){
            //                               Navigator.pop(context);
            //                             },
            //                             child: const Text('Awesome!',
            //                               style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w400),textAlign: TextAlign.center,),)
            //                       )
            //                     ],
            //                   ),
            //                 ),
            //               );
            //             });
            //       },
            //       child: Row(
            //         children: [
            //           CircleAvatar(
            //               backgroundColor: Colors.white,
            //               child: Icon(Icons.arrow_forward, size: 10,color: Colors.green.shade900,)
            //           ),
            //           Text('Fares are comparatively lower now for car',
            //             style: TextStyle(color: Colors.green.shade900,fontSize: 12),),Spacer(),
            //           Icon(Icons.info_outline,color: Colors.green.shade900,size: 10,)
            //         ],
            //       ),
            //     ),
            //   ),
            // ),






            Padding(
              padding: const EdgeInsets.only(left: 8,right: 8,top: 8),
              child: Row(
                children: [
                  Container(
                    height: 50,width: 260,
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
                          hintText: 'Search Your location',
                          hintStyle: TextStyle(fontSize: 17,color: Colors.black87),
                          prefixIcon: InkWell(
                            child: Icon(Icons.location_on,color: Colors.red,),
                            onTap: (){

                            },
                          ),
                          // suffixIcon: InkWell(
                          //   child: Icon(Icons.arrow_forward_ios),
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









                  Container(
                    height: 50,width: 50,
                    margin: const EdgeInsets.all(7),
                    decoration: _invisible ? null : BoxDecoration(
                        border: Border.all(color: Colors.grey.shade700,width: 1),
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white
                    ),
                    child: TextButton(
                        style: TextButton.styleFrom(primary: Colors.white,),
                        onPressed: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return const YourTripPage();
                              })
                          );
                        },
                        child: const Icon(Icons.add,color: Colors.red,size: 30,)),
                  ),

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

                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return SetOnMap2(
                                SearchDestinations: widget.destinetionDetail,
                              sourceLat: locations.last.latitude,
                              sourceLong: locations.last.longitude,
                              destinationLat: widget.destinationLatitude,
                              destinationlong: widget.destinationLongitude,
                              SearchPickup: _placelist[index]['description'],
                            );
                          })
                      );

                    },



                  );

                }),



            Stack(
              children: [
                expand ? Positioned(child: Column(
                  children: [
                    Divider(thickness: 8,color: Colors.blueGrey.shade50,),
                    Padding(
                      padding: const EdgeInsets.only(left: 6,right: 8),
                      child: Container(
                        height: 60,
                        child: ListTile(
                          leading:   CircleAvatar(
                              radius: 17,
                              backgroundColor: Colors.grey.shade200,
                              child: Icon(Icons.search, size: 16,color: Colors.grey.shade600,)
                          ),
                          title: Text('Set On Map',style: TextStyle(fontSize: 17,color: Colors.black,fontWeight: FontWeight.normal),),
                          onTap: (){


                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return const SetOnMapForCar();
                                })
                            );

                          },
                        ),

                      ),
                    ),
                  ],
                ))
                    : Positioned(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 6,right: 8),
                    child: Container(
                      height: 60,
                      child: ListTile(
                        leading:   CircleAvatar(
                            radius: 17,
                            backgroundColor: Colors.grey.shade200,
                            child: Icon(Icons.search, size: 16,color: Colors.grey.shade600,)
                        ),
                        title: Text('Set On Map',style: TextStyle(fontSize: 17,color: Colors.black,fontWeight: FontWeight.normal),),
                        onTap: (){


                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return const SetOnMapForCar();
                              })
                          );

                        },
                      ),
                    ),
                  ),
                )
              ],
            ),
            Divider(thickness: 8,color: Colors.blueGrey.shade50,),
            Container(
              height: 60,
              child: ListTile(
                leading:  CircleAvatar(
                    radius: 19,
                    backgroundColor: Colors.red.shade50,
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Icon(Icons.map,size: 18,color: Colors.red,),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Icon(Icons.add_location,size: 17,color: Colors.red,),
                        ),
                      ],
                    )
                ),
                title: Text('Add missing place to the My Road Map',style: TextStyle(fontSize: 13,color: Colors.black,fontWeight: FontWeight.w400)),
                trailing: Icon(Icons.arrow_forward_ios_sharp,size: 16,),
                onTap: (){
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(builder: (context) {
                  //       return const AddMissingPlacePage();
                  //     })
                  // );
                },

              ),
            ),
            Divider(thickness: 8,color: Colors.blueGrey.shade50,),

          ],
        ));
  }

}
