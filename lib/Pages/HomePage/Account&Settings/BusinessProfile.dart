// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:flutter/material.dart';
//
// class OfferListCarousel extends StatefulWidget {
//   const OfferListCarousel({super.key});
//
//   @override
//   State<OfferListCarousel> createState() => _OfferListCarouselState();
// }
//
// class _OfferListCarouselState extends State<OfferListCarousel> {
//
//
//   // Future<DataSnapshot>fetchOfferList()async{
//   //   return await FirebaseDatabase.instance.ref().child('offer').child('bike').get();
//   // }
//
//   List<Offer>offers=[];
//
//   @override
//   void initState(){
//     super.initState();
//     FirebaseDatabase.instance.ref().child('offer').child('bike').onChildAdded.listen((event) {
//       setState(() {
//         offers.add(Offer.fromJson(event.snapshot.value));
//       });
//     }) ;
//
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Offers'),
//       ),
//       body: CarouselSlider(
//         options: CarouselOptions(
//           autoPlay: true,
//         ),
//         items: offers.map((offer) =>OfferCard(offer)).toList(),
//         ),
//     );
//
//   }
// }
// class Offer{
//   final String title;
//   final String coupon_code;
//   final String discountAmount;
//   Offer({required this.title,required this.coupon_code,required this.discountAmount});
//   factory Offer.fromJson(Map<String, dynamic>json){
//     return Offer(
//         title: json['title'],
//         coupon_code: json['coupon_code'],
//         discountAmount: json['discountAmount']
//     );
//   }
// }
// class OfferCard extends StatelessWidget {
//   final Offer offer;
//    OfferCard(this.offer);
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: Column(
//         children: [
//           Text(offer.title),
//           Text(offer.coupon_code),
//           Text(offer.discountAmount),
//
//         ],
//       ),
//     );
//   }
// }
//
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   runApp(MyApp());
// }
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final database = FirebaseDatabase.instance.reference();
  List<dynamic> items = [];
  @override
  void initState() {
    super.initState();
    database.child("offer").child("bike").onChildAdded.listen((event) {
      setState(() {
        items.add(event.snapshot.value);
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('offers'),
      ),
      body: Center(
        child: Container(
          child: CarouselSlider(
            options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                viewportFraction: 1.0,
                aspectRatio: 2.0),
            items: items.map((item) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(item['title'].toString()),
                            Text(item['coupon_code'].toString()),
                            Text(item['discountAmount'].toString()),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}