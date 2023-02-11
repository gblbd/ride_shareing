import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'SelectCityList.dart';

class GetQuotationPageView extends StatefulWidget {
  const GetQuotationPageView({Key? key}) : super(key: key);

  @override
  State<GetQuotationPageView> createState() => _GetQuotationPageViewState();
}

class _GetQuotationPageViewState extends State<GetQuotationPageView> {
  double _value = 0.5;
  double min=0.5;
  double max=5.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        title: Text('Get Quotation',style: TextStyle(color: Colors.black),),
      ),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16,),
          Padding(
              padding: EdgeInsets.only(left: 16,top: 14),
          child: Text('Pickup City',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.black)),
          ),
          Container(
            height: 50,
            width: 350,
            margin: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade400,width: 1.2),
              borderRadius: BorderRadius.circular(9.0),
            ),
            child: TextButton(
              onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return const SelectCityListPage();
                    })
                );
              },
              child:
              Row(
                children: const [
                  Text(' City',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w400,color: Colors.grey),),Spacer(),
                  // SizedBox(width: 80,),
                  Icon(Icons.arrow_forward_ios,size: 15,color: Color(0xFF3B3B3B),),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16,top: 14),
            child: Text('Destination City',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.black)),
          ),
          Container(
            height: 50,
            width: 350,
            margin: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade400,width: 1.2),
              borderRadius: BorderRadius.circular(9.0),
            ),
            child: TextButton(
              onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return const SelectCityListPage();
                    })
                );
              },
              child:
              Row(
                children: const [
                  Text(' City',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w400,color: Colors.grey),),Spacer(),
                  // SizedBox(width: 80,),
                  Icon(Icons.arrow_forward_ios,size: 15,color: Color(0xFF3B3B3B),),
                ],
              ),
            ),
          ),
          Divider(thickness: 9,color: Colors.blueGrey.shade50,),
          const Padding(
            padding: EdgeInsets.only(left: 16,top: 14),
            child: Text('Item Weight',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.black)),
          ),
          Container(
            width: 350,
            child: Slider(
              value: _value.toDouble(),
              autofocus: false,
              min: min,
              max: max,
              divisions: 10,
              activeColor: Colors.red,
              inactiveColor: Colors.grey.shade300,
              thumbColor: Colors.red,
              label: _value.toStringAsFixed(1),
              onChanged: (  value){
                setState(() {
                  _value = value.toDouble();
                });
              },
            ),
          ),
          Row(
            children: [
              SizedBox(width: 15,),
              Text('0.5 kg'),Spacer(),
              Text('5 kg'), SizedBox(width: 15,),
            ],
          ),
          SizedBox(height: 185,),
          Divider(),
          Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Container(
              height: 80,
              color: Colors.white,
              child: Center(
                child: SizedBox(height: 50,width: 320,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                    ),
                    onPressed: (){},
                    child: Text('Get Quotation',style: TextStyle(fontWeight: FontWeight.normal,fontSize: 16)),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
