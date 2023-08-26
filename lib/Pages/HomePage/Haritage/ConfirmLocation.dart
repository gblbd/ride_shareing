


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ride_sharing/Pages/HomePage/Haritage/estimation_page.dart';

class ConfirmLocation extends StatefulWidget{


  final List<dynamic>selectedItem;
  final double Rate;
   ConfirmLocation({super.key, required this.selectedItem, required this.Rate});

  @override
  State<ConfirmLocation> createState() => _ConfirmLocationState();
}

class _ConfirmLocationState extends State<ConfirmLocation> {
  PolylinePoints polylinePoints = PolylinePoints();

  final Set<Marker> markers = new Set();

  //final Set<Polyline> polylines = new Set();
  List<LatLng> polylineCoordinates = [];

  Map<PolylineId, Polyline> polylines = {};

 String googleApiKey='AIzaSyBsPxSFf2or6oZnbq7urgrxlakTiVqTmjQ';





  @override
  Widget build(BuildContext context) {
    LatLng SourceLocation = LatLng(
        widget.selectedItem[0]['lat'], widget.selectedItem[0]["long"]);


    for (int i = 0; i < widget.selectedItem.length; i++) {
      markers.add(Marker( //add first marker
        markerId: MarkerId(widget.selectedItem[i]['Name']),
        position: LatLng(
            widget.selectedItem[i]['lat'], widget.selectedItem[i]["long"]),
        //position of marker
        infoWindow: InfoWindow( //popup info
          title: 'My Custom Title ',
          snippet: 'My Custom Subtitle',
        ),
        icon: BitmapDescriptor.defaultMarker,
          //Icon for Marker
      )
      );
// Future<void> getpolyline() async {
//   LatLng startPoint = LatLng(selectedItem[i]['lat'], selectedItem[i]["long"]);
//   LatLng endPoint = LatLng(selectedItem[i + 1]['lat'], selectedItem[i + 1]["long"]);
//   PolylinePoints polylinePoints=PolylinePoints();
//
//   PolylineResult result=await polylinePoints.getRouteBetweenCoordinates(
//       "AIzaSyBsPxSFf2or6oZnbq7urgrxlakTiVqTmjQ",
//       PointLatLng(startPoint.latitude, startPoint.longitude),
//       PointLatLng(endPoint.latitude, endPoint.longitude)
//       // PointLatLng(SourceLocation.latitude,SourceLocation.longitude),
//       // PointLatLng(DestinationLocation.latitude, DestinationLocation.longitude)
//       );
//   if (result.points.isNotEmpty) {
//     result.points.forEach((location) {
//       polyCordinates.add(LatLng(location.latitude, location.longitude));
//     });
//   }
//
//
//   polylines.add(
//       Polyline(
//           polylineId: PolylineId("1"),
//           points: [startPoint, endPoint],//polyCordinates,
//           width: 6,
//           color: Colors.red
//       )
//   );
//
//   // setState(() {
//   //
//   // });


// }


// LatLng startPoint = LatLng(selectedItem[i]['lat'], selectedItem[i]["long"]);
// LatLng endPoint = LatLng(selectedItem[i + 1]['lat'], selectedItem[i + 1]["long"]);
// polylines.add(Polyline(
//   polylineId: PolylineId(selectedItem[i]['Name']),
//   points: [startPoint, endPoint],
//   color: Colors.red, // Set the color of the polyline
//   width: 3, // Set the width of the polyline
// ));
/////////////////////////

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




    ///////////////////////////////////////////
    // int lastIndex = selectedItem.length - 1;
    // markers.add(Marker(
    //   markerId: MarkerId(selectedItem[lastIndex]['Name']),
    //   position: LatLng(selectedItem[lastIndex]['lat'], selectedItem[lastIndex]["long"]),
    //   infoWindow: InfoWindow(
    //     title: 'My Custom Title ',
    //     snippet: 'My Custom Subtitle',
    //   ),
    //   icon: BitmapDescriptor.defaultMarker,
    // ));




    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade100,
        title: Text('Tour Place on Map',style: TextStyle(color: Colors.black)),
        iconTheme: IconThemeData(color: Colors.black),

      ),
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
            markers: markers,

           //polylines: Set<Polyline>.of(polylines.values),



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
              selectedItem: widget.selectedItem,
              rate: widget.Rate,


            ),
                duration: Duration(milliseconds: 500), //duration of transitions, default 1 sec
                transition: Transition.rightToLeft );


          },
          label: Text("Proceed To estimation"),
          hoverElevation: 100,
          icon: Icon(Icons.event_note),
          splashColor: Colors.purple.shade200,

          backgroundColor: Colors.red.shade200,
        ),
      ),



    );
  }
}



// Future<void> getpolyline() async {
//   LatLng startPoint = LatLng(selectedItem[i]['lat'], selectedItem[i]["long"]);
//   LatLng endPoint = LatLng(selectedItem[i + 1]['lat'], selectedItem[i + 1]["long"]);
//   PolylinePoints polylinePoints=PolylinePoints();
//
//   PolylineResult result=await polylinePoints.getRouteBetweenCoordinates(
//       "AIzaSyBsPxSFf2or6oZnbq7urgrxlakTiVqTmjQ",
//       PointLatLng(startPoint.latitude, startPoint.longitude),
//       PointLatLng(endPoint.latitude, endPoint.longitude)
//       // PointLatLng(SourceLocation.latitude,SourceLocation.longitude),
//       // PointLatLng(DestinationLocation.latitude, DestinationLocation.longitude)
//       );
//   if (result.points.isNotEmpty) {
//     result.points.forEach((location) {
//       polyCordinates.add(LatLng(location.latitude, location.longitude));
//     });
//   }
//
//
//   polylines.add(
//       Polyline(
//           polylineId: PolylineId("1"),
//           points: [startPoint, endPoint],//polyCordinates,
//           width: 6,
//           color: Colors.red
//       )
//   );
//
//   // setState(() {
//   //
//   // });


// }


// LatLng startPoint = LatLng(selectedItem[i]['lat'], selectedItem[i]["long"]);
// LatLng endPoint = LatLng(selectedItem[i + 1]['lat'], selectedItem[i + 1]["long"]);
// polylines.add(Polyline(
//   polylineId: PolylineId(selectedItem[i]['Name']),
//   points: [startPoint, endPoint],
//   color: Colors.red, // Set the color of the polyline
//   width: 3, // Set the width of the polyline
// ));
