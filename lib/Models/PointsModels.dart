class PointDeals {
   String dealName;
   String discount;
   String date;
   String points;

   PointDeals({required this.dealName, required this.discount,required this.date,required this.points});

  factory PointDeals.fromMap(map) {
    return PointDeals(
      dealName: map['dealName'],
      discount: map['discount'],
      date: map['date'],
      points: map['points'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'dealName': dealName,
      'discount': discount,
      'date': date,
      'points': points,
    };
  }
}