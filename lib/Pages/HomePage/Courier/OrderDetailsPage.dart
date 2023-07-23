import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ride_sharing/Pages/HomePage/Courier/pickup_point_manual.dart';
import 'package:ride_sharing/Pages/HomePage/Courier/data_list.dart';
import 'package:sizer/sizer.dart';

import 'AddPickUpPage.dart';
import 'GetQuotationPageView.dart';
import 'OrderConfirmationHomePickup.dart';
import 'SelectCityList.dart';
import 'SelectZoneList.dart';

class OrderDetailsPage extends StatefulWidget {
  final String phoneNumber;
  final String senderName;


  const OrderDetailsPage({Key? key, required this.phoneNumber, required this.senderName}) : super(key: key);

  @override
  State<OrderDetailsPage> createState() => _OrderDetailsPageState();
}

class _OrderDetailsPageState extends State<OrderDetailsPage> {
  TextEditingController _phone =TextEditingController();
  TextEditingController _name =TextEditingController();
  TextEditingController _address =TextEditingController();
  static final _area =TextEditingController();
  static final _zone =TextEditingController();
  static final _city =TextEditingController();
  static final _itemsValue =TextEditingController();
 double _value = 0.5;
 double min=0.5;
 double max=5.0;



  List<String> list_District = <String>['Select District','Bagerhat',
    'Bandarban',
    'Barguna' ,
    'Barisal',
    'Bhola',
    'Bogra ',
    'Brahmanbaria',
    'Chandpur',
    'Chittagong',
    'Chuadanga',
    'Comilla ',
    'Cox''s Bazar',
    'Dhaka',
    'Dinajpur',
    'Faridpur',
    'Feni',
    'Gaibandha',
    'Gazipur',
    'Gopalganj',
    'Habiganj',
    'Jamalpur',
    'Jessore',
    'Jhalokati',
    'Jhenaidah',
    'Joypurhat',
    'Khagrachari',
    'Khulna',
    'Kishoreganj',
    'Kurigram',
    'Kushtia',
    'Lakshmipur',
    'Lalmonirhat',
    'Madaripur',
    'Magura',
    'Manikganj',
    'Maulvibazar',
    'Meherpur',
    'Munshiganj',
    'Mymensingh',
    'Naogaon',
    'Narail',
    'Narayanganj',
    'Narsingdi',
    'Natore',
    'Nawabganj',
    'Netrokona',
    'Nilphamari',
    'Noakhali',
    'Pabna',
    'Panchagarh',
    'Patuakhali',
    'Pirojpur',
    'Rajbari',
    'Rajshahi',
    'Rangamati',
    'Rangpur',
    'Satkhira',
    'Shariatpur',
    'Sherpur',
    'Sirajgonj',
    'Sunamganj ',
    'Sylhet',
    'Tangail',
    'Thakurgaon',];
  String dropdownValue_District = 'Select District' ;

