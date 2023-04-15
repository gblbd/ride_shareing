import 'package:flutter/material.dart';
 class KioskOrderConfirmationPage extends StatelessWidget {
   const KioskOrderConfirmationPage({Key? key}) : super(key: key);

   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         elevation: 0.5,
         backgroundColor: Colors.white,
         title: Text('Order Confirmation',style: TextStyle(color: Colors.black),),
         iconTheme: const IconThemeData(color: Colors.black),
       ),
       backgroundColor: Colors.white,
       //body: ,
     );
   }
 }
