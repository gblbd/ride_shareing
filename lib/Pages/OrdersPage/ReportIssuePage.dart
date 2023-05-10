import 'package:flutter/material.dart';

class ReportIssuePage extends StatelessWidget {
  const ReportIssuePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Report Issue',
          style: TextStyle(
              color: Colors.black,
          ),
        ),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      backgroundColor: Colors.grey.shade50,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('WHAT WENT WORNG ?'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.black38,
                        width: 0.2
                      )
                    ),
                    color: Colors.white

                  ),
                  //color: Colors.white,
                  child: TextButton(
                    onPressed: (){},
                    child: Row(
                      children: [
                        Text('Pickup related issue',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),Spacer(),
                        Icon(Icons.arrow_forward_ios_sharp,size: 14,color: Colors.grey,)
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color: Colors.black38,
                              width: 0.2
                          )
                      ),
                      color: Colors.white

                  ),
                  child: TextButton(
                    onPressed: (){},
                    child: Row(
                      children: [
                        Text('Delivery related issue',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),Spacer(),
                        Icon(Icons.arrow_forward_ios_sharp,size: 14,color: Colors.grey,)
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 47,
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color: Colors.black38,
                              width: 0.2
                          )
                      ),
                      color: Colors.white

                  ),
                  child: TextButton(
                    onPressed: (){},
                    child: Row(
                      children: [
                        Text('Pickup/Delivery agent unprofessional related\nissue',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),Spacer(),
                        Icon(Icons.arrow_forward_ios_sharp,size: 14,color: Colors.grey,)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
