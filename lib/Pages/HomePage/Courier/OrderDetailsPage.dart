import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'GetQuotationPageView.dart';

class OrderDetailsPage extends StatefulWidget {
  const OrderDetailsPage({Key? key}) : super(key: key);

  @override
  State<OrderDetailsPage> createState() => _OrderDetailsPageState();
}

class _OrderDetailsPageState extends State<OrderDetailsPage> {
  static final _phone =TextEditingController();
  static final _name =TextEditingController();
  static final _address =TextEditingController();
 double _value = 0.5;
 double min=0.5;
 double max=5.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        title: Text('Courier Order Details',style: TextStyle(color: Colors.black),),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 60,
              child: TextButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const GetQuotationPageView();
                      },
                    ),
                  );
                },
                child: ListTile(
                  leading: CircleAvatar(
                      backgroundColor: Colors.blueGrey.shade50,
                      child: Icon(Icons.point_of_sale, size: 20,color: Colors.red,)
                  ),
                  title: Text('Get Quotation'),
                  trailing: const Icon(Icons.arrow_forward_ios_sharp,size: 14,),
                ),
              ),
            ),
            Divider(color: Colors.blueGrey.shade50,thickness: 4,),
            SizedBox(height: 5,),
            Text('    Receiver Details',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,),),
            //SizedBox(height: 3,),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                cursorColor: Colors.red,
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey, width: 1.0),),
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey, width: 1.0),),
                  labelText: 'Receivers Phone Number ',
                  labelStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.normal, color: Colors.grey
                  ),
                  suffixIcon: Icon(Icons.contact_phone_rounded,color: Colors.grey,size: 26,),
                ),
                controller: _phone,
                onSubmitted: (String value) {
                  debugPrint(value);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                cursorColor: Colors.red,
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey, width: 1.0),),
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey, width: 1.0),),
                  labelText: 'Receivers Name ',
                  labelStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.normal, color: Colors.grey
                  ),
                ),
                controller: _name,
                onSubmitted: (String value) {
                  debugPrint(value);
                },
              ),
            ),
            Divider(color: Colors.blueGrey.shade50,thickness: 4,),
            SizedBox(height: 5,),
            Text('    Delivery Address',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,),),
            Container(
              height: 58,width: 420,
              margin: EdgeInsets.all(16),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey,width: 1),
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.white
              ),
              child: TextButton(
                onPressed: (){},
                child: Row(
                  children: [
                    Text('City > Zone > Area',
                      style: TextStyle(fontWeight: FontWeight.normal,fontSize: 16,color: Colors.grey),
                      textAlign: TextAlign.start,),
                  ],
                ),
              ),

            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                cursorColor: Colors.red,
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey, width: 1.0),),
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey, width: 1.0),),
                  labelText: 'Enter full address',
                  labelStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.normal, color: Colors.grey
                  ),
                ),
                controller: _address,
                onSubmitted: (String value) {
                  debugPrint(value);
                },
              ),
            ),
            Divider(color: Colors.blueGrey.shade50,thickness: 4,),
            SizedBox(height: 5,),
            Text('    Courier Weight',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,),),
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
               label: '${_value.toStringAsFixed(1)}',
                // label: _value.round().toString(),
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
            Divider(thickness: 1,indent: 8,endIndent: 9,),
            TextButton(
                onPressed: (){},
                child: Row(
                  children: [
                    SizedBox(width: 7,),
                    Icon(Icons.add_circle_outline_sharp,size: 18,color: Colors.red,),SizedBox(width: 9,),
                    Text('Select Courier Type',style: TextStyle(fontWeight: FontWeight.normal,fontSize: 12,color: Colors.black)),Spacer(),
                    Text('Change Item Type',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 12,color: Colors.red)),SizedBox(width: 9,),
                  ],
                ),
            ),
            Divider(thickness: 1,indent: 8,endIndent: 9,),
            SizedBox(height: 8,),
            Center(
              child: SizedBox(height: 50,width: 320,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                  ),
                  onPressed: (){},
                  child: Text('Confirm',style: TextStyle(fontWeight: FontWeight.normal,fontSize: 16)),
                ),
              ),
            ),
            SizedBox(height: 15,),
          ],
        ),
      ),
    );
  }
}
