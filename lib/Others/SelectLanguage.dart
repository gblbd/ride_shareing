import 'package:flutter/material.dart';

import 'SplashScreen.dart';

class SelectLanguage extends StatefulWidget {
  const SelectLanguage({Key? key}) : super(key: key);

  @override
  State<SelectLanguage> createState() => _SelectLanguageState();
}

class _SelectLanguageState extends State<SelectLanguage> {

  String LanguageType='বাংলা';
  bool languageType=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/My_Road_Logo.png',height: 200),
            Text('Select Language',
            style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                height: 120,
                //width: 330,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black38,width: 0.2),
                    borderRadius: BorderRadius.circular(2.0),
                    color: Colors.white
                ),
                child: Column(
                  children: <Widget>[
                    RadioListTile(
                      title: Text("বাংলা",
                        style: TextStyle(
                            color: languageType == true ? Colors.black : Colors.grey,
                            fontWeight: languageType== true ? FontWeight.w700 : FontWeight.normal
                        ),
                      ),
                      value: "বাংলা",
                      activeColor: Colors.red,
                      groupValue: LanguageType,
                      controlAffinity: ListTileControlAffinity.trailing,
                      onChanged: (value){
                        setState(() {
                          LanguageType = value.toString();
                        });
                      },
                    ),
                    Divider(),

                    RadioListTile(
                      title: Text("English",
                      style: TextStyle(
                          color: languageType == true ? Colors.black : Colors.grey,
                          fontWeight: languageType == true ? FontWeight.w700 : FontWeight.normal

                      ),
                      ),
                      value: "English",
                      groupValue: LanguageType,
                      activeColor: Colors.red,
                      controlAffinity: ListTileControlAffinity.trailing,
                      onChanged: (value){
                        setState(() {
                          LanguageType = value.toString();
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 45,
                width: 320,
                color: Colors.white,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red.shade500,
                  ),
                  onPressed: () async{

                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return SplashScreen();
                        })
                    );
                    //Navigator.pop(context);
                    //Navigator.pop(context);
                  },
                  child: Text('Next',style: TextStyle(fontWeight: FontWeight.normal,fontSize: 16)),
                ),
              ),
            ),
            Text('You can change Language later from settings'),
            Image.asset('assets/images/language.jpg'),




          ],
        ),
      ),

    );
  }
}