  List<String> list_Thana = <String>['Select Thana/locality','Abhaynagar',
    'Adamdighi',
    'Aditmari',
    'Agailjhara',
    'Ajmiriganj',
    'Akhaura',
    'Akkelpur',
    'Alamdanga',
    'Alfadanga',
    'Alikadam',
    'Amtali',
    'Anwara',
    'Araihazar',
    'Ashuganj',
    'Assasuni',
    'Atghoria',
    'Atpara',
    'Atrai',
    'Atwari',
    'Austagram',
    'Babuganj',
    'Badalgachi',
    'Badargonj',
    'Bagatipara',
    'Bagerhat Sadar',
    'Bagha',
    'Baghaichari',
    'Bagherpara',
    'Bagmara',
    'Bahubal',
    'Bajitpur',
    'Bakerganj',
    'Balaganj',
    'Baliadangi',
    'Baliakandi',
    'Bamna',
    'Banaripara',
    'Bancharampur',
    'Bandar',
    'Bandarban Sadar',
    'Baniachong',
    'Banshkhali',
    'Baraigram',
    'Barguna Sadar',
    'Barhatta',
    'Barisal Sadar',
    'Barkal',
    'Barlekha',
    'Barura',
    'Basail',
    'Bauphal',
    'Beanibazar',
    'Begumganj',
    'Belabo',
    'Belaichari',
    'Belkuchi',
    'Bera',
    'Betagi',
    'Bhairab',
    'Bhaluka',
    'Bhandaria',
    'Bhanga',
    'Bhangura',
    'Bhedarganj',
    'Bheramara',
    'Bhola Sadar',
    'Bholahat',
    'Bhuapur',
    'Bhurungamari',
    'Bijoynagar',
    'Birampur',
    'Birganj',
    'Birol',
    'Bishwambarpur',
    'Bishwanath',
    'Boalkhali',
    'Boalmari',
    'Bochaganj',
    'Boda',
    'Bogra Sadar',
    'Bokshiganj',
    'Borhan Sddin',
    'Botiaghata',
    'Brahmanbaria Sadar',
    'Brahmanpara',
    'Burichang',
    'Chakaria',
    'Chandanaish',
    'Chandina',
    'Chandpur Sadar',
    'Chapainawabganj Sadar',
    'Charbhadrasan',
    'Charfesson',
    'Charghat',
    'Charrajibpur',
    'Chatkhil',
    'Chatmohar',
    'Chauddagram',
    'Chauhali',
    'Chhagalnaiya',
    'Chhatak',
    'Chilmari',
    'Chirirbandar',
    'Chitalmari',
    'Chougachha',
    'Chuadanga Sadar',
    'Chunarughat',
    'Comilla Sadar',
    'Companiganj',
    'Companiganj',
    'Coxsbazar Sadar',
    'Daganbhuiyan',
    'Dakop',
    'Dakshinsurma',
    'Damudya',
    'Damurhuda',
    'Dasar',
    'Dashmina',
    'Daudkandi',
    'Daulatpur',
    'Debhata',
    'Debidwar',
    'Debiganj',
    'Delduar',
    'Derai',
    'Dewangonj',
    'Dhamoirhat',
    'Dhamrai',
    'Dhanbari',
    'Dharmapasha',
    'Dhobaura',
    'Dhunot',
    'Dighinala',
    'Digholia',
    'Dimla',
    'Dinajpur Sadar',
    'Dohar',
    'Domar',
    'Doulatkhan',
    'Doulatpur',
    'Dowarabazar',
    'Dumki',
    'Dumuria',
    'Dupchanchia',
    'Durgapur',
    'Durgapur',
    'Eidgaon',
    'Fakirhat',
    'Faridgonj',
    'Faridpur',
    'Faridpur Sadar',
    'Fatikchhari',
    'Fenchuganj',
    'Feni Sadar',
    'Fulbari',
    'Fulbaria',
    'Fulgazi',
    'Fultola',
    'Gabtali',
    'Gafargaon',
    'Gaibandha Sadar',
    'Gajaria',
    'Galachipa',
    'Gangachara',
    'Gangni',
    'Gazipur Sadar',
    'Ghatail',
    'Ghoraghat',
    'Gior',
    'Goalanda',
    'Gobindaganj',
    'Godagari',
    'Golapganj',
    'Gomostapur',
    'Gopalganj Sadar',
    'Gopalpur',
    'Gosairhat',
    'Gouripur',
    'Gournadi',
    'Gowainghat',
    'Guimara',
    'Gurudaspur',
    'Habiganj Sadar',
    'Haimchar',
    'Hajiganj',
    'Hakimpur',
    'Haluaghat',
    'Harinakundu',
    'Haripur',
    'Harirampur',
    'Hathazari',
    'Hatia',
    'Hatibandha',
    'Hizla',
    'Homna',
    'Hossainpur',
    'Ishurdi',
    'Islampur',
    'Iswarganj',
    'Itna',
    'Jagannathpur',
    'Jaintiapur',
    'Jaldhaka',
    'Jamalganj',
    'Jamalpur Sadar',
    'Jessore Sadar',
    'Jhalakathi Sadar',
    'Jhenaidah Sadar',
    'Jhenaigati',
    'Jhikargacha',
    'Jibannagar',
    'Joypurhat Sadar',
    'Juraichari',
    'Juri',
    'Kabirhat',
    'Kachua',
    'Kachua',
    'Kahaloo',
    'Kaharol',
    'Kalai',
    'Kalapara',
    'Kalaroa',
    'Kalia',
    'Kaliakair',
    'Kaliganj',
    'Kalihati',
    'Kalkini',
    'Kalmakanda',
    'Kalukhali',
    'Kamalnagar',
    'Kamarkhand',
    'Kamolganj',
    'Kanaighat',
    'Kapasia',
    'Kaptai',
    'Karimgonj',
    'Karnafuli',
    'Kasba',
    'Kashiani',
    'Kathalia',
    'Katiadi',
    'Kaunia',
    'Kawkhali',
    'Kazipur',
    'Kendua',
    'Keraniganj',
    'Keshabpur',
    'Khagrachhari Sadar',
    'Khaliajuri',
    'Khansama',
    'Khetlal',
    'Khoksa',
    'Kishoreganj Sadar',
    'Kishorganj',
    'Kotalipara',
    'Kotchandpur',
    'Koyra',
    'Kulaura',
    'Kuliarchar',
    'Kumarkhali',
    'Kurigram Sadar',
    'Kushtia Sadar',
    'Kutubdia',
    'Lakhai',
    'Laksam',
    'Lakshmipur Sadar',
    'Lalmai',
    'Lalmohan'
        'Lalmonirhat Sadar',
    'Lalpur',
    'Lama',
    'Langadu'
        'Laxmichhari',
    'Lohagara',
    'Lohagara',
    'Louhajanj',
    'Madan',
    'Madarganj',
    'Madaripur Sadar',
    'Madhabpur',
    'Madhukhali',
    'Madhupur',
    'Madhyanagar',
    'Magura Sadar',
    'Manda',
    'Manikchari',
    'Manikganj Sadar',
    'Manirampur',
    'Mathbaria',
    'Matiranga',
    'Matlab North',
    'Matlab South',
    'Meghna',
    'Mehendiganj',
    'Meherpur Sadar',
    'Melandah',
    'Mirpur',
    'Mirsharai',
    'Mirzaganj',
    'Mirzapur',
    'Mithamoin',
    'Mithapukur',
    'Mohadevpur',
    'Mohalchari',
    'Mohammadpur',
    'Moheshkhali',
    'Moheshpur',
    'Mohongonj',
    'Mohonpur',
    'Mollahat',
    'Mongla',
    'Monohardi',
    'Monohargonj',
    'Monpura',
    'Morrelganj',
    'Moulvibazar Sadar',
    'Mujibnagar',
    'Muksudpur',
    'Muktagacha',
    'Muladi',
    'Munshiganj Sadar',
    'Muradnagar',
    'Mymensingh Sadar',
    'Nabiganj',
    'Nabinagar',
    'Nachol',
    'Nagarkanda',
    'Nagarpur',
    'Nageshwari',
    'Naikhongchhari',
    'Nalchity',
    'Naldanga',
    'Nalitabari',
    'Nandail',
    'Nangalkot',
    'Naniarchar',
    'Naogaon Sadar',
    'Narail Sadar',
    'Narayanganj Sadar',
    'Naria',
    'Narsingdi Sadar',
    'Nasirnagar',
    'Natore Sadar',
    'Nawabganj',
    'Nazirpur',
    'Nesarabad',
    'Netrokona Sadar',
    'Niamatpur',
    'Nikli',
    'Nilphamari Sadar',
    'Noakhali Sadar',
    'Nokla',
    'Nondigram',
    'Osmaninagar',
    'Paba',
    'Pabna Sadar',
    'Paikgasa',
    'Pakundia',
    'Palash',
    'Palashbari',
    'Panchagarh Sadar',
    'Panchari',
    'Panchbibi',
    'Pangsa',
    'Parbatipur',
    'Parshuram',
    'Patgram',
    'Pathorghata',
    'Patiya',
    'Patnitala',
    'Patuakhali Sadar',
    'Pekua',
    'Phulbari',
    'Phulchari',
    'Phulpur',
    'Pirgacha',
    'Pirganj',
    'Pirgonj',
    'Pirojpur Sadar',
    'Porsha',
    'Purbadhala',
    'Puthia',
    'Raigonj',
    'Raipur',
    'Raipura',
    'Rajapur',
    'Rajarhat',
    'Rajasthali',
    'Rajbari Sadar',
    'Rajnagar',
    'Rajoir',
    'Ramganj',
    'Ramgarh',
    'Ramgati',
    'Rampal',
    'Ramu',
    'Rangabali',
    'Rangamati Sadar',
    'Rangpur Sadar',
    'Rangunia',
    'Raninagar',
    'Ranisankail',
    'Raozan',
    'Rowangchhari',
    'Rowmari',
    'Ruma',
    'Rupganj',
    'Rupsha',
    'Sadarpur',
    'Sadarsouth',
    'Sadullapur',
    'Saghata',
    'Sakhipur',
    'Saltha',
    'Sandwip',
    'Santhia',
    'Sapahar',
    'Sarail',
    'Sarankhola',
    'Sarishabari',
    'Satkania',
    'Satkhira Sadar',
    'Saturia',
    'Savar',
    'Senbug',
    'Shahjadpur',
    'Shahrasti',
    'Shailkupa',
    'Shajahanpur',
    'Shalikha',
    'Shalla',
    'Shariakandi',
    'Shariatpur Sadar',
    'Sharsha',
    'Sherpur',
    'Sherpur Sadar',
    'Shibaloy',
    'Shibchar',
    'Shibganj',
    'Shibpur',
    'Shyamnagar',
    'Singiar',
    'Singra',
    'Sirajdikhan',
    'Sirajganj Sadar',
    'Sitakunda',
    'Sonagazi',
    'Sonaimori',
    'Sonargaon',
    'Sonatala',
    'South Sunamganj',
    'Sreebordi',
    'Sreemangal',
    'Sreenagar',
    'Sreepur',
    'Subarnachar',
    'Sujanagar',
    'Sunamganj Sadar',
    'Sundarganj',
    'Syedpur',
    'Sylhet Sadar',
    'Tahirpur',
    'Tala',
    'Taltali',
    'Tangail Sadar',
    'Tanore',
    'Taragonj',
    'Tarail',
    'Tarakanda',
    'Tarash',
    'Tazumuddin',
    'Teknaf',
    'Terokhada',
    'Tetulia',
    'Thakurgaon Sadar',
    'Thanchi',
    'Titas',
    'Tongibari',
    'Trishal',
    'Tungipara',
    'Ukhiya',
    'Ulipur',
    'Ullapara',
    'Wazirpur',
    'Zajira',
    'Zakiganj',
    'Zianagar',];
  String dropdownValue_Thana = DataList().Thana1[0][0];//'Select Thana/locality';
  List<String> list_Area = <String>['Select Country','Bangladesh', 'India','Pakistan','Iran','Egypt',
    'Singapore','Myanmar','Philipine','Thailand','China','Japan','South Korea','North Korea','Uganda',
    'Russia',"Italy",'Germany','Canada','Peru','Bolivia','Mexico',
    'Australia','Austria','UKrain','Finland',];
  String dropdownValue_Area = 'Select Country';


