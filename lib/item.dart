import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class item extends StatefulWidget {
  const item({Key? key}) : super(key: key);

  @override
  State<item> createState() => _itemState();
}

class _itemState extends State<item> {
  var u = 'http://127.0.0.1:8000/';
   fetchdata<Future>() async{
    http.Response re = await http.get(Uri.parse(u));
    var res = jsonDecode(re.body);
    return res;

    // res.forEach((rees){
    //   print(rees);
    //   return res;
    // });

    //print(res.runtimeType);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      home: Scaffold(backgroundColor: Colors.cyanAccent,
          body: FutureBuilder(
            future: fetchdata(),
            builder: (context, snapshot,) {
            if(snapshot.hasData){
              return Card(child: Text('${snapshot.data}'),);
            }else{
              print(snapshot.error);
              return CircularProgressIndicator();
            }
          },)
      ),
    );
  }
}
