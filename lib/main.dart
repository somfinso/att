import 'dart:convert';
import 'package:apitester/Restruant/rest.dart';
import 'package:apitester/veg.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Restruant/cc.dart';
import 'api.dart';
import 'model.dart';
import 'item.dart';
import 'package:apitester/Restruant/rest.dart';
import 'fruite.dart' as f;
import 'TEST/test.dart';

void main() => runApp(rest());

class app extends StatefulWidget {
  @override
  State<app> createState() => _appState();
}

class _appState extends State<app> {
  List<ToDo> mytodo = [];
  bool isLoading = true;

  void fetchdata() async {
    try {
      http.Response res = await http.get(Uri.parse(api));
      var data = jsonDecode(res.body);
      data.forEach((todo) {
        ToDo t = ToDo(
            id: todo['id'],
            title: todo['title'],
            desc: todo['desc'],
            isDone: todo['isDone'],
            date: todo['date']);
        // mytodo.add(todo);

        mytodo.add(t);
        //print(mytodo);
        setState(() {
          isLoading = false;
        });
        print(mytodo);
      });
    } catch (e) {
      print("bt");
    }
  }

  deletdate(String id) async {
    try {
      http.Response response = await http.delete(Uri.parse(api + '/' + id));

      setState(() {
        mytodo = [];
      });
      fetchdata();
    } catch (e) {
      print('bt');
    }
  }

  @override
  void initState() {
    fetchdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: Text("ap"),
          ),
          body: isLoading
              ? CircularProgressIndicator()
              : ListView(
                  children: mytodo.map((e) {
                    // print("id ${e.id}");
                    return todocontainer(
                      title: e.title,
                      id: e.id,
                      desc: e.desc,
                      isDone: e.isDone,
                      date: e.date,
                      fc: () => deletdate(e.id.toString()),
                    );
                  }).toList(),
                )),
    );
  }
}
