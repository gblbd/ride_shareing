import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Pages/HomePage/HomeScreen.dart';
import 'Pages/OffersPage/OffersScreen.dart';
import 'Pages/OrdersPage/OrdersScreen.dart';

class MainScreen extends StatefulWidget {


  final String phoneNumber;
  final String fullName;
  final String email;
  final String gender;
  final String dateOfBirth;
  final String pin;



   MainScreen({super.key, required this.phoneNumber, required this.fullName, required this.email, required this.gender, required this.dateOfBirth, required this.pin,});
  @override
  State<MainScreen> createState() => _MainScreenState();
}
class _MainScreenState extends State<MainScreen> {
  int _index=0;

  @override
  Widget build(BuildContext context) {
    List<Widget> pages=[

      HomeScreen(phoneNumber: widget.phoneNumber, fullname: widget.fullName, pin: widget.pin, email: widget.email, gender: widget.gender, dateOfBirth: widget.dateOfBirth,),
      OffersScreen(),
      OrdersScreen(phoneNumber: widget.phoneNumber,),
    ];
    return Scaffold(

      body: pages[_index],

      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 30),
        child: FloatingNavbar(
         // padding: const EdgeInsets.symmetric(horizontal: 4,vertical: 7),
        //  margin: const EdgeInsets.only(bottom: 24,right: 16,left: 16),
          margin: const EdgeInsets.all(8),
          backgroundColor: Colors.blueGrey.shade50,
          unselectedItemColor: Colors.black87,
          selectedItemColor: Colors.red,
          selectedBackgroundColor: Colors.red.shade50,
          borderRadius: 30,
          itemBorderRadius: 30,
          iconSize: 16,
          fontSize: 14,
          onTap: (val)=> setState(() {
            _index=val;
          }),
          currentIndex: _index,
          items: [
            FloatingNavbarItem(icon: Icons.home, title: 'Home'),
            FloatingNavbarItem(icon: Icons.percent, title: 'Offers',),
            FloatingNavbarItem(icon: Icons.article_outlined, title: 'Orders')
          ],
        ),
      ),

      // bottomNavigationBar: FloatingNavbar(
      //   padding: const EdgeInsets.symmetric(horizontal: 4,vertical: 7),
      //   margin: const EdgeInsets.only(bottom: 24,right: 16,left: 16),
      //   backgroundColor: Colors.white70,
      //   unselectedItemColor: Colors.black87,
      //   selectedItemColor: Colors.red,
      //   selectedBackgroundColor: Colors.red.shade50,
      //   borderRadius: 30,
      //   itemBorderRadius: 30,
      //   iconSize: 14,
      //   fontSize: 12,
      //   onTap: (val)=> setState(() {
      //     _index=val;
      //   }),
      //   currentIndex: _index,
      //   items: [
      //     FloatingNavbarItem(icon: Icons.home, title: 'Home'),
      //     FloatingNavbarItem(icon: Icons.percent, title: 'Offers',),
      //     FloatingNavbarItem(icon: Icons.article_outlined, title: 'Orders')
      //   ],
      // ),
    );
  }
}
