import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UpdateLocationView extends StatefulWidget {
  const UpdateLocationView({Key? key}) : super(key: key);

  @override
  State<UpdateLocationView> createState() => _UpdateLocationViewState();
}

class _UpdateLocationViewState extends State<UpdateLocationView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 30.0,left: 5,right: 5,bottom: 5),
        constraints: BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/Update location.jpg'),
              fit: BoxFit.cover),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FloatingActionButton(
              backgroundColor: Colors.white,
              onPressed: (){
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back,color: Colors.black,size: 24,),
            ),
          ],
        ),
      ),
    );
  }
}
