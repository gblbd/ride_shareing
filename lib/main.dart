import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:ride_sharing/Others/SelectLanguage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

import 'MainScreen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();


  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.bottom]).then((_) {
    SharedPreferences.getInstance().then((prefs) {
      var darkModeOn = prefs.getBool('darkMode') ?? true;
      runApp(
        // ChangeNotifierProvider<ThemeNotifier>(
        //   create: (_) => ThemeNotifier(darkModeOn ? darkTheme : lightTheme),
            MyApp(),
        // ),
      );
    });
  });



  //runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return Sizer(
      builder:(context, orientation, deviceType){
       return MaterialApp(

         theme: ThemeData(
           primarySwatch: Colors.red
         ),

          debugShowCheckedModeBanner: false,
          title: 'Ride Sharing',
          home: AnimatedSplashScreen(
            splash: 'assets/images/My_Road_Logo.png',
            splashIconSize: 190,
            //nextScreen: const MainScreen(),
            nextScreen: const SelectLanguage(),
            duration: 5000,
            backgroundColor: Colors.white,
            splashTransition: SplashTransition.sizeTransition,
            pageTransitionType: PageTransitionType.leftToRight,
          ),
        );
      }
    );
  }
}
