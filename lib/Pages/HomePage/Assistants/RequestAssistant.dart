
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
List<dynamic> _placelist=[];

class RequestAssistant{
static Future<dynamic>getRequest(String url)async{
 // url='';
  http.Response response=await http.get(Uri.parse(url));
  try{
    if(response.statusCode==200)
    {

      String jSonData=response.body;
      _placelist=jsonDecode(jSonData)['predictions'];
     // var decodeData=jsonDecode(jSonData)['predictions'];
      return _placelist;

    }
    else{
      return "Failed, No Response";
    }
  }
  catch(exp){
    return "Failed";
  }
}
}


// class searchData{
//   static Future<dynamic> getSearchData()async{
//     ListView.builder(
//         shrinkWrap: true,
//         itemCount: _placelist.length,
//         itemBuilder: (context,index){
//
//           return ListTile(
//
//             title: Text(_placelist[index]['description']),
//           );
//
//         });
//   }
// }
//
// class request extends StatefulWidget {
//   const request({Key? key}) : super(key: key);
//
//   @override
//   State<request> createState() => _requestState();
// }
//
// class _requestState extends State<request> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body:  Expanded(
//         child: ListView.builder(
//             shrinkWrap: true,
//             itemCount: _placelist.length,
//             itemBuilder: (context,index){
//
//               return ListTile(
//
//                 title: Text(_placelist[index]['description']),
//               );
//
//             }),
//       ),
//
//     );
//   }
// }
