// import 'package:flutter/material.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:geolocator/geolocator.dart';
//
// class LocationPage extends StatefulWidget {
//   const LocationPage({Key? key}) : super(key: key);
//
//   @override
//   State<LocationPage> createState() => _LocationPageState();
// }
//
// class _LocationPageState extends State<LocationPage> {
//   String? _currentAddress;
//   Position? _currentPosition;
//
//   Future<bool> _handleLocationPermission() async {
//     bool serviceEnabled;
//     LocationPermission permission;
//
//     serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//           content: Text(
//               'Location services are disabled. Please enable the services')));
//       return false;
//     }
//     permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(content: Text('Location permissions are denied')));
//         return false;
//       }
//     }
//     if (permission == LocationPermission.deniedForever) {
//       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//           content: Text(
//               'Location permissions are permanently denied, we cannot request permissions.')));
//       return false;
//     }
//     return true;
//   }
//
//   Future<void> _getCurrentPosition() async {
//     final hasPermission = await _handleLocationPermission();
//
//     if (!hasPermission) return;
//     await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
//         .then((Position position) {
//       setState(() => _currentPosition = position);
//       _getAddressFromLatLng(_currentPosition!);
//     }).catchError((e) {
//       debugPrint(e);
//     });
//   }
//
//   Future<void> _getAddressFromLatLng(Position position) async {
//     await placemarkFromCoordinates(
//         _currentPosition!.latitude, _currentPosition!.longitude)
//         .then((List<Placemark> placemarks) {
//       Placemark place = placemarks[0];
//       setState(() {
//         _currentAddress =
//         '${place.street},, ${place.subAdministrativeArea}, ${place.postalCode}';
//       });
//     }).catchError((e) {
//       debugPrint(e);
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Location Page")),
//       body: SafeArea(
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text('LAT: ${_currentPosition?.latitude ?? ""}'),
//               Text('LNG: ${_currentPosition?.longitude ?? ""}'),
//               Text('ADDRESS: ${_currentAddress ?? ""}'),
//               const SizedBox(height: 32),
//               ElevatedButton(
//                 onPressed: _getCurrentPosition,
//                 child: const Text("Get Current Location"),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }










import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class MyMapWidget extends StatefulWidget {
  @override
  _MyMapWidgetState createState() => _MyMapWidgetState();
}

class _MyMapWidgetState extends State<MyMapWidget> {
  late GoogleMapController mapController;
  late LatLng _center=LatLng(23.8103, 90.4125) ;
  late String _currentAddress;

  @override
  void initState() {
    super.initState();
    _getLocation();
  }

  // void _getLocation() async {
  //   Position position = await Geolocator.getCurrentPosition(
  //       desiredAccuracy: LocationAccuracy.high);
  //   setState(() {
  //     _center = LatLng(position.latitude, position.longitude);
  //   });
  // }
  void _getLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      _center = LatLng(position.latitude, position.longitude);
      _getAddressFromLatLng();
    });
  }

  void _getAddressFromLatLng() async {
    try {
      List<Placemark> placemarks =
      await placemarkFromCoordinates(_center.latitude, _center.longitude);

      Placemark place = placemarks[0];

      setState(() {
        _currentAddress =
        "${place.name}, ${place.locality}, ${place.postalCode}, ${place.country}";
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Map Widget'),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(8.0),
              child: Text(
                _currentAddress ?? 'Loading...',
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            Expanded(
              child: GoogleMap(
                onMapCreated: (GoogleMapController controller) {
                  mapController = controller;
                },
                initialCameraPosition: CameraPosition(
                  target: _center,
                  zoom: 14.0,
                ),
                markers: Set<Marker>.of([
                  Marker(
                    markerId: MarkerId('current_location'),
                    position: _center,
                    infoWindow: InfoWindow(
                      title: 'Current Location',
                    ),
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:geocoding/geocoding.dart';
//
// class MapScreen extends StatefulWidget {
//   @override
//   _MapScreenState createState() => _MapScreenState();
// }
//
// class _MapScreenState extends State<MapScreen> {
//   late GoogleMapController mapController;
//   LatLng currentLocation = LatLng(23.8103, 90.4125);
//   String currentAddress = '';
//
//   void _onMapCreated(GoogleMapController controller) {
//     mapController = controller;
//   }
//
//   void _onCameraMove(CameraPosition position) {
//     currentLocation = position.target;
//   }
//
//   void _onCameraIdle() async {
//     List<Placemark> placemarks = await placemarkFromCoordinates(currentLocation.latitude, currentLocation.longitude);
//     if (placemarks != null && placemarks.isNotEmpty) {
//       Placemark placemark = placemarks.first;
//       setState(() {
//         //currentAddress = '${placemark.street},${placemark.name},${placemark.subLocality}, ${placemark.locality}, ${placemark.administrativeArea}';
//         currentAddress = placemark.street.toString();
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           GoogleMap(
//             onMapCreated: _onMapCreated,
//             onCameraMove: _onCameraMove,
//             onCameraIdle: _onCameraIdle,
//             initialCameraPosition: CameraPosition(
//               target: LatLng(23.8759, 90.3838),
//               zoom: 12,
//             ),
//           ),
//           Positioned(
//             bottom: 16,
//             left: 16,
//             right: 16,
//             child: Container(
//               padding: EdgeInsets.all(16),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(16),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.grey.withOpacity(0.3),
//                     blurRadius: 6,
//                     offset: Offset(0, 3),
//                   ),
//                 ],
//               ),
//               child: Text(
//                 currentAddress,
//                 style: TextStyle(fontSize: 16),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
