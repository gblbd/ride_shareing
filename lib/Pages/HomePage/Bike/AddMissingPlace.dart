import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'UpdateLocationPage.dart';

class AddMissingPlacePage extends StatefulWidget {
  const AddMissingPlacePage({Key? key}) : super(key: key);

  @override
  State<AddMissingPlacePage> createState() => _AddMissingPlacePageState();
}

class _AddMissingPlacePageState extends State<AddMissingPlacePage> {

  final categoryItems=['Accounting','Airport','Amusement Park','Apartment Building','Aquarium','Art Gallery','Atm','Bakery','Bank','Bar','Beauty Salon','Book Store','Bus Station','Cafe','Car Dealer','Car Rental','Car Repair','Car Wash','Cemetery','City Hall','Clothing Store','College','Convenience Store',
    'Corporate office','CourtHouse','Dentist','Department Store','Doctor','Electrician','Electronics Store','Embassy','Fire Station','florist','Furniture Store','Hospital','Jewelry Store','Laundry','Lawyer','Library','Local Government Office','Locksmith','Lodging','Meal Takeaway','Mosque','Movie theater',
    'Museum','Park','Parking','Pet Store','Pharmacy','Physiotherapist','Police','Post Office','Real Estate Agency','Residence','Restaurant','School','Shopping Mall','Spa','Stadium','Storage','Store','Supermarket','Taxi Stand','Temple','Train Station','Travel Agency','University','Zoo'];

  static final _address=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: const Text('Add Missing Place',style: TextStyle(color: Colors.black),),
      ),
      backgroundColor: Colors.blueGrey.shade50,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40,),
            const SizedBox(
              width: 340,
              child: Text('We apologize that the place you are searching for is not available on our map.'
                  ' place provide some info about the place and we will add it.',
              textAlign: TextAlign.center,style: TextStyle(color: Color(0xFF1C1C25))
              ),
            ),
            const SizedBox(
              height: 14,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                cursorColor: Colors.red,
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey, width: 1.0),),
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey, width: 1.0),),
                  labelText: 'Name & Address of the Place *',
                  labelStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.normal, color: Color(0xFF1C1C25)
                  ),
                  prefixIcon: Icon(Icons.location_history_rounded,color: Color(0xFF1C1C25),size: 26,),
                  hintText: 'Name & Address of the Place *',
                ),
                controller: _address,
                onSubmitted: (String value) {
                  debugPrint(value);
                },
              ),
            ),
            const Text('        e.g. Pathao HQ, 3A, Rd 49, Gulshan 2',style: TextStyle(fontSize: 12,color: Colors.grey)),
            Container(
              height: 60,
              width: 350,
              margin: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade400,width: 1.2),
                  borderRadius: BorderRadius.circular(4.0),
                  //color: Colors.white
              ),
              child: TextButton(
                onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return const UpdateLocationView();
                      })
                  );
                },
                child: Row(
                  children: const [
                    Icon(Icons.location_on, size: 26,color: Color(0xFF1C1C25)),
                    Text('   Select Closet Pin on Map',style: TextStyle(fontSize: 14,color: Colors.black),),
                     SizedBox(width: 80,),
                    Icon(Icons.arrow_forward_ios,size: 20,color: Color(0xFF1C1C25),),
                  ],
                ),
              ),
            ),
            SizedBox(height: 7,),
            Center(
              child: GestureDetector(
                child: Container(
                  height: 80,
                  width: MediaQuery.of(context).size.width - 35,
                  decoration:  BoxDecoration(
                    border: Border.all(color: Colors.grey.shade400,width: 1.2),
                    image: const DecorationImage(
                        fit: BoxFit.fill,
                        alignment: Alignment.centerRight,
                        image: AssetImage("assets/images/Update location.jpg")),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.grey
                  ),
                  child: Center(
                      child: Text(
                        'Update location on the map',
                        style: TextStyle(color: Colors.grey, fontSize: 20),
                      )),
                ),
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => const UpdateLocationView()));
                }
              ),
            ),
            SizedBox(height: 7,),
            Container(
              height: 60,
              width: 350,
              margin: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade400,width: 1.2),
                borderRadius: BorderRadius.circular(4.0),
                //color: Colors.white
              ),
              child: TextButton(
                onPressed: (){
                    showModalBottomSheet(
                      isScrollControlled:true,
                        context: context,
                        builder: (BuildContext context){
                          return Padding(
                          padding: EdgeInsets.only(
                          top: 30,
                          left: 5,
                          right: 5,
                          bottom: MediaQuery.of(context).viewInsets.bottom + 5
                          ),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 60,
                                  child: Row(
                                    children: [
                                      SizedBox(width: 13,),
                                      Text('Select a Category',style: TextStyle(fontSize: 16,),),Spacer(),
                                      TextButton(onPressed: (){
                                        Navigator.pop(context);
                                      }, child: Icon(Icons.close,color: Colors.black,))
                                    ],
                                  ),
                                ),
                                Divider(
                                  indent: 6,
                                  endIndent: 10,
                                ),
                                Expanded(
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                      physics: ScrollPhysics(),
                                      itemCount: categoryItems.length,
                                      itemBuilder: (context , index){
                                        return ListTile(
                                          visualDensity:VisualDensity(horizontal: 0, vertical: -4),
                                          title: Text(categoryItems[index]),
                                        );
                                      }),
                                ),
                              ],
                            ),
                          );
                    });

                },
                child: Row(
                  children: const [
                    Icon(Icons.category, size: 26,color: Color(0xFF1C1C25)),
                    Text('    Category',style: TextStyle(fontSize: 14,color: Colors.black),),
                    Spacer(),
                    // SizedBox(width: 80,),
                    Icon(Icons.arrow_drop_down,size: 20,color: Color(0xFF1C1C25),),
                  ],
                ),
              ),
            ),
            SizedBox(height: 60,),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Container(
                height: 80,
                color: Colors.white,
                child: Center(
                  child: SizedBox(height: 50,width: 320,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFFF59191),
                      ),
                      onPressed: (){



                        showModalBottomSheet(
                            isScrollControlled: true,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
                            isDismissible: false,
                            enableDrag: false,
                            context: context,
                            builder: (BuildContext context) {


                              return Padding(
                                padding: EdgeInsets.only(
                                  left: 8,right: 8,
                                  top: 10,
                                  bottom: MediaQuery.of(context).viewInsets.bottom + 0.5,),
                                child: Container(
                                  height: 150,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('Thank You For Your Contribution!',style: TextStyle(
                                        color: Colors.black,fontSize: 20,fontWeight: FontWeight.w500
                                      ),),
                                      RichText(text: TextSpan(
                                          text: "We've received your request.Thank you for your contribution to the My Road Map! We'll let you know once the suggested place is approved.",
                                        style: TextStyle(
                                          color: Colors.grey.shade500,
                                        ),
                                      ),
                                      textAlign: TextAlign.center,
                                      ),

                                      Row(
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
                                                child: Text('Add a New Place',style: TextStyle(fontWeight: FontWeight.normal,fontSize: 14,color: Colors.black54)),
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
                                                  primary: Colors.red.shade600,
                                                ),
                                                onPressed: () async{
                                                  Navigator.pop(context);
                                                  Navigator.pop(context);

                                                },
                                                child: Text('Done',style: TextStyle(fontWeight: FontWeight.normal,fontSize: 16)),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }
                        );


                      },
                      child: Text('SUBMIT PLACE',style: TextStyle(fontWeight: FontWeight.normal,fontSize: 16)),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
