import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../HomePage/Courier/CourierHistory.dart';
import 'BikeOrders.dart';
import 'CarOrderPage.dart';
import 'CourierOrderPage.dart';
import 'OngoingOrderPage.dart';

class OrdersScreen extends StatefulWidget {
  final String phoneNumber;
  const OrdersScreen({Key? key,required this.phoneNumber}) : super(key: key);

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        appBar: AppBar(
          titleSpacing: 36,

          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 0.0,
          toolbarHeight: 50,
          title: Text('Courier Orders',style: TextStyle(color: Colors.black),),
          // bottom: TabBar(
          //   labelColor: Colors.red,
          //   unselectedLabelColor: Colors.grey,
          //   indicatorColor: Colors.transparent,
          //   isScrollable: true,
          //   tabs: [
          //     Tab(text: 'Ongoing Order',),
          //     Tab(text: 'Bike',),
          //     Tab(text: 'Car',),
          //     Tab(text: 'Courier',),
          //   ],
          //
          // ),
        ),
        body: TabBarView(
          children: [
            //OngoingOrderPage(),
            CourierHistoryPage(senderPhoneNumber: widget.phoneNumber,

            ),
            // BikeOrderPage(),
            // CarOrderPage(),
            // CourierOrderPage()
          ],
        ),
      ),
    );
  }
}
