import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelectCityListPage extends StatefulWidget {

  const SelectCityListPage({Key? key}) : super(key: key);

  @override
  State<SelectCityListPage> createState() => _SelectCityListPageState();
}

class _SelectCityListPageState extends State<SelectCityListPage> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _textFocusNode = FocusNode();


  final CityItems=['Bagerhat','Bandarban','Barguna','Barisal','B. Baria','Bhola','Bogra','Chandpur','Chapainawabganj', 'Chittagong','Chuadanga','Coxs Bazar','Cumilla','Dhaka',
    'Dhaka','Dinajpur','Faridpur','Feni','Gaibandha','Gazipur','Habiganj','Jamalpur','Jashore',
  'Jhalikathi','Jhenidah','Joypurhat','Khagrachari','Khulna','Kishorganj','Kurigram','Kushtia','Lakshmipur','Lalmorirpur','Lalmonirhat','Madaripur','Magura','Manikganj',
  'Meherpur','Moulvibazar','Munshiganj','Mymensingh','Naogaon','Narail','Mrayanganj','Narshingdi','Natore','Netrokona','Nilpgamari','Noakhali','Pabna','Panchagarh','Patuakhali',
  'Pirojpur','Rajbari','Rajshahi','Rangamati','Rangpur','Satkhira','Shariatpur','Sherpur','Sirajganj','Sunamganj','Sylhet','Tangail','Thakurgaon'];

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
              controller: _searchController,
              focusNode: _textFocusNode,
              decoration: const InputDecoration(
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey, width: 1.0),),
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey, width: 1.0),),
                hintText: 'Search City',
                prefixIcon: Icon(Icons.search,color: Colors.red,size: 25,),
              ),
              onSubmitted: (String value) {
                debugPrint(value);
              },
            ),
          ),
          ),
          Text('   SELECT CITY',style: TextStyle(color: Colors.grey,fontSize: 18),),
          SizedBox(height: 10,),
          Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemCount: CityItems.length,
                itemBuilder: (context , index){
                  return Column(
                    children: [
                      ListTile(
                        visualDensity:VisualDensity(horizontal: 0, vertical: -4),
                        title: Text(CityItems[index]),
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
