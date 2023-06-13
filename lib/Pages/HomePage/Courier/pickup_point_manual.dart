

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'OrderConfirmationHomePickup.dart';

class PickUpPointManual extends StatefulWidget{

  final String receiversPhoneNo;
  final String receiversName;
  final String district;
  final String thana;
  final String country;
  final String fullAddress;
  final double courierWaight;
  final String courierType;

  final String senderPhoneNumber;
  final String senderName;

  const PickUpPointManual({super.key, required this.receiversPhoneNo, required this.receiversName, required this.district, required this.thana, required this.country, required this.fullAddress, required this.courierWaight, required this.courierType, required this.senderPhoneNumber, required this.senderName});



  @override
  State<PickUpPointManual> createState() => _PickUpPointManualState();
}

class _PickUpPointManualState extends State<PickUpPointManual> {
  List<String> list_District = <String>['Select District','Bagerhat',
    'Bandarban',
    'Barguna' ,
    'Barisal'  ,
    'Bhola'     ,
    'Bogra '     ,
    'Brahmanbaria',
    'Chandpur     ',
    'Chittagong    ',
    'Chuadanga      ',
    'Comilla         ',
    'Cox''s Bazar     ',
    'Dhaka',
    'Dinajpur',
    'Faridpur',
    'Feni     ',
    'Gaibandha ',
    'Gazipur',
    'Gopalganj',
    'Habiganj  ',
    'Jamalpur',
    'Jessore ' ,
    'Jhalokati' ,
    'Jhenaidah ' ,
    'Joypurhat  ' ,
    'Khagrachari ' ,
    'Khulna       ' ,
    'Kishoreganj',
    'Kurigram    ',
    'Kushtia      ',
    'Lakshmipur    ',
    'Lalmonirhat    ',
    'Madaripur',
    'Magura    ',
    'Manikganj',
    'Maulvibazar',
    'Meherpur    ',
    'Munshiganj',
    'Mymensingh',
    'Naogaon    ',
    'Narail      ',
    'Narayanganj',
    'Narsingdi',
    'Natore    ',
    'Nawabganj  ',
    'Netrokona',
    'Nilphamari',
    'Noakhali   ',
    'Pabna       ',
    'Panchagarh   ',
    'Patuakhali    ',
    'Pirojpur       ',
    'Rajbari',
    'Rajshahi',
    'Rangamati',
    'Rangpur   ',
    'Satkhira   ',
    'Shariatpur',
    'Sherpur',
    'Sirajgonj',
    'Sunamganj ',
    'Sylhet     ',
    'Tangail     ',
    'Thakurgaon   ',
  ];

  String dropdownValue_District = 'Select District' ;

  List<String> list_Thana = <String>['Select Thana/locality',
    'Abhaynagar',
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

  String dropdownValue_Thana = 'Select Thana/locality';

  //TextEditingController Sender_phone= TextEditingController();
  TextEditingController Sender_address = TextEditingController();
  //TextEditingController SenderName=TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

      appBar: AppBar(
        title: Text("Pickup Point"),
      ),

      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [


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
                                items: list_Thana.map<DropdownMenuItem<String>>((String value) {
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

              // Padding(
              //   padding: const EdgeInsets.all(16.0),
              //   child: TextField(
              //     cursorColor: Colors.red,
              //     decoration: const InputDecoration(
              //       focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey, width: 1.0),),
              //       enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey, width: 1.0),),
              //       labelText: 'Enter Sender Name',
              //       labelStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.normal, color: Colors.grey
              //       ),
              //     ),
              //     controller: SenderName,
              //     onSubmitted: (String value) {
              //       debugPrint(value);
              //     },
              //   ),
              // ),

              // Padding(
              //   padding: const EdgeInsets.all(16.0),
              //   child: TextField(
              //     cursorColor: Colors.red,
              //     decoration: const InputDecoration(
              //       focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey, width: 1.0),),
              //       enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey, width: 1.0),),
              //       labelText: 'Sender Phone Number ',
              //       labelStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.normal, color: Colors.grey
              //       ),
              //       suffixIcon: Icon(Icons.perm_contact_cal,color: Colors.grey,size: 26,),
              //     ),
              //     controller: Sender_phone,
              //     onSubmitted: (String value) {
              //       debugPrint(value);
              //     },
              //   ),
              // ),



              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  maxLines: 3,
                  cursorColor: Colors.red,
                  decoration: const InputDecoration(

                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey, width: 1.0),),
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey, width: 1.0),),
                    labelText: 'Enter full address',
                    labelStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.normal, color: Colors.grey
                    ),
                  ),
                  controller: Sender_address,
                  onSubmitted: (String value) {
                    debugPrint(value);
                  },
                ),
              ),







              // Container(
              //   decoration: BoxDecoration(
              //     border: Border.all(
              //       width: 1
              //     )
              //   ),
              //   margin: EdgeInsets.symmetric(horizontal: 10),
              //   child: TextField(
              //     maxLines: 3,
              //
              //     decoration: InputDecoration(
              //
              //     ),
              //
              //   ),
              // ),




              ElevatedButton(onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return OrderConfirmation(
                        receiversPhoneNo: widget.receiversPhoneNo,
                        receiversName: widget.receiversName,
                        fullAddress: widget.fullAddress,
                        courierWaight: widget.courierWaight,
                        courierType: widget.courierType,
                        district: widget.district,
                        thana: widget.thana,
                        country: widget.country,
                        senderPhoneNumber: widget.senderPhoneNumber ,
                        SenderName: widget.senderName,
                        SenderfullAddress: Sender_address.text,
                        SenderThana: dropdownValue_Thana.toString(),
                        SendrDistrict: dropdownValue_District,



                      );//const AddPickUpPage();
                    },
                  ),
                );
              }, child: Text("Confirm PicKup")),




            ],
          ),
        ),
      ),
    );
  }
}