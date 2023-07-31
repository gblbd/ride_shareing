


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ConfirmLocation extends StatelessWidget{

  static const LatLng SourceLocation=LatLng(23.708597,90.406058);
  static const LatLng DestinationLocation=LatLng(37.3342, -122.06672);

  final List<dynamic>selectedItem;
  const ConfirmLocation({super.key, required this.selectedItem});

  @override
  Widget build(BuildContext context) {
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
            markers: {
              Marker(
                  markerId: MarkerId("Source"),
                  position: SourceLocation//LatLng(currentLocation!.latitude!,currentLocation!.longitude!)
              ),
              // Marker(
              //     markerId: MarkerId("Destination"),
              //     position: DestinationLocation
              // )
            },

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
    );
  }
  
}