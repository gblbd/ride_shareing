import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

import 'BusinessProfile.dart';
import 'NotificationScreen.dart';
import 'ProfilePage.dart';
import '../../OffersPage/views/MyRoadPoints.dart';


class AccountAndSettingsPage extends StatefulWidget {
  final String fullname1;
  final String email1;
  final String phoneNumber1;
  final String gender1;
  final String dateOfBirth1;
  const AccountAndSettingsPage({Key? key, required this.fullname1, required this.email1, required this.phoneNumber1, required this.gender1, required this.dateOfBirth1}) : super(key: key);

  @override
  State<AccountAndSettingsPage> createState() => _AccountAndSettingsPageState();
}

class _AccountAndSettingsPageState extends State<AccountAndSettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text('Account & Settings',style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Divider(thickness: 8,color: Colors.blueGrey.shade50,),

            Container(
              height: 120,width: 320,
              child: Row(
                children: [
                  Image.asset('assets/images/profile.png',fit: BoxFit.fill,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 23,),
                       Text(widget.fullname1,style: TextStyle(color: Colors.black,fontWeight: FontWeight.w900,fontSize: 20)), SizedBox(height: 5,),
                       Text("+880${widget.phoneNumber1}",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w500)),SizedBox(height: 5,),
                      Container(
                        height: 29,width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.0),
                            color: Colors.black
                          ),
                          child: TextButton(
                              style: ButtonStyle(
                                shadowColor: MaterialStateProperty.all(Colors.transparent),
                                overlayColor: MaterialStateProperty.all(Colors.transparent),
                              ),
                              onPressed: (){}, child: Row(
                            children: const [
                              Icon(Icons.star,color: Colors.deepOrange,size: 16,),SizedBox(width: 5,),
                              Text('N/A ',style: TextStyle(color: Colors.white,fontWeight: FontWeight.normal)),SizedBox(width: 5,),
                              Icon(Icons.arrow_forward_ios,color: Colors.white,size: 12,),
                            ],
                          )))
                    ],
                  ),
                ],
              ),
            ),
            Divider(thickness: 8,color: Colors.blueGrey.shade50,),
            Padding(
              padding: const EdgeInsets.all(4.0),
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
                        return MyRoadPointsPage();
                      },
                    ),
                  );
                },
                child: Container(
                  height: 30,width: 350,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset('assets/images/BRONZE.png',fit: BoxFit.cover,),
                      Text('BRONZE',style: TextStyle(color: Color(0xFF932B06),fontSize: 16,fontWeight: FontWeight.w500),),
                      Spacer(),
                      Text('0 Points',style: TextStyle(color: Colors.grey,fontSize: 16,fontWeight: FontWeight.w400),),
                      SizedBox(width: 12,),
                      Icon(Icons.arrow_forward_ios,size: 14,color: Colors.grey,)
                    ],
                  ),
                ),
              ),
            ),
            Divider(thickness: 8,color: Colors.blueGrey.shade50,),
            Padding(
              padding: const EdgeInsets.all(4.0),
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
                      return NotificationScreen();
                    },
                  ),
                );
              },
              child: Container(
                height: 30,width: 350,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.notifications,size: 26,color: Colors.grey.shade700,),
                    const SizedBox(width: 8,),
                    Text('Notifications',style: TextStyle(color: Colors.grey.shade700,fontSize: 16),),
                    const Spacer(),
                    Icon(Icons.arrow_forward_ios,size: 14,color: Colors.grey.shade700,)
                  ],
                ),
              ),
            ),
            ),
            Divider(thickness: 8,color: Colors.blueGrey.shade50,),
            Padding(padding: EdgeInsets.all(4.0),
            child: Container(
              height: 270,width: 350,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10,),
                  Text('    ACCOUNT',style: TextStyle(color: Colors.grey.shade700,fontSize: 12)),
                  SizedBox(height: 5,),
                  TextButton(
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return ProfilePage(
                                fullname: widget.fullname1,
                                email: widget.email1,
                                phoneNumber: widget.phoneNumber1,
                                gender: widget.gender1,
                                dateOfBirth: widget.dateOfBirth1,);
                            },
                          ),
                        );
                      },
                      child: Row(
                        children: [
                          Icon(Icons.account_circle_rounded,color: Colors.grey.shade700,size: 25,),SizedBox(width: 15,),
                          Text('Profile',style: TextStyle(color: Colors.black,fontSize: 17,fontWeight: FontWeight.normal)),
                        ],
                      )),
                  Divider(indent: 10,endIndent: 16,),
                  TextButton(
                      onPressed: (){

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return MyMapWidget();
                            },
                          ),
                        );
                      },
                      child: Row(
                        children: [
                          Icon(Icons.card_travel,color: Colors.grey.shade700,size: 25,),SizedBox(width: 15,),
                          Text('Business Profile',style: TextStyle(color: Colors.black,fontSize: 17,fontWeight: FontWeight.normal)),
                        ],
                      )),
                  Divider(indent: 10,endIndent: 16,),
                  TextButton(
                      onPressed: (){},
                      child: Row(
                        children: [
                          Icon(Icons.payment,color: Colors.grey.shade700,size: 25,),SizedBox(width: 15,),
                          Text('Digital Payment',style: TextStyle(color: Colors.black,fontSize: 17,fontWeight: FontWeight.normal)),
                        ],
                      )),
                  Divider(indent: 10,endIndent: 16,),
                  TextButton(
                      onPressed: (){},
                      child: Row(
                        children: [
                          Icon(Icons.star,color: Colors.grey.shade700,size: 25,),SizedBox(width: 15,),
                          Text('Saved Address',style: TextStyle(color: Colors.black,fontSize: 17,fontWeight: FontWeight.normal)),
                        ],
                      )),
                ],
              ),
            ),
            ),
            Divider(thickness: 8,color: Colors.blueGrey.shade50,),
            Padding(padding: EdgeInsets.all(4.0),
              child: Container(
                height: 144,width: 350,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10,),
                    Text('    OFFERS',style: TextStyle(color: Colors.grey.shade700,fontSize: 12)),
                    SizedBox(height: 5,),
                    TextButton(
                        onPressed: (){},
                        child: Row(
                          children: [
                            Icon(Icons.account_circle_rounded,color: Colors.grey.shade700,size: 25,),SizedBox(width: 15,),
                            Text('Promos',style: TextStyle(color: Colors.black,fontSize: 17,fontWeight: FontWeight.normal)),
                          ],
                        )),
                    Divider(indent: 10,endIndent: 16,),
                    TextButton(
                        onPressed: (){},
                        child: Row(
                          children: [
                            Icon(Icons.card_travel,color: Colors.grey.shade700,size: 25,),SizedBox(width: 15,),
                            Text('Refer & Get Discounts',style: TextStyle(color: Colors.black,fontSize: 17,fontWeight: FontWeight.normal)),
                          ],
                        )),
                  ],
                ),
              ),
            ),
            Divider(thickness: 8,color: Colors.blueGrey.shade50,),
            Padding(padding: EdgeInsets.all(4.0),
              child: Container(
                height: 144,width: 350,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10,),
                    Text('    SETTINGS',style: TextStyle(color: Colors.grey.shade700,fontSize: 12)),
                    SizedBox(height: 5,),
                    TextButton(
                        onPressed: (){},
                        child: Row(
                          children: [
                            Icon(Icons.account_circle_rounded,color: Colors.grey.shade700,size: 25,),SizedBox(width: 15,),
                            Text('Language',style: TextStyle(color: Colors.black,fontSize: 17,fontWeight: FontWeight.normal)),
                          ],
                        )),
                    Divider(indent: 10,endIndent: 16,),
                    TextButton(
                        onPressed: (){},
                        child: Row(
                          children: [
                            Icon(Icons.card_travel,color: Colors.grey.shade700,size: 25,),SizedBox(width: 15,),
                            Text('Permissions',style: TextStyle(color: Colors.black,fontSize: 17,fontWeight: FontWeight.normal)),
                          ],
                        )),
                  ],
                ),
              ),
            ),
            Divider(thickness: 8,color: Colors.blueGrey.shade50,),
            Padding(padding: EdgeInsets.all(4.0),
              child: Container(
                height: 207,width: 350,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10,),
                    Text('    HELP & LEGAL',style: TextStyle(color: Colors.grey.shade700,fontSize: 12)),
                    SizedBox(height: 5,),
                    TextButton(
                        onPressed: (){},
                        child: Row(
                          children: [
                            Icon(Icons.account_circle_rounded,color: Colors.grey.shade700,size: 25,),SizedBox(width: 15,),
                            Text('Emergency Support',style: TextStyle(color: Colors.black,fontSize: 17,fontWeight: FontWeight.normal)),
                          ],
                        )),
                    Divider(indent: 10,endIndent: 16,),
                    TextButton(
                        onPressed: (){},
                        child: Row(
                          children: [
                            Icon(Icons.card_travel,color: Colors.grey.shade700,size: 25,),SizedBox(width: 15,),
                            Text('Help',style: TextStyle(color: Colors.black,fontSize: 17,fontWeight: FontWeight.normal)),
                          ],
                        )),
                    Divider(indent: 10,endIndent: 16,),
                    TextButton(
                        onPressed: (){},
                        child: Row(
                          children: [
                            Icon(Icons.payment,color: Colors.grey.shade700,size: 25,),SizedBox(width: 15,),
                            Text('Policies',style: TextStyle(color: Colors.black,fontSize: 17,fontWeight: FontWeight.normal)),
                          ],
                        )),
                  ],
                ),
              ),
            ),
            Divider(thickness: 8,color: Colors.blueGrey.shade50,),
            Padding(padding: EdgeInsets.all(4.0),
              child: Container(
                height: 144,width: 350,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10,),
                    Text('    MORE',style: TextStyle(color: Colors.grey.shade700,fontSize: 12)),
                    SizedBox(height: 5,),
                    TextButton(
                        onPressed: (){},
                        child: Row(
                          children: [
                            Icon(Icons.account_circle_rounded,color: Colors.grey.shade700,size: 25,),SizedBox(width: 15,),
                            Text('Rate us',style: TextStyle(color: Colors.black,fontSize: 17,fontWeight: FontWeight.normal)),
                          ],
                        )),
                    Divider(indent: 10,endIndent: 16,),
                    TextButton(
                        onPressed: (){},
                        child: Row(
                          children: [
                            Icon(Icons.card_travel,color: Colors.grey.shade700,size: 25,),SizedBox(width: 15,),
                            Text('Drive With My Road',style: TextStyle(color: Colors.black,fontSize: 17,fontWeight: FontWeight.normal)),
                          ],
                        )),
                  ],
                ),
              ),
            ),
            Divider(thickness: 8,color: Colors.blueGrey.shade50,),
            Padding(padding: EdgeInsets.all(4.0),
          child: Container(
            height: 50,width: 350,
            child: TextButton(
                onPressed: (){},
                child: Row(
                  children: [
                    Icon(Icons.logout,color: Colors.grey.shade700,size: 25,),SizedBox(width: 15,),
                    Text('Log out',style: TextStyle(color: Colors.black,fontSize: 17,fontWeight: FontWeight.normal)),
                  ],
                )),

          ),
        ),
        Container(
          height: 144,
          color: Colors.blueGrey.shade50,
          child: Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.facebook),SizedBox(width: 10,),
              Icon(Icons.install_mobile_sharp),SizedBox(width: 10,),
              Icon(Icons.ondemand_video_outlined),SizedBox(width: 10,),
              Icon(Icons.phonelink),
            ],
          ),
        )

          ],
        ),
      ),
    );
  }
}
