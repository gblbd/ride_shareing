import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
class SaveAddressPage extends StatefulWidget {
  const SaveAddressPage({Key? key}) : super(key: key);

  @override
  State<SaveAddressPage> createState() => _SaveAddressPageState();
}

class _SaveAddressPageState extends State<SaveAddressPage> {



  static final _address =TextEditingController();
  static final _flat =TextEditingController();

 bool onClick=false;


 void _toggleContainerVisibility(){
   setState(() {
     onClick=true;
   });
 }
 void _hideContainer(){
   setState(() {
     onClick=false;
   });
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Text('Save Address',style: TextStyle(color: Colors.black),),
        iconTheme: const IconThemeData(color: Colors.black),

      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView( 
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Divider(),
            Padding(
               padding: const EdgeInsets.all(8.0),
               child: Container(
                 height: 60,width: 322,
                 margin: const EdgeInsets.all(8),
                 decoration: BoxDecoration(
                     border: Border.all(color: Colors.grey.shade400,width: 1),
                     borderRadius: BorderRadius.circular(10.0),
                     color: Colors.white
                 ),
                 child: ListTile(
                   leading: CircleAvatar(
                     backgroundColor: Colors.grey.shade50,
                     child: Icon(Icons.location_on,color: Colors.grey,),
                   ),
                   title: Text('29,Shah Magdum Avenue,\nSector 12',style: TextStyle(fontSize: 14),),
                   trailing: Icon(Icons.arrow_forward_ios_sharp),
                   onTap: (){},
                 ),
               ),
             ),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Container(
                child: Text('Save address as',style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.grey.shade50  ,
                          child: TextButton(
                            onPressed: _hideContainer,
                            child: Icon(Icons.home,color:  Colors.grey.shade700 ),
                          ),
                        ),
                        Text('Home')
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundColor:  Colors.grey.shade50 ,

                          child: TextButton(
                            onPressed: _hideContainer,
                            child: Icon(Icons.medical_services,color:  Colors.grey.shade700 ),
                          ),
                        ),
                        Text('Work')
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.grey.shade50,

                          child: TextButton(
                            style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.resolveWith<Color>(
                                    (Set<MaterialState> states) {
                                  if (states.contains(MaterialState.selected)) {
                                    return Colors.black;
                                  } else {
                                    return Colors.grey;
                                  }
                                },
                              ),
                            ),
                            onPressed: _hideContainer,

                            child: Icon(Icons.apartment,color: Colors.grey.shade700,),
                          ),
                        ),
                        Text('Campus')

                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.grey.shade50,

                          child: TextButton(
                            style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.resolveWith<Color?>(
                                    (Set<MaterialState> states) {
                                  if (states.contains(MaterialState.pressed)) {
                                    return Colors.black;
                                  } else {
                                    return Colors.grey;
                                  }
                                },
                              ),
                            ),
                            onPressed: _toggleContainerVisibility,
                            child: Icon(Icons.star_rounded,color: Colors.grey.shade700,),
                          ),
                        ),
                        Text('Other')

                      ],
                    ),
                  ),

                ],
              ),
            ),

             Padding(
              padding: const EdgeInsets.all(8.0),
              child: onClick ? Container(
                height: 60,width: 322,
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade400,width: 1),
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white
                ),
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: TextField(
                    controller: _address,
                    cursorColor: Colors.red.shade900,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Address Name',
                      hintStyle: TextStyle(fontSize: 14,color: Colors.grey),
                    ),
                  ),
                ),
              ) : null,
            ),


            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Additional Info',style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
                    Text('Only used for Parcel Delivery',style: TextStyle(color: Colors.grey.shade400,fontSize: 14,fontWeight: FontWeight.normal),),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 60,width: 322,
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade400,width: 1),
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: TextField(
                        controller: _flat,
                        cursorColor: Colors.red.shade900,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Flat/Road No',
                          hintStyle: TextStyle(fontSize: 14,color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 9),
                    child: Text('e.g. Level 8, House 68',style: TextStyle(fontSize: 14,color: Colors.grey),),
                  )
                ],
              ),
            ),



          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 45,width: 150,
                color: Colors.white,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey.shade100,
                  ),
                  onPressed: (){
                    Navigator.pop(context);

                  },
                  child: Text('Cancel',style: TextStyle(fontWeight: FontWeight.normal,fontSize: 16,color: Colors.black54)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 45,width: 150,
                color: Colors.white,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFF59191),
                  ),
                  onPressed: () async{
                    CircularProgressIndicator();
                    Fluttertoast.showToast(
                        msg: "Address saved successfully.",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 10,
                        backgroundColor: Colors.red.shade100,
                        textColor: Colors.black,
                        fontSize: 16.0
                    );
                  },
                  child: Text('Save',style: TextStyle(fontWeight: FontWeight.normal,fontSize: 16)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
