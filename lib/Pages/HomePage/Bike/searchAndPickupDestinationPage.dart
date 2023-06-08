import 'dart:async';

import 'package:flutter/material.dart';
//import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class SearchAndPickupDestinationPage extends StatefulWidget {
  const SearchAndPickupDestinationPage({Key? key}) : super(key: key);

  @override
  State<SearchAndPickupDestinationPage> createState() => _SearchAndPickupDestinationPageState();
}

class _SearchAndPickupDestinationPageState extends State<SearchAndPickupDestinationPage> with TickerProviderStateMixin {


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
  //
  //   // await ref.child("${widget.phoneNumber}").child("profile").set({
  //   //   "full_name": "${fullnameContriller.text.toString()}",
  //   //   //"last_name": "_lastName",
  //   //   "Date_of_Birth": "${_dob.text.toString()}",
  //   //   "gender": "$GenderType",
  //   //   "email": "${emailAddressController.text.toString()}",
  //   //   "mobile_no": "${widget.phoneNumber}",
  //   //
  //   //
  //   //
  //   //
  //   //   // "address": {
  //   //   //   "line1": "100 Mountain View"
  //   //   // }
  //   // }).then((value) {
  //   //   Navigator.pop(context);
  //   //   Navigator.push(
  //   //     context,
  //   //     MaterialPageRoute(
  //   //       builder: (context) {
  //   //         return TermsAndConditions();
  //   //       },
  //   //     ),
  //   //   );
  //   // });
  //
  //
  //
  //
  //
  //   return await Geolocator.getCurrentPosition();
  // }

  static final _pickup =TextEditingController();
  static final _code =TextEditingController();
  static final _destination=TextEditingController();



  final double _initFabHeight = 120.0;
  double _fabHeight = 0;
  double _panelHeightOpen = 0;
  double _panelHeightClosed = 200;


  PanelController panelController = PanelController();

  late TabController _promoController;

  @override
  void initState() {
    _promoController = TabController(length: 2, vsync: this);
    super.initState();
  }

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
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 50,width: 330,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade900,width: 0.1),
                        borderRadius: BorderRadius.circular(6.0),
                        color: Colors.white,
                      ),
                      child: TextField(
                        controller: _destination,
                        cursorColor: Colors.red.shade900,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search Destination',
                          hintStyle: TextStyle(fontSize: 16,color: Colors.grey),
                          prefixIcon: Icon(Icons.location_on,size: 16,color: Colors.red.shade600,),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
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
                          prefixIcon: Icon(Icons.wheelchair_pickup,size: 16,color: Colors.grey.shade700,),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      height: 45,width: 320,
                      color: Colors.white,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFFF59191),
                        ),
                        onPressed: () async{

                          Navigator.pop(context);

                        },
                        child: Text('Confirm',style: TextStyle(fontWeight: FontWeight.normal,fontSize: 16)),
                      ),
                    ),
                  )

          ],
        )
    );
  }

}
