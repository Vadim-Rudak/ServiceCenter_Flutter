import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/main.dart';

class ClientPage extends StatelessWidget {

  int id_ord;

  ClientPage(this.id_ord);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Данные о клиенте")),
        body: Container(
            padding: EdgeInsets.only(top:25, left:10, right:10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
              Text('Фамилия: ' + InfoOrd[id_ord].surname,
                  textDirection: TextDirection.ltr,
                  textAlign: TextAlign.left,
                  style: const TextStyle(color: Colors.purple,
                      fontSize: 26
                  )),
              Text('Имя: ' + InfoOrd[id_ord].name,
                  textDirection: TextDirection.ltr,
                  textAlign: TextAlign.left,
                  style: const TextStyle(color: Colors.purple,
                      fontSize: 26
                  )),
              Text('Отчество: ' + InfoOrd[id_ord].patronymic,
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
              Text('Адрес: ' + InfoOrd[id_ord].address,
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