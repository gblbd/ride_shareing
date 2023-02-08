import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Pages/HomePage/HomeScreen.dart';
import 'Pages/OffersPage/OffersScreen.dart';
import 'Pages/OrdersPage/OrdersScreen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);
  @override
  State<MainScreen> createState() => _MainScreenState();
}
class _MainScreenState extends State<MainScreen> {
  int _index=0;
  List<Widget> pages=[
    OffersScreen(),
    HomeScreen(),
    OrdersScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_index],

      bottomNavigationBar: FloatingNavbar(
        padding: const EdgeInsets.symmetric(horizontal: 4,vertical: 7),
        margin: const EdgeInsets.only(bottom: 24,right: 16,left: 16),
        backgroundColor: Colors.white70,
        unselectedItemColor: Colors.black87,
        selectedItemColor: Colors.red,
        selectedBackgroundColor: Colors.red.shade50,
        borderRadius: 30,
        itemBorderRadius: 30,
        iconSize: 14,
        fontSize: 12,
        onTap: (val)=> setState(() {
          _index=val;
        }),
        currentIndex: _index,
        items: [
          FloatingNavbarItem(icon: Icons.percent, title: 'Offers',),
          FloatingNavbarItem(icon: Icons.home, title: 'Home'),
          FloatingNavbarItem(icon: Icons.article_outlined, title: 'Orders')
        ],
      ),
    );
  }
}
