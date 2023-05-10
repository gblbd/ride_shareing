import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'OrderConfirmationHomePickup.dart';
import 'OrderConfirmationKioskDrop.dart';
import 'SaveAddressPage.dart';

class AddPickUpPage extends StatefulWidget {
  const AddPickUpPage({Key? key}) : super(key: key);

  @override
  State<AddPickUpPage> createState() => _AddPickUpPageState();
}

class _AddPickUpPageState extends State<AddPickUpPage> {


  static final _guide =TextEditingController();


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



  final double _initFabHeight = 120.0;
  double _fabHeight = 0;
  double _panelHeightOpen = 0;
  double _panelHeightClosed = 350;


  PanelController panelController = PanelController();


  @override
  Widget build(BuildContext context) {
    _panelHeightOpen = MediaQuery.of(context).size.height * .99;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Container(
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
                      top: 300,
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
                            setState(() {
                            });
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
              padding: const EdgeInsets.only(left: 10.0,top: 20,),
              child: Container(
                child: Text('Add Pickup Location',style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                  height: 60,width: 322,
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade400,width: 1),
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white
                  ),
                child: ListTile(
                  minLeadingWidth: 20,
                  leading: Icon(Icons.person,size: 20,color: Colors.grey.shade600,),
                  title: Text('PickUp',style: TextStyle(fontWeight: FontWeight.normal,fontSize: 16,color: Colors.grey.shade700)),
                  subtitle: Text('29,Shah Magdum Avenue, Sector 12',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 14,color: Colors.black)),
                  onTap: (){},
                ),

              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0,top: 10,),
              child: Container(
                child: Text('Guide Pickup Agent',style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 60,
                    //width: 322,
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade400,width: 1),
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white
                    ),
                    child: Center(
                      child: TextField(
                        controller: _guide,
                        cursorColor: Colors.red.shade900,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Add Direction (Road,Landmark,House etc)',
                            hintStyle: TextStyle(fontSize: 14,color: Colors.grey),
                          prefixIcon: Icon(Icons.assistant_direction_outlined,color: Colors.grey.shade600,),
                        ),
                      ),
                    ),
                  ),
                  Text('   Min character 5'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: Row(
                children: [
                  Container(
                    height: 45,width: 250,
                    color: Colors.white,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFFF59191),
                      ),
                      onPressed: (){
                        showModalBottomSheet(
                            isScrollControlled: false,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
                            isDismissible: false,
                            enableDrag: false,
                            context: context,
                            builder: (BuildContext context){
                              return Padding(
                                  padding: EdgeInsets.only(
                                    left: 10,right: 8,
                                    top: 10,
                                    bottom: MediaQuery.of(context).viewInsets.bottom + 0.5,
                                  ),
                                child: Container(
                                  height: 240,
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Text('Courier Method',
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
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              GestureDetector(
                                                onTap: (){
                                                  Navigator.push(context,
                                                      MaterialPageRoute(builder: (context) {
                                                        return OrderConfirmation();
                                                      })
                                                  );

                                                  // showModalBottomSheet(
                                                  //     isScrollControlled: false,
                                                  //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
                                                  //     isDismissible: false,
                                                  //     enableDrag: false,
                                                  //     context: context,
                                                  //     builder: (BuildContext context){
                                                  //       return Padding(
                                                  //           padding: EdgeInsets.only(
                                                  //           left: 10,right: 8,
                                                  //           top: 10,
                                                  //           bottom: MediaQuery.of(context).viewInsets.bottom + 0.5,),
                                                  //       child: Container(
                                                  //         height: 200,
                                                  //         child: Padding(
                                                  //           padding: const EdgeInsets.all(8.0),
                                                  //           child: Column(
                                                  //             crossAxisAlignment: CrossAxisAlignment.start,
                                                  //             children: [
                                                  //               Text('Courier Method Confirmation',style: TextStyle(fontSize: 22,),),
                                                  //               SizedBox(height: 15,),
                                                  //               Text('You have chosen the "Home Pickup" as your courier method.',style: TextStyle(fontSize: 15,),),
                                                  //               SizedBox(height: 15,),
                                                  //               Divider(),
                                                  //               Padding(
                                                  //                 padding: const EdgeInsets.all(8.0),
                                                  //                 child: Row(
                                                  //                   children: [
                                                  //                     Padding(
                                                  //                       padding: const EdgeInsets.all(6.0),
                                                  //                       child: Container(
                                                  //                         height: 45,width: 140,
                                                  //                         color: Colors.white,
                                                  //                         child: ElevatedButton(
                                                  //                           style: ElevatedButton.styleFrom(
                                                  //                             primary: Colors.grey.shade100,
                                                  //                           ),
                                                  //                           onPressed: (){
                                                  //                             Navigator.pop(context);
                                                  //
                                                  //                           },
                                                  //                           child: Text('Cancel',style: TextStyle(fontWeight: FontWeight.normal,fontSize: 16,color: Colors.black54)),
                                                  //                         ),
                                                  //                       ),
                                                  //                     ),
                                                  //                     Padding(
                                                  //                       padding: const EdgeInsets.all(6.0),
                                                  //                       child: Container(
                                                  //                         height: 45,width: 140,
                                                  //                         color: Colors.white,
                                                  //                         child: ElevatedButton(
                                                  //                           style: ElevatedButton.styleFrom(
                                                  //                             primary: Colors.red,
                                                  //                           ),
                                                  //                           onPressed: () async{
                                                  //                             Navigator.push(
                                                  //                                 context,
                                                  //                                 MaterialPageRoute(builder: (context) {
                                                  //                                   return OrderConfirmation();
                                                  //                                 })
                                                  //                             );
                                                  //                           },
                                                  //                           child: Text('Confirm',style: TextStyle(fontWeight: FontWeight.normal,fontSize: 16)),
                                                  //                         ),
                                                  //                       ),
                                                  //                     ),
                                                  //                   ],
                                                  //                 ),
                                                  //               ),
                                                  //
                                                  //             ],
                                                  //           ),
                                                  //         ),
                                                  //       ),
                                                  //       );
                                                  //     }
                                                  // );
                                                },
                                                child: Padding(
                                                  padding: const EdgeInsets.only(right: 10,left: 15),
                                                  child: Container(
                                                    height: 160,
                                                    width: 300,
                                                    child: Card(
                                                      child: Column(
                                                        children: [
                                                          Image.asset('assets/images/coo.jpg',height: 100,width: 100,),
                                                          Text('Home Pickup'),
                                                          Text('৳80'),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              // GestureDetector(
                                              //   onTap: (){
                                              //     showModalBottomSheet(
                                              //         isScrollControlled: false,
                                              //         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
                                              //         isDismissible: false,
                                              //         enableDrag: false,
                                              //         context: context,
                                              //         builder: (BuildContext context){
                                              //           return Padding(
                                              //             padding: EdgeInsets.only(
                                              //               left: 10,right: 8,
                                              //               top: 10,
                                              //               bottom: MediaQuery.of(context).viewInsets.bottom + 0.5,),
                                              //             child: Container(
                                              //               height: 200,
                                              //               child: Padding(
                                              //                 padding: const EdgeInsets.all(8.0),
                                              //                 child: Column(
                                              //                   crossAxisAlignment: CrossAxisAlignment.start,
                                              //                   children: [
                                              //                     Text('Courier Method Confirmation',style: TextStyle(fontSize: 22,),),
                                              //                     SizedBox(height: 15,),
                                              //                     Text('You have chosen the "Kiosk Drop" as your courier method.',style: TextStyle(fontSize: 15,),),
                                              //                     SizedBox(height: 15,),
                                              //                     Divider(),
                                              //                     Padding(
                                              //                       padding: const EdgeInsets.all(8.0),
                                              //                       child: Row(
                                              //                         children: [
                                              //                           Padding(
                                              //                             padding: const EdgeInsets.all(6.0),
                                              //                             child: Container(
                                              //                               height: 45,width: 140,
                                              //                               color: Colors.white,
                                              //                               child: ElevatedButton(
                                              //                                 style: ElevatedButton.styleFrom(
                                              //                                   primary: Colors.grey.shade100,
                                              //                                 ),
                                              //                                 onPressed: (){
                                              //                                   Navigator.pop(context);
                                              //
                                              //                                 },
                                              //                                 child: Text('Cancel',style: TextStyle(fontWeight: FontWeight.normal,fontSize: 16,color: Colors.black54)),
                                              //                               ),
                                              //                             ),
                                              //                           ),
                                              //                           Padding(
                                              //                             padding: const EdgeInsets.all(6.0),
                                              //                             child: Container(
                                              //                               height: 45,width: 140,
                                              //                               color: Colors.white,
                                              //                               child: ElevatedButton(
                                              //                                 style: ElevatedButton.styleFrom(
                                              //                                   primary: Colors.red,
                                              //                                 ),
                                              //                                 onPressed: () async{
                                              //                                   Navigator.push(
                                              //                                       context,
                                              //                                       MaterialPageRoute(builder: (context) {
                                              //                                         return OrderConfirmationKioskDrop();
                                              //                                       })
                                              //                                   );
                                              //                                 },
                                              //                                 child: Text('Confirm',style: TextStyle(fontWeight: FontWeight.normal,fontSize: 16)),
                                              //                               ),
                                              //                             ),
                                              //                           ),
                                              //                         ],
                                              //                       ),
                                              //                     ),
                                              //
                                              //                   ],
                                              //                 ),
                                              //               ),
                                              //             ),
                                              //           );
                                              //         }
                                              //     );
                                              //   },
                                              //   child: Container(
                                              //     height: 160,width: 160,
                                              //     child: Card(
                                              //       child: Column(
                                              //         children: [
                                              //           Image.asset('assets/images/co.jpg',height: 100,width: 100,),
                                              //           Text('Kiosk Drop'),
                                              //           Text('৳70'),
                                              //         ],
                                              //       ),
                                              //     ),
                                              //   ),
                                              // ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }
                        );

                      },
                      child: Text('Confirm',style: TextStyle(fontWeight: FontWeight.normal,fontSize: 16)),
                    ),
                  ),
                  Spacer(),
                  Container(
                    height: 45,width: 50,
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