  FirebaseDatabase database = FirebaseDatabase.instance;
  DatabaseReference ref = FirebaseDatabase.instance.ref("User_profile");

  // DatabaseReference courierRef= FirebaseDatabase.instance.ref("User_profile").child("Profile").child("User").push();
 //  void addCourierToDatabase(String userId) {
 //    DatabaseReference courierRef=rf.child('profile').child(userId).child('user').child('courier').push();
 //  }

  String _selectedItem ='Percel';

  List<DropdownMenuItem<String>> _dropdownItems = [
    // DropdownMenuItem(
    //   value: 'item1',
    //   child: Row(
    //     children: [
    //       Icon(Icons.add_circle_outline_sharp,color: Colors.red,size: 14,),
    //       SizedBox(width: 8.0),
    //       Text('Select Courier Type'),
    //     ],
    //   ),
    // ),
    DropdownMenuItem(
      value: 'Percel',
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(child: Icon(Icons.shopping_bag_sharp,color: Colors.white,size: 12,),
            backgroundColor: Colors.orange,
            radius: 12,
          ),
          SizedBox(width: 8.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Percel'),
              Text('Non-perishable goods, no fragile, no food items',
                style: TextStyle(fontSize: 10),

              ),
              Divider(thickness: 1,color: Colors.grey,),
            ],
          ),
        ],
      ),
    ),
    DropdownMenuItem(
      value: 'Document',
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
              child: Icon(Icons.library_books_sharp,color: Colors.white,size: 10,),
            backgroundColor: Colors.green.shade900,

            radius: 12,
          ),
          SizedBox(width: 8.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Text('Document'),
              Text('No passport or bank cheques',
              style: TextStyle(fontSize: 10),
              ),

            ],
          ),
        ],
      ),
    ),
  ];


  ///////////////////////////////////////////////////////////




  int DistrictValue = 0;


  //////////////////////////////////////////////////












  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text('Courier Order Details',style: TextStyle(color: Colors.black),),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [



            Divider(color: Colors.blueGrey.shade50,thickness: 4,),
            const SizedBox(height: 5,),
            const Text('    Receiver Details*',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,),),
            //SizedBox(height: 3,),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                cursorColor: Colors.red,
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey, width: 1.0),),
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey, width: 1.0),),
                  labelText: 'Receivers Phone Number ',
                  labelStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.normal, color: Colors.grey
                  ),
                  suffixIcon: Icon(Icons.perm_contact_cal,color: Colors.grey,size: 26,),
                ),
                controller: _phone,
                onSubmitted: (String value) {
                  debugPrint(value);
                },
              ),
            ),




            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                cursorColor: Colors.red,
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey, width: 1.0),),
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey, width: 1.0),),
                  labelText: 'Receivers Name ',
                  labelStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.normal, color: Colors.grey
                  ),
                ),
                controller: _name,
                onSubmitted: (String value) {
                  debugPrint(value);
                },
              ),
            ),
            Divider(color: Colors.blueGrey.shade50,thickness: 4,),
            const SizedBox(height: 5,),
            const Text('    Delivery Address*',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,),),



            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [




                  DropdownButton<int>(
                    items: DataList.District1
                        .map((description, value) {
                      return MapEntry(
                          description,
                          DropdownMenuItem<int>(
                            value: value,
                            child: Text(description+"${value}"),
                          ));
                    })
                        .values
                        .toList(),
                    value: DistrictValue,
                    onChanged: (int? newValue) {
                      if (newValue != null) {
                        setState(() {
                          DistrictValue = newValue;
                        });
                      }
                    },
                  ),








                  Container(
                    height: 58,width: 90.w,
                    //margin: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey,width: 1),
                        borderRadius: BorderRadius.circular(5.0),
                        color: Colors.white
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        child: DropdownButtonHideUnderline(
                          child: ButtonTheme(
                            //alignedDropdown: true,
                            child: DropdownButton<String>(
                              value: dropdownValue_District,
                              icon: const Icon(Icons.arrow_drop_down,size: 20,),
                              //elevation: 16,
                              style: const TextStyle(color: Colors.black),
                              onChanged: (String? value) {
                                setState(() {
                                  dropdownValue_District = value!;
                                });
                              },
                              items: list_District.map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ),

                    ),

                  ),



                  SizedBox(
                    height: 20,
                  ),




                  Container(
                    height: 58,width: 90.w,
                    //margin: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey,width: 1),
                        borderRadius: BorderRadius.circular(5.0),
                        color: Colors.white
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child:   Container(
                        child: DropdownButtonHideUnderline(
                          child: ButtonTheme(
                            //alignedDropdown: true,
                            child: DropdownButton<String>(
                              value: dropdownValue_Thana,
                              icon: const Icon(Icons.arrow_drop_down,size: 20,),
                              //elevation: 16,
                              style: const TextStyle(color: Colors.black),
                              onChanged: (String? value) {
                                setState(() {
                                  dropdownValue_Thana = value!;
                                });
                              },
                              items: DataList().Thana1[DistrictValue].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ),
                    ),

                  ),









                ],
              ),
            ),
            Container(
              height: 58,
              width: 90.w,
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey,width: 1),
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.white
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  child: DropdownButtonHideUnderline(
                    child: ButtonTheme(
                      //alignedDropdown: true,
                      child: DropdownButton<String>(
                        value: dropdownValue_Area,
                        icon: const Icon(Icons.arrow_drop_down,size: 20,),
                        //elevation: 16,
                        style: const TextStyle(color: Colors.black),
                        onChanged: (String? value) {
                          setState(() {
                            dropdownValue_Area = value!;
                          });
                        },
                        items: list_Area.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value,
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
              ),


            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                cursorColor: Colors.red,
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey, width: 1.0),),
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey, width: 1.0),),
                  labelText: 'Enter full address',
                  labelStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.normal, color: Colors.grey
                  ),
                ),
                controller: _address,
                onSubmitted: (String value) {
                  debugPrint(value);
                },
              ),
            ),




            Divider(color: Colors.blueGrey.shade50,thickness: 4,),
            const SizedBox(height: 5,),
            const Text('    Courier Weight*',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,),),
            Container(
              //width: 350,
              child: Slider(
                value: _value,
                autofocus: false,
                min: min,
                max: max,
                divisions: 9,
                activeColor: Colors.red,
                inactiveColor: Colors.red.shade300,
                thumbColor: Colors.red,
               label: _value.toStringAsFixed(1),
                // label: _value.round().toString(),
                onChanged: (  value){
                  setState(() {
                    _value = value.toDouble();
                  });
                },
              ),
            ),
            Row(
              children: const [
                SizedBox(width: 15,),
                Text('0.5 kg'),Spacer(),
                Text('5 kg'), SizedBox(width: 15,),
              ],
            ),
            const Divider(thickness: 1,indent: 6,endIndent: 10,),

        Container(
          width: 380,
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0,right: 16.0,top: 12),
            child: DropdownButtonHideUnderline(
              child: ButtonTheme(
                alignedDropdown: false,
                child: DropdownButton<String>(
                  iconDisabledColor: Colors.transparent,
                  value: _selectedItem,
                  items: _dropdownItems,
                  onChanged: (String? selectedItem) {
                    setState(() {
                      _selectedItem = selectedItem!;
                    });
                  },
                  hint: Text('Select an item'),
                ),
              ),
            ),
          ),
        ),




            const Divider(thickness: 1,indent: 8,endIndent: 9,),
            const SizedBox(height: 8,),
            Center(
              child: SizedBox(height: 50,width: 320,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                  ),
                  onPressed: ()async{


                    // DatabaseReference rf= ref.child(widget.phoneNumber).child("user").child("Courier").push();
                    // DatabaseReference orderRef=ref.child(widget.phoneNumber).child("user").child("Courier").child(_phone.text.toString());
                    //
                    // await orderRef.update({
                    //   "Receiver_Phone_Number": _phone.text,
                    //   "Receiver_Name": _name.text,
                    //   "District": dropdownValue_District.toString(),
                    //   "Thana": dropdownValue_Thana.toString(),
                    //   "Area":dropdownValue_Area.toString(),
                    //   "Full_Address": _address.text,
                    //   "Courier_Weight": _value.toDouble(),
                    //   "Courier_Type":_selectedItem.toString(),
                    // }).then((value) {
                    //



                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return PickUpPointManual(
                              receiversPhoneNo: _phone.text,
                              receiversName: _name.text,
                              district: dropdownValue_District.toString(),
                              thana: dropdownValue_Thana.toString(),
                              country: dropdownValue_Area.toString(),
                              fullAddress: _address.text,
                              courierWaight: _value.toDouble(),
                              courierType: _selectedItem.toString(),

                              senderName: widget.senderName,
                              senderPhoneNumber: widget.phoneNumber,
                            );//const AddPickUpPage();
                          },
                        ),
                      );




                   // });

                  },
                  child: const Text('Confirm',style: TextStyle(fontWeight: FontWeight.normal,fontSize: 16)),
                ),
              ),
            ),
            const SizedBox(height: 15,),
          ],
        ),
      ),
    );
  }
}
