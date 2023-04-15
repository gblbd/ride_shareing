import 'package:flutter/material.dart';

class SelectZoneList extends StatefulWidget {
  const SelectZoneList({Key? key}) : super(key: key);

  @override
  State<SelectZoneList> createState() => _SelectZoneListState();
}

class _SelectZoneListState extends State<SelectZoneList> {
  final TextEditingController _searchZoneController = TextEditingController();
  final FocusNode _textFocusNode = FocusNode();


  final ZoneItems=['Bagerhat Sadar','Chitalmari','Fakirhat','Kachua','Mollahat','Mongla','Morelganj','Rampal','Rayenda','Sarankhola'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        title: Text('Select City',style: TextStyle(color: Colors.black)),
      ),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(padding: EdgeInsets.all(16.0),
            child: SizedBox(height: 46,




              child: TextField(
                cursorColor: Colors.red,
                controller: _searchZoneController,
                focusNode: _textFocusNode,
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey, width: 1.0),),
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey, width: 1.0),),
                  hintText: 'Search Zone',
                  prefixIcon: Icon(Icons.search,color: Colors.red,size: 25,),
                ),
                onSubmitted: (String value) {
                  debugPrint(value);
                },
                onTap: (){},
              ),
            ),
          ),
          Text('   SELECT ZONE',style: TextStyle(color: Colors.grey,fontSize: 18),),
          SizedBox(height: 10,),
          Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemCount: ZoneItems.length,
                itemBuilder: (context , index){
                  return Column(
                    children: [
                      ListTile(
                        visualDensity:VisualDensity(horizontal: 0, vertical: -4),
                        title: Text(ZoneItems[index]),
                        onTap: (){},
                      ),
                      const Divider(indent: 15,endIndent: 20,),
                    ],
                  );
                }),
          ),



        ],
      ),
    );
  }
}
