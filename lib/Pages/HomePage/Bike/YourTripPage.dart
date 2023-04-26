import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'DestinationSearch.dart';

class YourTripPage extends StatefulWidget {
  const YourTripPage({Key? key}) : super(key: key);

  @override
  State<YourTripPage> createState() => _YourTripPageState();
}

class _YourTripPageState extends State<YourTripPage> {

  List<String>_boxes=[];
  List<int> _boxesToRemove = [];

  bool _showAddButton = true;
  bool done = false;

  int _newBoxIndex=-1;

  void _addBox(){
    if( _boxes.length <=1){
      setState(() {
        _boxes.add('Search Stop ${_boxes.length+1}');

        // if(_boxes.length>1){
        //   done=true;
        // }

      });
      _showAddButton = _boxes.length < 2;
    }

  }

  void _removeBox(int index){
    setState(() {

      _boxesToRemove.add(index);

    });
    if(_boxesToRemove.length > 0){
      int nextIndex=_boxesToRemove.removeAt(0);
      _removeBoxHelper(nextIndex);
    }
    _showAddButton = _boxes.length == 0;
  }

  void _removeBoxHelper(int index){
    setState(() {
      _boxes.removeAt(index);
      if(index > 0 ){
        _boxes.removeAt(index-1);
      }

    });
    if (_boxesToRemove.length > 0) {
      int nextIndex = _boxesToRemove.removeAt(0);
      _removeBoxHelper(nextIndex);
    }
    _showAddButton = _boxes.length == 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.grey.shade50,
        title: Text('Your Trip',style: TextStyle(color: Colors.black),),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body:
      SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
                Container(
                  height: 40,
                  //width: 260,
                  margin: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade400,width: 1),
                      borderRadius: BorderRadius.circular(10.0),
                     // color: Colors.white
                  ),
                  child: TextButton(
                    onPressed: (){},
                    child: Row(
                      children: [
                        const SizedBox(width: 10,),
                        Icon(Icons.person,size: 20,color: Colors.grey.shade600,),
                        const SizedBox(width: 15,),
                        Text('Search Pickup',style: TextStyle(fontWeight: FontWeight.normal,fontSize: 16,color: Colors.grey.shade500)),
                      ],
                    ),
                  ),

                ),
            ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
              itemCount: _boxes.length,
                itemBuilder: (BuildContext context, int index){
                  return Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 40,
                          width: 260,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade400,width: 1.0),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: ListTile(
                            title: Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: Text(_boxes[index],style: TextStyle(fontWeight: FontWeight.normal,fontSize: 16,color: Colors.grey.shade500)),
                            ),
                            onTap: (){},
                            //trailing: IconButton(onPressed: ()=> _removeBox(index), icon: Icon(Icons.delete)),
                          ),
                        ),
                      ),
                    IconButton(
                      constraints: BoxConstraints(maxHeight: 36),
                        splashRadius: 0.5,
                        highlightColor: Colors.transparent,
                        splashColor: Colors.grey.shade50,
                        onPressed: ()=> _removeBox(index),
                        icon: Icon(Icons.close))
                    ],
                  );
                }
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 40,
                    width: 260,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade400,width: 1),
                        borderRadius: BorderRadius.circular(8.0),
                        //color: Colors.white
                    ),
                    child: TextButton(
                      onPressed: (){

                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return const DestinationSeachPage();
                            })
                        );

                      },
                      child: Row(
                        children: [
                          SizedBox(width: 10,),
                          Icon(Icons.location_on,color: Colors.red,size: 19,), SizedBox(width: 10,),
                          Text("Search Destination",style: TextStyle(fontWeight: FontWeight.normal,fontSize: 16,color: Colors.grey.shade500),)
                        ],
                      ),
                    ),
                  ),
                ),

                FloatingActionButton(
                  elevation: 0.0,
                  backgroundColor: Colors.grey.shade50,
                  splashColor: Colors.grey.shade50,
                  highlightElevation: 0.0,
                  onPressed: _addBox,
                  child: Icon(_showAddButton ? Icons.add : null,color: Colors.red,),
                ),
                // IconButton(
                //     constraints: BoxConstraints(maxHeight: 36),
                //     splashRadius: 0.5,
                //     highlightColor: Colors.transparent,
                //     splashColor: Colors.grey.shade50,
                //     onPressed: _addBox,
                //     icon: Icon(  Icons.add ,color: Colors.red,)
                // )


              ],
            ),
                Container(
                  height: 475,color: Colors.blueGrey.shade50,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.watch_later_outlined,size: 40,color: Colors.red,),SizedBox(height: 5,),
                        Text('Please Keep the stops under 5 mins',style: TextStyle(fontWeight: FontWeight.normal,fontSize: 16,color: Colors.black)),SizedBox(height: 5,),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Please Keep each stop under 5 minutes as a courtesy to your driver. When you add or, change your destination your trip face will be updated.',
                              style: TextStyle(fontWeight: FontWeight.normal,fontSize: 12,color: Colors.black),textAlign: TextAlign.center,),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 60,color: Colors.blueGrey.shade50,
                  child: Center(
                    child: SizedBox(height: 45,
                      width: 300,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFFF59191),
                        ),
                        onPressed: (){




                        },
                        child: Text('Done',style: TextStyle(fontWeight: FontWeight.normal,fontSize: 16)),
                      ),
                    ),
                  ),
                )


          ],
        ),
      ),

      // floatingActionButton: done? null : FloatingActionButton(
      //   onPressed: _addBox,
      //   child: Icon(Icons.add),
      // ),


    );
  }
}

