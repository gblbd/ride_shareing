import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AvailablePromosView extends StatefulWidget {
  const AvailablePromosView({Key? key}) : super(key: key);

  @override
  State<AvailablePromosView> createState() => _AvailablePromosViewState();
}

class _AvailablePromosViewState extends State<AvailablePromosView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 12,horizontal: 12),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/box.png',height: 42,width: 42,),
                Text('Available Promos',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,),),
                Spacer(),
                GestureDetector(
                  onTap: (){},
                  child: Text('See All >',style: TextStyle(fontSize: 14,color: Colors.red,fontWeight: FontWeight.w500),),
                )
              ],
            ),
            Card(
              color: Colors.white,
              child: ListTile(
                title: Row(
                  children: [
                    Text('DAWAT',style: TextStyle(fontSize: 18),),
                    Spacer(),
                    Text('Food',style: TextStyle(fontSize: 14,color: Colors.red))
                  ],
                ),
                subtitle: Text('About available promos\nAbout date\nAdd Promo',
                ),
              ),
            ),
            Card(
              color: Colors.white,
              child: ListTile(
                title: Row(
                  children: [
                    Text('PASTA80',style: TextStyle(fontSize: 18),),
                    Spacer(),
                    Text('Food',style: TextStyle(fontSize: 14,color: Colors.red))
                  ],
                ),
                subtitle: Text('About available promos\nAbout date\nAdd Promo',
                ),
              ),
            ),
            Card(
              color: Colors.white,
              child: ListTile(
                title: Row(
                  children: [
                    Text('PASTA80',style: TextStyle(fontSize: 18),),
                    Spacer(),
                    Text('Food',style: TextStyle(fontSize: 14,color: Colors.red))
                  ],
                ),
                subtitle: Text('About available promos\nAbout date\nAdd Promo',
                ),
              ),
            ),
            Card(
              color: Colors.white,
              child: ListTile(
                title: Row(
                  children: [
                    Text('PASTA80',style: TextStyle(fontSize: 18),),
                    Spacer(),
                    Text('Food',style: TextStyle(fontSize: 14,color: Colors.red))
                  ],
                ),
                subtitle: Text('About available promos\nAbout date\nAdd Promo',
                ),
              ),
            ),
            Card(
              color: Colors.white,
              child: ListTile(
                title: Row(
                  children: [
                    Text('PASTA80',style: TextStyle(fontSize: 18),),
                    Spacer(),
                    Text('Food',style: TextStyle(fontSize: 14,color: Colors.red))
                  ],
                ),
                subtitle: Text('About available promos\nAbout date\nAdd Promo',
                ),
              ),
            ),

          ],
        ),
      )
    );
  }
}
