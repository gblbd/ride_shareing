import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelectCategoryPage extends StatefulWidget {
  const SelectCategoryPage({Key? key}) : super(key: key);

  @override
  State<SelectCategoryPage> createState() => _SelectCategoryPageState();
}

class _SelectCategoryPageState extends State<SelectCategoryPage> {
  final categoryItems=['Accounting','Airport','Amusement Park','Apartment Building','Aquarium','Art Gallery',
    'Atm','Bakery','Bank','Bar','Beauty Salon','Book Store','Bus Station','Cafe','Car Dealer','Car Rental',
    'Car Repair','Car Wash','Cemetery','City Hall','Clothing Store','College','Convenience Store', 'Corporate office',
    'CourtHouse','Dentist','Department Store','Doctor','Electrician','Electronics Store','Embassy','Fire Station','florist',
    'Furniture Store','Hospital','Jewelry Store','Laundry','Lawyer','Library','Local Government Office','Locksmith','Lodging',
    'Meal Takeaway','Mosque','Movie theater','Museum','Park','Parking','Pet Store','Pharmacy', 'Physiotherapist','Police',
    'Post Office','Real Estate Agency','Residence','Restaurant','School','Shopping Mall','Spa','Stadium','Storage','Store',
    'Supermarket','Taxi Stand','Temple','Train Station','Travel Agency','University','Veterinary Care','Zoo'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Padding(
        padding: EdgeInsets.only(
                  top: 10,
                  left: 5,
                  right: 5,
                  bottom: MediaQuery.of(context).viewInsets.bottom + 250),
            child: ListView.builder(
            physics: ScrollPhysics(),
            itemCount: categoryItems.length,
            itemBuilder: (context , index){
              return GestureDetector(
                onTap: (){},
                child: ListTile(
                  title: Text(categoryItems[index]),
                ),
              );
            }),
      ),
    );
  }
}
