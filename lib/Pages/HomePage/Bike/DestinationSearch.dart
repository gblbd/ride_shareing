import 'package:flutter/material.dart';

import 'AddMissingPlace.dart';
import 'SetOnMapPage.dart';

class DestinationSeachPage extends StatelessWidget {

  DestinationSeachPage({Key? key}) : super(key: key);

  static final _destination=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.grey.shade50,
        title: Text('Destination Search',style: TextStyle(color: Colors.black),),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8,right: 8,top: 8),
            child: Row(
              children: [
                Container(
                  height: 50,width: 320,
                  margin: const EdgeInsets.all(10),
                  decoration:  BoxDecoration(
                      border: Border.all(color: Colors.grey.shade700,width: 1),
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white
                  ),
                  child: TextField(
                    controller: _destination,
                    cursorColor: Colors.red.shade900,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Search Destination',
                        hintStyle: TextStyle(fontSize: 17,color: Colors.black87),
                        prefixIcon: InkWell(
                          child: Icon(Icons.location_on,color: Colors.red,),
                          onTap: (){

                          },
                        ),

                    ),

                  ),
                ),
                // Container(
                //   height: 50,width: 50,
                //   margin: const EdgeInsets.all(7),
                //   decoration: _invisible ? null : BoxDecoration(
                //       border: Border.all(color: Colors.grey.shade700,width: 1),
                //       borderRadius: BorderRadius.circular(10.0),
                //       color: Colors.white
                //   ),
                //   child: TextButton(
                //       style: TextButton.styleFrom(primary: Colors.white,),
                //       onPressed: (){
                //         Navigator.push(
                //             context,
                //             MaterialPageRoute(builder: (context) {
                //               return const YourTripPage();
                //             })
                //         );
                //       },
                //       child: const Icon(Icons.add,color: Colors.red,size: 30,)),
                // ),

              ],
            ),
          ),
          Divider(color: Colors.blueGrey.shade50,thickness: 6,),
          Padding(
            padding: const EdgeInsets.only(left: 6,right: 8),
            child: Container(
              height: 60,
              child: ListTile(
                leading:   CircleAvatar(
                    radius: 17,
                    backgroundColor: Colors.grey.shade200,
                    child: Icon(Icons.search, size: 16,color: Colors.grey.shade600,)
                ),
                title: Text('Set On Map',style: TextStyle(fontSize: 17,color: Colors.black,fontWeight: FontWeight.normal),),
                onTap: (){


                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return SetOnMap(SearchDestinations: '',);
                      })
                  );

                },
              ),
            ),
          ),
          Divider(thickness: 8,color: Colors.blueGrey.shade50,),
          Container(
            height: 60,
            child: ListTile(
              leading:  CircleAvatar(
                  radius: 19,
                  backgroundColor: Colors.red.shade50,
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Icon(Icons.map,size: 18,color: Colors.red,),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Icon(Icons.add_location,size: 17,color: Colors.red,),
                      ),
                    ],
                  )
              ),
              title: Text('Add missing place to the My Road Map',style: TextStyle(fontSize: 13,color: Colors.black,fontWeight: FontWeight.w400)),
              trailing: Icon(Icons.arrow_forward_ios_sharp,size: 16,),
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return const AddMissingPlacePage();
                    })
                );
              },

            ),
          ),
        ],
      ),
    );
  }
}
