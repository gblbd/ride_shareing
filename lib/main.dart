import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
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

  // final GoogleMapsFlutterPlatform mapsImplementation =
  //     GoogleMapsFlutterPlatform.instance;
  // if (mapsImplementation is GoogleMapsFlutterAndroid) {
  //   mapsImplementation.useAndroidViewSurface = true;
  // }

  AwesomeNotifications().initialize(
    null,
    [
      NotificationChannel(
          channelGroupKey: 'basic_channel_group',
          channelKey: 'basic_channel',
          channelName: 'Basic notifications',
          channelDescription: 'Notification channel for basic tests',
          defaultColor: Color(0xFFF8BCBC),
          ledColor: Colors.white
      ),

    ],
    debug:true,

  );


  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // options: FirebaseOptions(
    //     apiKey: 'AIzaSyB4SGuMQqzQ64tod8zKEzMl1jd2VtJDr7g',
    //     appId: '1:1040697300790:android:e0e5aef459aba10b4b8597',
    //     messagingSenderId: 'messagingSenderId',
    //     projectId: 'my-road-2',
    //     databaseURL: 'https://my-road-2-default-rtdb.asia-southeast1.firebasedatabase.app'
    // )
  );


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
