import 'package:flutter/material.dart';

import 'KioskOrderConfirmationPage.dart';

class OrderConfirmationKioskDrop extends StatefulWidget {
  const OrderConfirmationKioskDrop({Key? key}) : super(key: key);

  @override
  State<OrderConfirmationKioskDrop> createState() => _OrderConfirmationKioskDropState();
}

class _OrderConfirmationKioskDropState extends State<OrderConfirmationKioskDrop> {


  static final _search =TextEditingController();
  int _value = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        backgroundColor: Colors.white,
        title: Text('Kiosks near you',style: TextStyle(color: Colors.black),),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          GestureDetector(
            onTap: (){},
            child:  Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Icon(Icons.location_on,color: Colors.grey,size: 14,),
                  SizedBox(width: 5,),
                  Text('29, Shah Magdum Avenue, Sector 12',style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal,color: Colors.grey),),
                  Spacer(),
                  Icon(Icons.arrow_forward_ios_sharp,size: 15,color: Colors.grey.shade400,)
                ],
              ),
            ),
          ),
          Divider(thickness: 9,color: Colors.blueGrey.shade50,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 50,width: 330,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey,width: 0.1),
                borderRadius: BorderRadius.circular(6.0),
                color: Colors.white,
              ),
              child: TextField(
                controller: _search,
                cursorColor: Colors.red.shade900,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search Kiosk',
                  hintStyle: TextStyle(fontSize: 14,color: Colors.grey),
                  prefixIcon: Icon(Icons.search,color: Colors.red.shade600,),
                ),
              ),
            ),
          ),
          Container(
           // height: 400,
            width: 342,
            child: Column(
          children: [
          for (int i = 1; i <= 5; i++)
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: ListTile(
                  title: Text("Anis Telecom(KIOSK)",
                    style: Theme.of(context).textTheme.subtitle1?.copyWith(color: i == 5 ? Colors.black38 : Colors.black),
                  ),
                  subtitle: Row(
                    children: [
                      Icon(Icons.location_on,size: 14,color: Colors.grey,),
                      Text("House-02,Road-09,Sector-13,Uttara,\nDhaka"),
                    ],
                  ),
                  leading: Container(
                    height: 30,width: 20,
                    child: Radio(
                      value: i,
                      groupValue: _value,
                      onChanged: i == 5 ? null : (int? value) {
                        setState(() {
                          _value = value!;
                        });
                      },
                    ),
                  ),
                ),
              ),
              Divider(),
            ],
          ),
        ],
      ),

    ),

        ],
      ),
      bottomNavigationBar:  Padding(
        padding: const EdgeInsets.all(12),
        child: Container(
          height: 45,width: 320,
          color: Colors.white,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Color(0xFFF59191),
            ),
            onPressed: () async{
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return KioskOrderConfirmationPage();
                  })
              );
            },
            child: Text('Submit',style: TextStyle(fontWeight: FontWeight.normal,fontSize: 16)),
          ),
        ),
      ),
    );
  }
}
