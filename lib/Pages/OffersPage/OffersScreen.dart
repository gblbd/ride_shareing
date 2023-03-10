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
        toolbarHeight: 90,
        backgroundColor: Colors.white,
        title: const Text('Offers',style: TextStyle(color: Colors.black,fontSize: 22)),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(10.0),
            child:TabBar(
            //  padding: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
              isScrollable: true,
              tabs: [
                Tab(

                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        minimumSize: const Size(80,30),
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(14))
                        )
                    ),
                    onPressed: () {  },
                    child: const Text("Available Promos",style: TextStyle(color: Colors.black45),),
            ),
                ),
                Tab(
                  child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        minimumSize: const Size(80,30),
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(14))
                        )
                      ),
                      onPressed: (){},
                      child: const Text("Point Deals",style: TextStyle(color: Colors.black45))),
                ),
                Tab(
                  child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          minimumSize: const Size(80,30),
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(14))
                          )
                      ),
                      onPressed: (){},
                      child: const Text("Ongoing Offers",style: TextStyle(color: Colors.black45))),
                ),
              ],
            ),
          ),
      ),
        body: const TabBarView(
          children: <Widget>[
            AvailablePromosView(),
            PointDealsView(),
            OngoingOffersView()
          ],
        ),
     ),
    );
  }
}
