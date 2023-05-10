// import 'package:flutter/material.dart';
//
// import 'SplashScreenModel.dart';
//
// import 'package:flutter/cupertino.dart';
//
// Color lightgreenshede = Color(0xFFF0FAF6);
// Color lightgreenshede1 = Color(0xFFB2D9CC);
// Color greenshede0 = Color(0xFF66A690);
// Color greenshede1 = Color(0xFF93C9B5);
// Color primarygreen = Color(0xFF1E3A34);
// Color grayshade = Color(0xFF93B3AA);
// Color colorAcent = Color(0xFF78C2A7);
// Color cyanColor = Color(0xFF6D7E6E);
//
// const kAnimationDuration = Duration(milliseconds: 200);
//
// class SpalshScreen extends StatefulWidget {
//   const SpalshScreen({Key? key}) : super(key: key);
//
//   @override
//   State<SpalshScreen> createState() => _SpalshScreenState();
// }
//
// class _SpalshScreenState extends State<SpalshScreen> {
//
//   int currentIndex = 0;
//
//   List<AllinOnboardModel> allinonboardlist = [
//     AllinOnboardModel(
//         "assets/images/AllInOne.png",
//         "Get a ride, Courier and much more, at your fingertips.",
//         "One app for all services"),
//     AllinOnboardModel(
//         "assets/images/ride.png",
//         "Beat the traffic and reach your destination fast, every time.",
//         "Get there, on time."),
//     AllinOnboardModel(
//         "assets/images/Payment.png",
//         "Cash? Card? Wallet? We accept it all. Let's get started.",
//         "Pay, as you want."),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           PageView.builder(
//               onPageChanged: (value) {
//                 setState(() {
//                   currentIndex = value;
//                 });
//               },
//               itemCount: allinonboardlist.length,
//               itemBuilder: (context, index) {
//                 return PageBuilderWidget(
//                     title: allinonboardlist[index].titlestr,
//                     description: allinonboardlist[index].description,
//                     imgurl: allinonboardlist[index].imgStr);
//               }),
//           Positioned(
//             bottom: MediaQuery.of(context).size.height * 0.3,
//             left: MediaQuery.of(context).size.width * 0.44,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: List.generate(
//                 allinonboardlist.length,
//                     (index) => buildDot(index: index),
//               ),
//             ),
//           ),
//           currentIndex < allinonboardlist.length - 1
//               ? Positioned(
//             bottom: MediaQuery.of(context).size.height * 0.2,
//             width: MediaQuery.of(context).size.width,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 ElevatedButton(
//                   onPressed: () {},
//                   child: Text(
//                     "Previous",
//                     style: TextStyle(fontSize: 18, color: primarygreen),
//                   ),
//                   style: ElevatedButton.styleFrom(
//                     primary: lightgreenshede1,
//                     shape: const RoundedRectangleBorder(
//                         borderRadius: BorderRadius.only(
//                             topRight: Radius.circular(20.0),
//                             bottomRight: Radius.circular(20.0))),
//                   ),
//                 ),
//                 ElevatedButton(
//                   onPressed: () {},
//                   child: Text(
//                     "Next",
//                     style: TextStyle(fontSize: 18, color: primarygreen),
//                   ),
//                   style: ElevatedButton.styleFrom(
//                     primary: lightgreenshede1,
//                     shape: const RoundedRectangleBorder(
//                         borderRadius: BorderRadius.only(
//                             topLeft: Radius.circular(20.0),
//                             bottomLeft: Radius.circular(20.0))),
//                   ),
//                 )
//               ],
//             ),
//           )
//               : Positioned(
//             bottom: MediaQuery.of(context).size.height * 0.2,
//             left: MediaQuery.of(context).size.width * 0.33,
//             child: ElevatedButton(
//               onPressed: () {},
//               child: Text(
//                 "Get Started",
//                 style: TextStyle(fontSize: 18, color: primarygreen),
//               ),
//               style: ElevatedButton.styleFrom(
//                 primary: lightgreenshede1,
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(20.0)),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   AnimatedContainer buildDot({int? index}) {
//     return AnimatedContainer(
//         duration: kAnimationDuration,
//         margin: EdgeInsets.only(right: 5),
//         height: 6,
//         width: currentIndex == index ? 20 : 6,
//         decoration: BoxDecoration(
//           color: currentIndex == index ? primarygreen : Color(0xFFD8D8D8),
//           borderRadius: BorderRadius.circular(3),
//         ),
//     );
//   }
// }
// class PageBuilderWidget extends StatelessWidget {
//   String title;
//   String description;
//   String imgurl;
//   PageBuilderWidget(
//       {Key? key,
//         required this.title,
//         required this.description,
//         required this.imgurl})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.only(left: 15, right: 15),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Container(
//             margin: const EdgeInsets.only(top: 20),
//             child: Image.asset(imgurl),
//           ),
//           const SizedBox(
//             height: 20,
//           ),
//           //Tite Text
//           Text(title,
//               style: TextStyle(
//                   color: primarygreen,
//                   fontSize: 24,
//                   fontWeight: FontWeight.w700)),
//           const SizedBox(
//             height: 20,
//           ),
//           //discription
//           Text(description,
//               textAlign: TextAlign.justify,
//               style: TextStyle(
//                 color: primarygreen,
//                 fontSize: 14,
//               ))
//         ],
//       ),
//     );
//   }
// }


//
// import 'package:flutter/material.dart';
//
// class SpalshScreen extends StatefulWidget {
//   const SpalshScreen({Key? key}) : super(key: key);
//
//   @override
//   _SpalshScreenState createState() => _SpalshScreenState();
// }
//
// class _SpalshScreenState extends State<SpalshScreen> {
//   PageController controller = PageController();
//   int pageIndex = 0;
//
//   Color yellow = const Color(0xffFDC054);
//   Color mediumYellow = const Color(0xffFDB846);
//   Color darkYellow = const Color(0xffE99E22);
//   Color transparentYellow = const Color.fromRGBO(253, 184, 70, 0.7);
//   Color darkGrey = const Color(0xff202020);
//
//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       child: Stack(
//         children: <Widget>[
//           PageView(
//             onPageChanged: (value) {
//               setState(() {
//                 pageIndex = value;
//               });
//             },
//             controller: controller,
//             children: <Widget>[
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                // crossAxisAlignment: CrossAxisAlignment.end,
//                 children: <Widget>[
//                   Center(
//                     child: Image.asset(
//                       'assets/images/AllInOne.png',
//                       height: 200,
//                       width: 200,
//                     ),
//                   ),
//                   const Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 32),
//                     child: Text(
//                       'Get Any Thing Online',
//                       textAlign: TextAlign.right,
//                       style: TextStyle(
//                           fontWeight: FontWeight.bold, fontSize: 16),
//                     ),
//                   ),
//                   const Padding(
//                     padding: EdgeInsets.symmetric(
//                         horizontal: 32, vertical: 16.0),
//                     child: Text(
//                       'You can buy anything ranging from digital products to hardware within few clicks.',
//                       textAlign: TextAlign.right,
//                       style: TextStyle(color: Colors.grey, fontSize: 12.0),
//                     ),
//                   ),
//                 ],
//               ),
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                // crossAxisAlignment: CrossAxisAlignment.end,
//                 children: <Widget>[
//                   Center(
//                     child: Image.asset(
//                       'assets/images/ride.png',
//                       height: 200,
//                       width: 200,
//                     ),
//                   ),
//                   const Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 32),
//                     child: Text(
//                       'Shipping to anywhere ',
//                       textAlign: TextAlign.right,
//                       style: TextStyle(
//                           fontWeight: FontWeight.bold, fontSize: 16),
//                     ),
//                   ),
//                   const Padding(
//                     padding: EdgeInsets.symmetric(
//                         horizontal: 32, vertical: 16.0),
//                     child: Text(
//                       'We will ship to anywhere in the world, With 30 day 100% money back policy.',
//                       textAlign: TextAlign.right,
//                       style: TextStyle(color: Colors.grey, fontSize: 12.0),
//                     ),
//                   ),
//                 ],
//               ),
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                // crossAxisAlignment: CrossAxisAlignment.end,
//                 children: <Widget>[
//                   Center(
//                     child: Image.asset(
//                       'assets/images/Payment.png',
//                       height: 200,
//                       width: 200,
//                     ),
//                   ),
//                   const Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 32),
//                     child: Text(
//                       'On-time delivery',
//                       textAlign: TextAlign.right,
//                       style: TextStyle(
//                           fontWeight: FontWeight.bold, fontSize: 16),
//                     ),
//                   ),
//                   const Padding(
//                     padding: EdgeInsets.symmetric(
//                         horizontal: 32, vertical: 16.0),
//                     child: Text(
//                       'You can track your product with our powerful tracking service.',
//                       textAlign: TextAlign.right,
//                       style: TextStyle(color: Colors.grey, fontSize: 12.0),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//           Positioned(
//             bottom: 16.0,
//             child: SizedBox(
//               width: MediaQuery.of(context).size.width,
//               child: Column(
//                 children: <Widget>[
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: <Widget>[
//                       Container(
//                         margin: const EdgeInsets.all(8.0),
//                         height: 12,
//                         width: 12,
//                         decoration: BoxDecoration(
//                             shape: BoxShape.circle,
//                             border: Border.all(color: Colors.black, width: 2),
//                             color: pageIndex == 0 ? yellow : Colors.white),
//                       ),
//                       Container(
//                         margin: const EdgeInsets.all(8.0),
//                         height: 12,
//                         width: 12,
//                         decoration: BoxDecoration(
//                             shape: BoxShape.circle,
//                             border: Border.all(color: Colors.black, width: 2),
//                             color: pageIndex == 1 ? yellow : Colors.white),
//                       ),
//                       Container(
//                         margin: const EdgeInsets.all(8.0),
//                         height: 12,
//                         width: 12,
//                         decoration: BoxDecoration(
//                             shape: BoxShape.circle,
//                             border: Border.all(color: Colors.black, width: 2),
//                             color: pageIndex == 2 ? yellow : Colors.white),
//                       )
//                     ],
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: <Widget>[
//                       Opacity(
//                         opacity: pageIndex != 2 ? 1.0 : 0.0,
//                         child: ElevatedButton(
//
//                           //splashColor: Colors.transparent,
//                           child: const Text(
//                             'SKIP',
//                             style: TextStyle(
//                                 color: Colors.black,
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 16),
//                           ),
//                           onPressed: () {
//                             // Navigator.of(context).pushReplacement(
//                             //     MaterialPageRoute(
//                             //         builder: (context) => MainPage()));
//                           },
//                         ),
//                       ),
//                       pageIndex != 2
//                           ? ElevatedButton(
//                        // splashColor: Colors.transparent,
//                         child: const Text(
//                           'NEXT',
//                           style: TextStyle(
//                               color: Colors.black,
//                               fontWeight: FontWeight.bold,
//                               fontSize: 16),
//                         ),
//                         onPressed: () {
//                           if (!(controller.page == 2.0)) {
//                             controller.nextPage(
//                                 duration: const Duration(milliseconds: 200),
//                                 curve: Curves.linear);
//                           }
//                         },
//                       )
//                           : ElevatedButton(
//                         //splashColor: Colors.transparent,
//                         child: const Text(
//                           'FINISH',
//                           style: TextStyle(
//                               color: Colors.black,
//                               fontWeight: FontWeight.bold,
//                               fontSize: 16),
//                         ),
//                         onPressed: () {
//
//                           // Navigator.of(context).pushReplacement(
//                           //     MaterialPageRoute(
//                           //         builder: (context) => MainPage()));
//                         },
//                       )
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:getwidget/components/intro_screen/gf_intro_screen.dart';
import 'package:getwidget/components/intro_screen/gf_intro_screen_bottom_navigation_bar.dart';

import 'LoginWithPhoneNum.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  late PageController _pageController;
  late List<Widget>slideList;
  late int initialPage;
  @override
  void initState(){
    _pageController=PageController(initialPage: 0);
    initialPage = _pageController.initialPage;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10,),
            SafeArea(
              child: GFIntroScreen(
                height: 550,
                slides: slides(),
                border: Border.all(color: Colors.white),
                pageController: _pageController,
                introScreenBottomNavigationBar: GFIntroScreenBottomNavigationBar(
                  pageController: _pageController,
                  pageCount: slideList.length,
                  currentIndex: initialPage,
                  navigationBarHeight: 50,
                  navigationBarColor: Colors.deepOrange.shade50,
                  showDivider: false,
                  dotHeight: 10,
                  dotWidth: 12,
                  dotShape: RoundedRectangleBorder(
                      side: const BorderSide(color: Colors.grey,width: 1),
                      borderRadius: BorderRadius.circular(3)
                  ),
                  inactiveColor: Colors.grey,
                  activeColor: GFColors.LIGHT,
                  showPagination: true,
                ),
                currentIndex: initialPage,
                pageCount: slideList.length,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Container(
                height: 60,
                width: 400,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0),
                    color: Colors.red
                ),
                child: TextButton(
                  style: ButtonStyle(
                    shadowColor: MaterialStateProperty.all(Colors.transparent),
                    overlayColor: MaterialStateProperty.all(Colors.transparent),
                  ),
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return LoginWithPhoneNum();
                        },
                      ),
                    );
                  },
                  child: const Text('Get Started',textAlign: TextAlign.center,style: TextStyle(fontSize: 18,fontWeight: FontWeight.normal,color: Colors.white),),
                ),
              ),
            ),

          ],
        ),
      ),
      // floatingActionButton: Container(
      //   height: 50,
      //   width: 400,
      //   decoration: BoxDecoration(
      //       borderRadius: BorderRadius.circular(4.0),
      //       color: Colors.red
      //   ),
      //   child: TextButton(
      //     style: ButtonStyle(
      //       shadowColor: MaterialStateProperty.all(Colors.transparent),
      //       overlayColor: MaterialStateProperty.all(Colors.transparent),
      //     ),
      //     onPressed: (){
      //       // Navigator.push(
      //       //   context,
      //       //   MaterialPageRoute(
      //       //     builder: (context) {
      //       //       return LoginPage();
      //       //     },
      //       //   ),
      //       // );
      //     },
      //     child: const Text('Get Started',textAlign: TextAlign.center,style: TextStyle(fontSize: 18,fontWeight: FontWeight.normal,color: Colors.white),),
      //   ),
      // ),
    );
  }
  List<Widget>slides(){
    slideList=[
      Container(
        height: 400,
        child: Padding(
          padding: const EdgeInsets.all(2),
          child: Column(
            children: [
              Image.asset('assets/images/AllInOne.png',height: 360,width: 320,),
              Text('One app fo all services.',
                style: TextStyle(
                    fontSize: 20,fontWeight: FontWeight.w600
                ),
              ),
              Text('Get a ride, courier and much more, at your fingertips.',
                style: TextStyle(
                    fontSize: 16,fontWeight: FontWeight.w400
                ),
                textAlign: TextAlign.center,
              ),

            ],
          ),
        ),
      ),
      Container(
        height: 350,
        child: Padding(
          padding: const EdgeInsets.all(2),
          child: Column(
            children: [

              Image.asset('assets/images/ride.png',height: 360,width: 320,),
              Text('Get there, on time.',style: TextStyle(
                  fontSize: 20,fontWeight: FontWeight.w600
              ),),
              Text('Beat the traffic and reach your destination fast, every time',
                style: TextStyle(
                    fontSize: 16,fontWeight: FontWeight.w400
                ),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
      Container(
        height: 350,
        child: Padding(
          padding: const EdgeInsets.all(2),
          child: Column(
            children: [
              Image.asset('assets/images/Payment.png',height: 360,width: 320,),
              Text('Pay, as you want.',style: TextStyle(
    fontSize: 20,fontWeight: FontWeight.w600
    ),),
              Text("Cash? Card? Wallet? We accept it all.Let's get started.",style: TextStyle(
    fontSize: 16,fontWeight: FontWeight.w400
    ),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    ];
    return slideList;
  }
}