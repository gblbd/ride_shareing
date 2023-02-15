import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'OrderDetailsPage.dart';

class PathaoCourierPage extends StatefulWidget {
  const PathaoCourierPage({Key? key}) : super(key: key);

  @override
  State<PathaoCourierPage> createState() => _PathaoCourierPageState();
}

class _PathaoCourierPageState extends State<PathaoCourierPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
               crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 30,),
                Row(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: 8,),
                    Container(
                      height: 40,width: 40,
                      child: TextButton(
                        onPressed: (){
                          Navigator.pop(context);
                        },
                        child: const Icon(Icons.arrow_back,color: Colors.black,size: 26,),
                      ),
                    ),
                    SizedBox(width: 70,),
                    Container(
                      height: 60,width: 220,
                        child: Row(
                          children: [
                            Image.asset('assets/images/My_Road_Logo.png',height: 60,width: 50,),
                            Image.asset('assets/images/courier_my_road.png',height: 20,width: 60,),
                          ],
                        )),
                  ]
                ),
                const Divider(),
                const SizedBox(height: 18,),
                Container(
                  height: 170,
                  width: 400,
                  //color: Colors.grey,
                  child: Image.asset('assets/images/Courier logo.png',fit: BoxFit.fill,),
                ),
                const SizedBox(height: 8,),
                const Text('Create Courier Order Instantly',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15),textAlign: TextAlign.center,),
                const SizedBox(height: 8,),
                const Text('   Order and get your product picked up from your doorstep',
                  style: TextStyle(fontWeight: FontWeight.normal,fontSize: 14,color: Colors.grey),
                  textAlign: TextAlign.center,),
                const SizedBox(height: 50,),
              ],
            ),
            const Text('    Where are you sending?',
              style: TextStyle(fontWeight: FontWeight.w500,fontSize: 21,color: Colors.black),),
            const SizedBox(height: 10,),
            Container(
              margin: const EdgeInsets.all(8),
              child: Center(
                child: Card(
                  child: TextButton(
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const OrderDetailsPage();
                          },
                        ),
                      );
                    },
                    child: ListTile(
                      leading: Image.asset('assets/images/order.png',),
                      title: const Text('Create Order',
                          style: TextStyle(color: Colors.black,fontSize: 16,)),
                      subtitle: const Text('Send anything you want',
                          style: TextStyle(color: Colors.grey,fontSize: 13,)),
                      trailing: const Icon(Icons.arrow_forward_ios_sharp,size: 14,),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
