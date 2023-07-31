


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ConfirmLocation extends StatelessWidget{


  final List<dynamic>selectedItem;
   ConfirmLocation({super.key, required this.selectedItem});

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
    );
  }
  
}