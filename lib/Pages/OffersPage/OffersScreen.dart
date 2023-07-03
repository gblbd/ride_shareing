import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ride_sharing/Pages/OffersPage/views/AvailablePromosView.dart';
import 'package:ride_sharing/Pages/OffersPage/views/OgoingOffersView.dart';
import 'package:ride_sharing/Pages/OffersPage/views/PointDealsView.dart';

class OffersScreen extends StatefulWidget {
  const OffersScreen({Key? key}) : super(key: key);

  @override
  State<OffersScreen> createState() => _OffersScreenState();
}
class _OffersScreenState extends State<OffersScreen> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
     length: 3,
      child: Scaffold(
        appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: Colors.white,
        title: const Text('Offers',style: TextStyle(color: Colors.black,fontSize: 22)),
          // bottom: PreferredSize(
          //   preferredSize: const Size.fromHeight(10.0),
          //   child:TabBar(
          //     indicator: BoxDecoration(
          //         borderRadius: BorderRadius.circular(50), // Creates border
          //         color: Colors.red),
          //     indicatorPadding: EdgeInsets.all(8.0),
          //     labelColor: Colors.white,
          //     unselectedLabelColor: Colors.grey,
          //     indicatorColor: Colors.transparent,
          //     isScrollable: true,
          //     tabs: [
          //       Tab(
          //         child: Padding(
          //           padding: const EdgeInsets.all(8.0),
          //           child: Container(
          //             decoration: BoxDecoration(
          //                 borderRadius: BorderRadius.circular(50),
          //                 border: Border.all(color: Colors.redAccent.shade400, width: 1)),
          //             child: Align(
          //               alignment: Alignment.center,
          //               child: Padding(
          //                 padding: const EdgeInsets.only(left: 10,right: 10),
          //                 child: Text("Available Promos"),
          //               ),
          //             ),
          //           ),
          //         ),
          //       ),
          //
          //       // Tab(
          //       //   child: Padding(
          //       //     padding: const EdgeInsets.all(8.0),
          //       //     child: Container(
          //       //       decoration: BoxDecoration(
          //       //           borderRadius: BorderRadius.circular(50),
          //       //           border: Border.all(color: Colors.redAccent.shade400, width: 1)),
          //       //       child: Align(
          //       //         alignment: Alignment.center,
          //       //         child: Padding(
          //       //           padding: const EdgeInsets.only(left: 10,right: 10),
          //       //           child: Text("Point Deals"),
          //       //         ),
          //       //       ),
          //       //     ),
          //       //   ),
          //       // ),
          //       // Tab(
          //       //   child: Padding(
          //       //     padding: const EdgeInsets.all(8.0),
          //       //     child: Container(
          //       //       decoration: BoxDecoration(
          //       //           borderRadius: BorderRadius.circular(50),
          //       //           border: Border.all(color: Colors.redAccent.shade400, width: 1)),
          //       //       child: Align(
          //       //         alignment: Alignment.center,
          //       //         child: Padding(
          //       //           padding: const EdgeInsets.only(left: 10,right: 10),
          //       //           child: Text("Ongoing Offers"),
          //       //         ),
          //       //       ),
          //       //     ),
          //       //   ),
          //       // ),
          //
          //     ],
          //   ),
          // ),
      ),
        body: const TabBarView(
          children: <Widget>[
            AvailablePromosView(),
            // PointDealsView(),
            // OngoingOffersView()
          ],
        ),
     ),
    );
  }
}
