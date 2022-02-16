import 'dart:convert';

class PartJ {
  int details_id;
  String name_detail;
  int price_detail;

  PartJ({
    required this.details_id,
    required this.name_detail,
    required this.price_detail,
  });

  factory PartJ.fromJson(int num,List<dynamic> json) {
    return PartJ(
      details_id: json[num]['details_id'],
      name_detail: json[num]['name_detail'],
      price_detail: json[num]['price_detail'],
    );
  }
}