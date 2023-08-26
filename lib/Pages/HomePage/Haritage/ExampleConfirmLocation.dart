

import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ride_sharing/Pages/HomePage/Haritage/estimation_page.dart';

class ExampleConfirmLocation extends StatefulWidget{
  final List<dynamic>selectedItem;
  final double Rate;
  ExampleConfirmLocation({super.key, required this.selectedItem, required this.Rate, });
  @override
  State<ExampleConfirmLocation> createState() => _ExampleConfirmLocationState();
}

class _ExampleConfirmLocationState extends State<ExampleConfirmLocation> {
 final Set<Marker>markers=new Set();
 final Set<Polyline>polylines=new Set();
 List<LatLng> polyCordinates=[];

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    getpolyline();
  }
 Future<void> getpolyline() async {
   for (int i = 0; i <= widget.selectedItem.length - 1; i++) {
     final LatLng start = LatLng(
         widget.selectedItem[i]['lat'], widget.selectedItem[i]['long']);
     final LatLng end = LatLng(widget.selectedItem[i + 1]['lat'],
         widget.selectedItem[i + 1]['long']);
     PolylinePoints polylinePoints = PolylinePoints();

     PolylineResult result = await polylinePoints
         .getRouteBetweenCoordinates(
         "AIzaSyBsPxSFf2or6oZnbq7urgrxlakTiVqTmjQ",
         PointLatLng(start.latitude, start.longitude),
         PointLatLng(end.latitude, end.longitude));
     if (result.points.isNotEmpty) {
       result.points.forEach((location) {
         polyCordinates.add(LatLng(location.latitude, location.longitude));
       });
     }
     polylines.add(Polyline(
         points: polyCordinates,
         color: Colors.purple,
         width: 3,
         polylineId: PolylineId(widget.selectedItem[i]['Name'])
     ));
     setState(() {});
   }
 }




 @override
  Widget build(BuildContext context) {

    LatLng SourceLocation=LatLng(widget.selectedItem[0]['lat'],widget.selectedItem[0]["long"]);
    for(int i=0;i<widget.selectedItem.length;i++){
      final LatLng point=LatLng(widget.selectedItem[i]['lat'], widget.selectedItem[i]['long']);
      markers.add(Marker(
          markerId: MarkerId(i.toString()),
          position: point,
          infoWindow: InfoWindow(
              title: widget.selectedItem[i]['Name'],
              snippet: 'Custom Subtitle'
          ),
          icon: BitmapDescriptor.defaultMarker
      ));
    }


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade100,
        title: Text('Tour Place on Map',style: TextStyle(color: Colors.black)),
        iconTheme: IconThemeData(color: Colors.black),

      ),
      body: Stack(
        children: [
          GoogleMap(
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            initialCameraPosition: CameraPosition(target: SourceLocation,//LatLng(currentLocation.latitude!,currentLocation.longitude!),
                zoom: 14.5),
            markers: markers,
            polylines: polylines,


          ),





        ]
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



