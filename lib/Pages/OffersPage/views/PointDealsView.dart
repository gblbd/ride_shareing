import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PointDealsView extends StatefulWidget {
  const PointDealsView({Key? key}) : super(key: key);

  @override
  State<PointDealsView> createState() => _PointDealsViewState();
}

class _PointDealsViewState extends State<PointDealsView> {
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
                  Image.asset('assets/images/fire.png',height: 30,width: 30,),
                  Text('Point Deals',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,),),
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
                  title: Text('BRONZE BUNDLE DEAL ON BIKE & CAR',style: TextStyle(fontSize: 14,color: Colors.red),),
                  subtitle: Row(
                    children: [
                      Text('Valid till February 14, 2023',),Spacer(),
                      Text('550 Points',style: TextStyle(color: Colors.red),),
                    ],
                  ),
                ),
              ),
              Card(
                color: Colors.white,
                child: ListTile(
                  title: Text('BRONZE BUNDLE DEAL ON BIKE & CAR',style: TextStyle(fontSize: 14,color: Colors.red),),
                  subtitle: Row(
                    children: [
                      Text('Valid till February 14, 2023',),Spacer(),
                      Text('550 Points',style: TextStyle(color: Colors.red),),
                    ],
                  ),
                ),
              ),
              Card(
                color: Colors.white,
                child: ListTile(
                  title: Text('BRONZE BUNDLE DEAL ON BIKE & CAR',style: TextStyle(fontSize: 14,color: Colors.red),),
                  subtitle: Row(
                    children: [
                      Text('Valid till February 14, 2023',),Spacer(),
                      Text('550 Points',style: TextStyle(color: Colors.red),),
                    ],
                  ),
                ),
              ),
              Card(
                color: Colors.white,
                child: ListTile(
                  title: Text('BRONZE BUNDLE DEAL ON BIKE & CAR',style: TextStyle(fontSize: 14,color: Colors.red),),
                  subtitle: Row(
                    children: [
                      Text('Valid till February 14, 2023',),Spacer(),
                      Text('550 Points',style: TextStyle(color: Colors.red),),
                    ],
                  ),
                ),
              ),


            ],
          ),
        )
    );
  }
}
