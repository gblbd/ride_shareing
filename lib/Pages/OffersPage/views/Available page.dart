import 'package:flutter/material.dart';

class AvailablePage extends StatefulWidget {
  const AvailablePage({Key? key}) : super(key: key);

  @override
  State<AvailablePage> createState() => _AvailablePageState();
}

class _AvailablePageState extends State<AvailablePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Available Promos',style: TextStyle(
          color: Colors.black),
        ),
        iconTheme: const IconThemeData(
            color: Colors.black),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.blueGrey.shade50,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SizedBox(height: 10,),
              DefaultTabController(
                  length: 3,
                  initialIndex: 0,
                  child: Column(
                    children: [
                      Container(
                        child: TabBar(
                          indicator: BoxDecoration(
                              borderRadius: BorderRadius.circular(50), // Creates border
                              color: Colors.red),
                          labelColor: Colors.white,
                          unselectedLabelColor: Colors.black,
                          indicatorPadding: EdgeInsets.all(8.0),
                          tabs: <Widget>[
                            Tab(text: 'All',),
                            Tab(text: 'Bike',),
                            Tab(text: 'Car',),
                          ],
                        ),
                      ),
                      Container(
                        height: 500,

                        child: TabBarView(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                children: [
                                  Container(
                                    height: 120,
                                    //width: 320,
                                    color: Colors.white,
                                    child: ListTile(
                                      title: Row(
                                        children: [
                                          Text('SPRINT120'),
                                          Spacer(),
                                          Text('Bike'),
                                        ],
                                      ),
                                      subtitle: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('25% off on your next ride in Dhaka! (Up to 120BDT. minimum ride fare: 45BDT)'),
                                          Text('Valid till April 13, 2023'),
                                          TextButton(onPressed: () {  },
                                              child: Text('Add Promo')),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  Container(
                                    height: 120,
                                    //width: 320,
                                    color: Colors.white,
                                    child: ListTile(
                                      title: Row(
                                        children: [
                                          Text('SPRINT120'),
                                          Spacer(),
                                          Text('Car'),
                                        ],
                                      ),
                                      subtitle: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('25% off on your next ride in Dhaka! (Up to 120BDT. minimum ride fare: 45BDT)'),
                                          Text('Valid till April 13, 2023'),
                                          TextButton(onPressed: () {  },
                                          child: Text('Add Promo')),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                children: [
                                  Container(
                                    height: 120,
                                    //width: 320,
                                    color: Colors.white,
                                    child: ListTile(
                                      title: Row(
                                        children: [
                                          Text('SPRINT120'),
                                          Spacer(),
                                          Text('Bike'),
                                        ],
                                      ),
                                      subtitle: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('25% off on your next ride in Dhaka! (Up to 120BDT. minimum ride fare: 45BDT)'),
                                          Text('Valid till April 13, 2023'),
                                          TextButton(onPressed: () {  },
                                              child: Text('Add Promo')),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                children: [
                                  Container(
                                    height: 120,
                                    //width: 320,
                                    color: Colors.white,
                                    child: ListTile(
                                      title: Row(
                                        children: [
                                          Text('SPRINT120'),
                                          Spacer(),
                                          Text('Car'),
                                        ],
                                      ),
                                      subtitle: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('25% off on your next ride in Dhaka! (Up to 120BDT. minimum ride fare: 45BDT)'),
                                          Text('Valid till April 13, 2023'),
                                          TextButton(onPressed: () {  },
                                              child: Text('Add Promo')),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )

                    ],
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
