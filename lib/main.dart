import 'dart:convert';
import 'dart:developer';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:sn_progress_dialog/sn_progress_dialog.dart';
import 'package:flutter/material.dart';
import 'package:untitled/Pages/ClientPage.dart';
import 'package:untitled/Pages/WarrantyPage.dart';
import 'package:untitled/ordJ.dart';
import 'package:untitled/part.dart';
import 'package:untitled/Pages/PartsPage.dart';
import 'Pages/InfoPage.dart';
import 'package:http/http.dart' as http;

  final String IP="192.168.100.4";
  List<OrdJ> InfoOrd = <OrdJ>[];


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const MyHomePage(title: 'Сервис центр'),

    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

String utf8convert(String text) {
List<int> bytes = text.toString().codeUnits;
return utf8.decode(bytes);
}

class _MyHomePageState extends State<MyHomePage> {
  late ProgressDialog pd;

  @override
  void initState() {
    super.initState();
    UpdateList();
  }

  int getSizeJSON (List<dynamic> json){
    return json.length;
  }

  void UpdateList () async{
    final response = await http
        .get(Uri.parse("http://"+ IP +":8080/OrderDao"));

      log(response.body.toString() + "FFF");

      for (int i=0;i<getSizeJSON(jsonDecode(response.body));i++){
        InfoOrd.add(OrdJ.fromJson(i,jsonDecode(utf8convert(response.body))));
      }
      setState(() {});
  }

  void UpDateBtn () async{
    pd = ProgressDialog(context: context);
    pd.show(max: 100, msg: ' Выполняется загрузка');
      InfoOrd.clear();
    final response = await http
        .get(Uri.parse("http://"+ IP +":8080/OrderDao"));

    // if (response.statusCode == 200) {
    log(response.body);

    for (int i=0;i<getSizeJSON(jsonDecode(response.body));i++){
      InfoOrd.add(OrdJ.fromJson(i,jsonDecode(utf8convert(response.body))));
    }
    log(InfoOrd[0].name_ord);
    setState(() {});
    pd.close();

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        actions: <Widget> [
          IconButton(onPressed: UpDateBtn, icon: const Icon(Icons.autorenew_rounded))
        ],
      ),
      body: ordList(),
    );
  }
}


class ordList extends StatelessWidget {

  late ProgressDialog pd;

  void fg (String id, BuildContext context) async{

    final response = await http
        .get(Uri.parse("http://"+ IP +":8080/Detail?id=" + id));

    InfoParts.clear();
    for (int i=0;i<getSizeJSONP(jsonDecode(response.body));i++) {
      InfoParts.add(PartJ.fromJson(i, jsonDecode(utf8convert(response.body))));
    }
    pd.close();
    Navigator.push(context, MaterialPageRoute(builder: (context) => Parts()));
  }

  int getSizeJSONP (List<dynamic> json){
    return json.length;
  }

  details (BuildContext context, int i) {
    pd = ProgressDialog(context: context);
    pd.show(max: 100, msg: ' Выполняется загрузка');
    fg(InfoOrd[i].id.toString(), context);
  }

  Client (BuildContext context, int i) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => ClientPage(i)));
  }

  Warranty (BuildContext context, int i){
    Navigator.push(context, MaterialPageRoute(builder: (context) => WarrantyPage(i)));
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      child: Container(
        child: ListView.builder(
            itemCount: InfoOrd.length,
            itemBuilder: (context, i) {
              return Slidable(
                // Specify a key if the Slidable is dismissible.
                key: const ValueKey(0),

                // The start action pane is the one at the left or the top side.
                startActionPane: ActionPane(
                  // A motion is a widget used to control how the pane animates.
                  motion: ScrollMotion(),
                  // All actions are defined in the children parameter.
                  children: [
                    SlidableAction(

                      onPressed: (_) => details(context, i),
                      backgroundColor: Color(0xFF0392CF),
                      foregroundColor: Colors.white,
                      icon: Icons.construction_rounded,
                      label: 'Детали',

                    ),
                    SlidableAction(
                      onPressed: (_) => Client(context, i),
                      // An action can be bigger than the others.
                      backgroundColor: Color(0xFF7BC043),
                      foregroundColor: Colors.white,
                      icon: Icons.account_box_rounded,
                      label: 'Клиент',
                    ),
                    // A SlidableAction can have an icon and/or a label.
                  ],
                ),

                // The end action pane is the one at the right or the bottom side.
                endActionPane: ActionPane(
                  motion: ScrollMotion(),
                  children: [

                    SlidableAction(
                      onPressed: (_) => Warranty(context, i),
                      backgroundColor: Color(0xFF21B7CA),
                      foregroundColor: Colors.white,
                      icon: Icons.assignment_rounded,
                      label: 'Гарантия',
                    ),
                  ],
                ),

                // The child of the Slidable is what the user sees when the
                // component is not dragged.
                child: ListTile(

                  title: Text(InfoOrd[i].name_ord),
                  subtitle: Text(InfoOrd[i].surname),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => SecondScreen(i)));
                  },
                ),
              );
            },
        ),
      ),
    );
  }
}