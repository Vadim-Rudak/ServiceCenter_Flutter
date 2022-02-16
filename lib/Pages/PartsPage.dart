
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/part.dart';

List<PartJ> InfoParts = <PartJ>[];

class Parts extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Детали')),
        body: PartList(),
    );
  }
}


class PartList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: ListView.builder(
            itemCount: InfoParts.length,
            itemBuilder: (context, i){
              return Card(
                elevation: 2,
                margin: EdgeInsets.symmetric(horizontal: 8,vertical: 4),
                child: Container(
                  child: ListTile(
                    title: Text(InfoParts[i].name_detail),
                    subtitle: Text("Цена:" + InfoParts[i].price_detail.toString()),
                  ),
                ),
              );
            }
        ),
      ),
    );
  }
}
