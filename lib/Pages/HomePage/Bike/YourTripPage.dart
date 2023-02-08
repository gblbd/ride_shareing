import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class YourTripPage extends StatefulWidget {
  const YourTripPage({Key? key}) : super(key: key);

  @override
  State<YourTripPage> createState() => _YourTripPageState();
}

class _YourTripPageState extends State<YourTripPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 40,),
          Row(
            children: [
              TextButton(
                  style: TextButton.styleFrom(primary: Colors.white,),
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back,color: Colors.black,size: 20,)),
              Text('Your Trip',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
            ],
          ),
          SizedBox(height: 12,),
          Container(
            height: 50,width: 450,
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade200,width: 2),
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.white
            ),
            child: TextButton(
              onPressed: (){},
              child: Row(
                children: [
                  const SizedBox(width: 10,),
                  Icon(Icons.person,size: 20,color: Colors.grey.shade600,),
                  const SizedBox(width: 15,),
                  Text('Search Pickup',style: TextStyle(fontWeight: FontWeight.normal,fontSize: 16,color: Colors.grey.shade700)),
                ],
              ),
            ),

          ),
          Row(
            children: [
              Container(
                height: 50,width: 300,
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade400,width: 1.2),
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white
                ),
                child: TextButton(
                  onPressed: (){},
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(width: 10,),
                      Icon(Icons.circle,size: 16,color: Colors.orange.shade900,),
                      const SizedBox(width: 15,),
                      Text('Search Stop 1',style: TextStyle(fontWeight: FontWeight.normal,fontSize: 16,color: Colors.grey.shade700)),
                    ],
                  ),
                ),
              ),
              Container(
                height: 50,width: 30,
                child: TextButton(
                    onPressed: (){},
                    child: Icon(Icons.close,size: 22,color: Colors.grey.shade700),
                    // Text('X',style: TextStyle(fontWeight: FontWeight.normal,fontSize: 22,color: Colors.grey.shade700))
                  ),
              )
            ],
          ),
          SizedBox(height: 4,),
          Row(
            children: [
              Container(
                height: 50,width: 300,
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey,width: 1),
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white
                ),
                child: TextButton(
                  onPressed: (){},
                  child: Row(
                    children: [
                      SizedBox(width: 10,),
                      Icon(Icons.location_on,color: Colors.red,size: 19,), SizedBox(width: 10,),
                      Text("Search Destination",style: TextStyle(fontWeight: FontWeight.normal,fontSize: 16,color: Colors.grey.shade700),)
                    ],
                  ),
                ),
              ),SizedBox(width: 8,),
              GestureDetector(
                onTap: (){},
                child: Icon(Icons.add,size: 22,color: Colors.red,),
              )
            ],
          ),
          Container(
            height: 370,color: Colors.blueGrey.shade50,
            child: Center(
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.watch_later_outlined,size: 40,color: Colors.red,),SizedBox(height: 5,),
                  Text('Please Keep the stops under 5 mins',style: TextStyle(fontWeight: FontWeight.normal,fontSize: 16,color: Colors.black)),SizedBox(height: 5,),
                  Text('Please Keep each stop under 5 minutes as a courtesy to your driver. When you add or, change your destination your trip face will be updated.',
                      style: TextStyle(fontWeight: FontWeight.normal,fontSize: 12,color: Colors.black),textAlign: TextAlign.center,),
                ],
              ),
            ),
          ),
          Container(
            height: 60,color: Colors.blueGrey.shade50,
            child: Center(
              child: SizedBox(height: 45,width: 250,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFF59191),
                  ),
                  onPressed: (){},
                  child: Text('Done',style: TextStyle(fontWeight: FontWeight.normal,fontSize: 16)),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
