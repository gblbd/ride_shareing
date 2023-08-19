


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ride_sharing/Pages/HomePage/Haritage/estimation_page.dart';

class ConfirmLocation extends StatelessWidget{


  final List<dynamic>selectedItem;
  final double Rate;
   ConfirmLocation({super.key, required this.selectedItem, required this.Rate});

  final Set<Marker> markers = new Set();









  @override
  Widget build(BuildContext context) {


    LatLng SourceLocation=LatLng(selectedItem[0]['lat'],selectedItem[0]["long"]);


    for(int i=0;i<selectedItem.length;i++){
      markers.add(Marker( //add first marker
        markerId: MarkerId(selectedItem[i]['Name']),
        position: LatLng(selectedItem[i]['lat'],selectedItem[i]["long"]), //position of marker
        infoWindow: InfoWindow( //popup info
          title: 'My Custom Title ',
          snippet: 'My Custom Subtitle',
        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));
    }






    // markers.add(Marker( //add first marker
    //   markerId: MarkerId(selectedItem[1]['Name']),
    //   position: LatLng(selectedItem[1]['lat'],selectedItem[1]["long"]), //position of marker
    //   infoWindow: InfoWindow( //popup info
    //     title: 'My Custom Title ',
    //     snippet: 'My Custom Subtitle',
    //   ),
    //   icon: BitmapDescriptor.defaultMarker, //Icon for Marker
    // ));





    // TODO: implement build
    return Scaffold(
      body: Stack(
        children: [
          // ListView.builder(
          //   shrinkWrap: true,
          //     itemCount: selectedItem.length,
          //     itemBuilder: (context,index){
          //
          //   return Text("${selectedItem[index]["Name"]}");
          //
          // }),


          GoogleMap(
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            initialCameraPosition: CameraPosition(target: SourceLocation,//LatLng(currentLocation.latitude!,currentLocation.longitude!),
                zoom: 14.5),
            markers: markers

            //polylines: PolylineSet,



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





        ],
      ),


      floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
      floatingActionButton: Container(
        margin: EdgeInsets.fromLTRB(0, 0, 0, 21),
        child: FloatingActionButton.extended(

          onPressed: (){

            Get.to(EstimationPage(
              selectedItem: selectedItem,
              rate: Rate,


            ),
                duration: Duration(milliseconds: 500), //duration of transitions, default 1 sec
                transition: Transition.rightToLeft );


          },
          label: Text("Proceed To estimation"),
          hoverElevation: 100,
          icon: Icon(Icons.event_note),
          splashColor: Colors.purple,

          backgroundColor: Colors.pink.shade500,
        ),
      ),



    );
  }
  
}