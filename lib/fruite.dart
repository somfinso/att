import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class FruitItem extends StatelessWidget {
  FruitItem({required this.item});

  final Fruit item;

  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(2),
        height: 140,
        child: Card(
          elevation: 5,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Image.network(
                  this.item.date as String,
                  width: 200,
                ),
                Expanded(
                    child: Container(
                        padding: EdgeInsets.all(5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text(this.item.name,
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text("id:${this.item.id}"),
                            Text("quantity:${this.item.date}"),
                          ],
                        )))
              ]),
        ));
  }
}


class FruitList extends StatelessWidget {
  final List<Fruit> items;

  FruitList({required this.items});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return FruitItem(item: items[index]);
      },
    );
  }
}



class MyHomePage extends StatelessWidget {
  final String title;
  final Future<List<Fruit>> products;

  MyHomePage({ required this.title, required this.products});

  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF4CAF50),
          title: Text("GeeksForGeeks"),
        ),
        body: Center(
          child: FutureBuilder<List<Fruit>>(
            future: products,
            builder: (context, snapshot) {
              if (snapshot.hasError) print(snapshot.error);
              return Text(snapshot.data as String);

            },
          ),
        )),);
  }
}

String url = "Your_URL";
Future<List<Fruit>> fetchFruit() async {
  final response = await http.get(Uri.parse(url));
  var data = jsonDecode(response.body);
  return data;
}


class Fruit {
  final int id;
  final String name;
  final String desc;
  final DateTime date;

  Fruit(
      this.id,
      this.name,
      this.desc,
      this.date,
      );
  factory Fruit.fromMap(Map<String, dynamic> json) {
    return Fruit(json['id'], json['name'], json['desc'], json['date']);
  }
  factory Fruit.fromJson(Map<String, dynamic> json) {
    return Fruit(json['id'], json['name'], json['desc'], json['date']);
  }
}