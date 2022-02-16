import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/main.dart';

class SecondScreen extends StatelessWidget {

  int id_ord;

  SecondScreen(this.id_ord);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(InfoOrd[id_ord].name_ord)),
        body: Container(
            padding: EdgeInsets.only(top:25, left:10, right:10),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Дата добавления: ' + InfoOrd[id_ord].date_add,
                      textDirection: TextDirection.ltr,
                      textAlign: TextAlign.left,
                      style: const TextStyle(color: Colors.purple,
                          fontSize: 26
                      )),
                  Text('Статус: ' + InfoOrd[id_ord].info_status,
                      textDirection: TextDirection.ltr,
                      textAlign: TextAlign.left,
                      style: const TextStyle(color: Colors.purple,
                          fontSize: 26
                      )),
                  Text('Гарантия: ' + InfoOrd[id_ord].warranty,
                      textDirection: TextDirection.ltr,
                      textAlign: TextAlign.left,
                      style: const TextStyle(color: Colors.purple,
                          fontSize: 26
                      )),
                  Text('Телефон: ' + InfoOrd[id_ord].phone_number.toString(),
                      textDirection: TextDirection.ltr,
                      textAlign: TextAlign.left,
                      style: const TextStyle(color: Colors.purple,
                          fontSize: 26
                      )),
                  Text('Полная информация: ' + InfoOrd[id_ord].breakdown_info,
                      textDirection: TextDirection.ltr,
                      textAlign: TextAlign.left,
                      style: const TextStyle(color: Colors.purple,
                          fontSize: 26
                      ))
                ])
        )
    );
  }
}