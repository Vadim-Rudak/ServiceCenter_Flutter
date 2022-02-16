import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/main.dart';

class WarrantyPage extends StatelessWidget {

  int id_ord;

  WarrantyPage(this.id_ord);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Гарантия")),
        body: Container(
            padding: EdgeInsets.only(top:25, left:10, right:10),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Гарантия: ' + InfoOrd[id_ord].warranty,
                      textDirection: TextDirection.ltr,
                      textAlign: TextAlign.left,
                      style: const TextStyle(color: Colors.purple,
                          fontSize: 26
                      )),
                  Text('Дата добавления гарантии: ' + InfoOrd[id_ord].Date_add_warranty,
                      textDirection: TextDirection.ltr,
                      textAlign: TextAlign.left,
                      style: const TextStyle(color: Colors.purple,
                          fontSize: 26
                      )),
                  Text('Срок действия: ' + InfoOrd[id_ord].validity,
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