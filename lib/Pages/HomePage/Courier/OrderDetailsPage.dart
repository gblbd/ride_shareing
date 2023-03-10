import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'GetQuotationPageView.dart';
import 'SelectCityList.dart';

class OrderDetailsPage extends StatefulWidget {
  const OrderDetailsPage({Key? key}) : super(key: key);

  @override
  State<OrderDetailsPage> createState() => _OrderDetailsPageState();
}

class _OrderDetailsPageState extends State<OrderDetailsPage> {
  static final _phone =TextEditingController();
  static final _name =TextEditingController();
  static final _address =TextEditingController();
  static final _itemsValue =TextEditingController();
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
        title: const Text('Courier Order Details',style: TextStyle(color: Colors.black),),
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
                      child: const Icon(Icons.point_of_sale, size: 20,color: Colors.red,)
                  ),
                  title: const Text('Get Quotation'),
                  trailing: const Icon(Icons.arrow_forward_ios_sharp,size: 14,),
                ),
              ),
            ),
            Divider(color: Colors.blueGrey.shade50,thickness: 4,),
            const SizedBox(height: 5,),
            const Text('    Receiver Details',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,),),
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
                  suffixIcon: Icon(Icons.perm_contact_cal,color: Colors.grey,size: 26,),
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
            const SizedBox(height: 5,),
            const Text('    Delivery Address',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,),),
            Container(
              height: 58,width: 420,
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey,width: 1),
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.white
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
                child: Row(
                  children: const [
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
            const SizedBox(height: 5,),
            const Text('    Courier Weight',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,),),
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
                // label: _value.round().toString(),
                onChanged: (  value){
                  setState(() {
                    _value = value.toDouble();
                  });
                },
              ),
            ),
            Row(
              children: const [
                SizedBox(width: 15,),
                Text('0.5 kg'),Spacer(),
                Text('5 kg'), SizedBox(width: 15,),
              ],
            ),
            const Divider(thickness: 1,indent: 6,endIndent: 10,),
            TextButton(
                onPressed: (){
                  showModalBottomSheet(
                    isScrollControlled: false,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
                    isDismissible: false,
                    enableDrag: false,
                    context: context,
                    builder: (BuildContext context)
                    {
                      return Padding(
                        padding: EdgeInsets.only(
                          left: 6,
                          top: 10,
                          bottom: MediaQuery.of(context).viewInsets.bottom + 0.5,
                        ),
                        child: Container(
                          height: 230,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                               Padding(padding: const EdgeInsets.all(2.0),
                               child: Row(
                                 children: [
                                   const Text('Select Courier Type',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 22),),Spacer(),
                                   TextButton(
                                       onPressed: (){
                                         Navigator.pop(context);
                                       },
                                       child: const Icon(Icons.close,color: Colors.black,)),
                                 ],
                               ),
                               ),
                                TextButton(onPressed: () {
                                  showModalBottomSheet(
                                    isScrollControlled: true,
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
                                      context: context,
                                    builder: (BuildContext context){
                                      return Padding(
                                          padding: EdgeInsets.only(
                                            left: 6,
                                            top: 10,
                                            bottom: MediaQuery.of(context).viewInsets.bottom + 0.5,
                                          ),
                                        child: Container(
                                          height: 280,
                                          child: Column(
                                            children: [
                                              Padding(padding: const EdgeInsets.all(2.0),
                                                child: Row(
                                                  children: [
                                                    const Text('   Item Type',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 22),),Spacer(),
                                                    TextButton(
                                                        onPressed: (){
                                                          Navigator.pop(context);

                                                          // Navigator.push(
                                                          //   context,
                                                          //   MaterialPageRoute(
                                                          //     builder: (context) {
                                                          //       return const OrderDetailsPage();
                                                          //     },
                                                          //   ),
                                                          // );
                                                        },
                                                        child: const Icon(Icons.close,color: Colors.black,)),
                                                  ],
                                                ),
                                              ),
                                               Padding(
                                                   padding: EdgeInsets.all(2.0),
                                               child: TextButton(
                                                 onPressed: (){},
                                                 child: Container(
                                                   height: 60,width: 320,
                                                   decoration: BoxDecoration(
                                                     border: Border.all(color: Colors.grey.shade400,width: 1.2),
                                                     borderRadius: BorderRadius.circular(5.0),
                                                   ),
                                                   child: Row(
                                                     children: [
                                                       Column(
                                                         crossAxisAlignment: CrossAxisAlignment.start,
                                                         children: [
                                                           SizedBox(height: 9,),
                                                           Text('  Item Type',style: TextStyle(fontSize: 14,color: Colors.grey,fontWeight: FontWeight.normal),),
                                                           Text('  Parcel',style: TextStyle(fontSize: 17,color: Colors.black,fontWeight: FontWeight.normal),),
                                                         ],
                                                       ),
                                                       Spacer(),
                                                       Icon(Icons.arrow_forward_ios,size: 10,color: Colors.grey.shade600,),
                                                       SizedBox(width: 10,)
                                                     ],
                                                   ),
                                                 ),
                                               ),
                                               ),
                                              Padding(padding: EdgeInsets.all(16.0),
                                              child: TextField(
                                                  cursorColor: Colors.red,
                                                  decoration: const InputDecoration(
                                                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey, width: 1.0),),
                                                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey, width: 1.0),),
                                                    labelText: 'Items Value(Optional)',
                                                    labelStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.normal, color: Colors.grey
                                                    ),
                                                  ),
                                                  controller: _itemsValue,
                                                  onSubmitted: (String value) {
                                                    debugPrint(value);
                                                  },
                                              ),
                                              ),
                                              Center(
                                                child: SizedBox(height: 50,width: 320,
                                                  child: ElevatedButton(
                                                    style: ElevatedButton.styleFrom(
                                                      primary: Colors.red,
                                                    ),
                                                    onPressed: (){},
                                                    child: const Text('Confirm',style: TextStyle(fontWeight: FontWeight.normal,fontSize: 16)),
                                                  ),
                                                ),
                                              ),

                                            ],
                                          ),
                                        ),
                                      );

                                    }
                                  );
                                },
                                  child: ListTile(
                                    leading: CircleAvatar(
                                      radius: 15,
                                      backgroundColor: Colors.orange.shade800,
                                        child: const Icon(Icons.shopping_bag,size: 18,color: Colors.white,),
                                    ),
                                    title: const Text('Parcel',
                                      style: TextStyle(fontWeight: FontWeight.normal,fontSize: 16,),
                                    ),
                                    subtitle: const Text('Non-perishable goods, no fragile,no food items',
                                      style: TextStyle(fontWeight: FontWeight.normal,fontSize: 12,),
                                    ),
                                    trailing: Icon(Icons.arrow_forward_ios,color: Colors.grey.shade800,size: 16,),
                                  ),
                                ),
                                const Divider(indent: 6,endIndent: 10,),
                                TextButton(onPressed: () {  },
                                  child: ListTile(
                                    leading: CircleAvatar(
                                      radius: 15,
                                      backgroundColor: Colors.green.shade800,
                                      child: const Icon(Icons.my_library_books_sharp,size: 18,color: Colors.white,),
                                    ),
                                    title: const Text('Document',
                                      style: TextStyle(fontWeight: FontWeight.normal,fontSize: 16,),
                                    ),
                                    subtitle: const Text('No passport or bank cheques',
                                      style: TextStyle(fontWeight: FontWeight.normal,fontSize: 12,),
                                    ),
                                    trailing: Icon(Icons.arrow_forward_ios,color: Colors.grey.shade800,size: 16,),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
                child: Row(
                  children: const [
                    SizedBox(width: 7,),
                    Icon(Icons.add_circle_outline_sharp,size: 18,color: Colors.red,),SizedBox(width: 9,),
                    Text('Select Courier Type',style: TextStyle(fontWeight: FontWeight.normal,fontSize: 12,color: Colors.black)),Spacer(),
                    Text('Change Item Type',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 12,color: Colors.red)),SizedBox(width: 9,),
                  ],
                ),
            ),
            const Divider(thickness: 1,indent: 8,endIndent: 9,),
            const SizedBox(height: 8,),
            Center(
              child: SizedBox(height: 50,width: 320,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                  ),
                  onPressed: (){},
                  child: const Text('Confirm',style: TextStyle(fontWeight: FontWeight.normal,fontSize: 16)),
                ),
              ),
            ),
            const SizedBox(height: 15,),
          ],
        ),
      ),
    );
  }
}
