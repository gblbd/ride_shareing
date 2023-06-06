



import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;

class SearchPage extends StatefulWidget{
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _controller=TextEditingController();

  var uuid=Uuid();

  List<dynamic> _placelist=[];

  String _sessionToken="122344";

  @override
  void initState(){
    super.initState();

    _controller.addListener(() {

      Onchange();
    });


  }

  void Onchange(){

    if(_sessionToken==null){

      setState(() {
        _sessionToken=uuid.v4();
      });

    }

    getSuggestion(_controller.text);

  }


  void getSuggestion(String input)async{

    String KPLACE_API_KEY="AIzaSyBsPxSFf2or6oZnbq7urgrxlakTiVqTmjQ";
    String baseUrl="https://maps.googleapis.com/maps/api/place/autocomplete/json";
    String request='https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$input&types=establishment&key=AIzaSyBsPxSFf2or6oZnbq7urgrxlakTiVqTmjQ&sessiontoken=122344';

    var response=await http.get(Uri.parse(request));

    if(response.statusCode==200){

      setState(() {
        _placelist=jsonDecode(response.body)['predictions'];
      });

    }else{
      throw Exception("Unable to load data");
    }


  }




  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(
        children: [
          TextField(
            controller: _controller,
          ),
          
          
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
                itemCount: _placelist.length,
                itemBuilder: (context,index){

                return ListTile(

                  title: Text(_placelist[index]['description']),
                );

                }),
          ),








        ],
      ),
    );
  }
}