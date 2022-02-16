import 'dart:convert';

import 'package:flutter/cupertino.dart';

class OrdJ {
  int id;
  String name_ord;
  String date_add;
  int price;
  String breakdown_info;
  String surname;
  String name;
  String patronymic;
  int phone_number;
  String info_status;
  String warranty;
  String Date_add_warranty;
  String validity;
  String address;

  OrdJ({
  required this.id,
  required this.name_ord,
  required this.date_add,
  required this.price,
  required this.breakdown_info,
  required this.surname,
  required this.name,
  required this.patronymic,
  required this.phone_number,
  required this.info_status,
  required this.warranty,
  required this.Date_add_warranty,
  required this.validity,
  required this.address});

  factory OrdJ.fromJson(int num,List<dynamic> json) {
    return OrdJ(
      id: json[num]['id'],
      name_ord: json[num]['name_ord'],
      date_add: json[num]['date_add_ord'],
      price: json[num]['price'],
      breakdown_info: json[num]['breakdown_info'],
      surname: json[num]['client']['surname'],
      name: json[num]['client']['name'],
      patronymic: json[num]['client']['patronymic'],
      phone_number: json[num]['client']['phone_number'],
        address: json[num]['client']['address'],
      info_status: json[num]['status']['info_status'],
      warranty: json[num]['warranty']['warranty'],
      Date_add_warranty: json[num]['warranty']['date_add'],
      validity: json[num]['warranty']['validity']
    );
  }






}