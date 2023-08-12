
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeritageList extends StatelessWidget{


  @override
  Widget build(BuildContext context) {

    Query dbref=FirebaseDatabase.instance.ref("Heritage");

    // TODO: implement build
    return Scaffold(

      body: SingleChildScrollView(
        child: Column(
          children: [


            FirebaseAnimatedList(
              physics: ScrollPhysics(),
              shrinkWrap: true,
              query: dbref,
              reverse: false,
              itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double> animation, int index) {

                return Container(
                  margin: EdgeInsets.all(8),
                  child: Card(
                    child: ExpansionTile(
                      //leading: Image.network("${snapshot.child("ImgURL").value.toString()}"),
                      textColor: Colors.black,
                      iconColor: Colors.black,
                      collapsedBackgroundColor: Colors.red.shade100,
                      title: Text('${snapshot.child("Name").value.toString()}',
                        style: GoogleFonts.openSans(
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                        ),

                      ),
                      subtitle: Text('${snapshot.child("address").value.toString()}'),
                      children: <Widget>[
                        //Text("${snapshot.child("Name").value.toString()}  \n"),
                        Container(
                            padding: EdgeInsets.all(16),
                            child: Image.network("${snapshot.child("ImgURL").value.toString()}")),
                        Container(
                          padding: EdgeInsets.all(16),
                            child: Text("${snapshot.child("Description").value.toString()}",textAlign: TextAlign.justify,)
                        ),

                      ],
                    ),
                  ),
                );
              },
            )

          ],
        ),
      ),

    );
  }

}