import 'package:flutter/material.dart';

class ToDo {
  late int id;
  late String title;
  late String desc;
  late bool isDone;
  late String date;

  ToDo(
      {required this.id,
      required this.title,
      required this.desc,
      required this.isDone,
      required this.date});
}

class todocontainer extends StatelessWidget {
  late final String title;
  late final int id;
  late final String desc;
  late final bool isDone;
  late final String date;
  late final Function fc;

  todocontainer(
      {required this.title,
      required this.id,
      required this.desc,
      required this.isDone,
      required this.date,
      required this.fc});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(12),
                  topRight: Radius.circular(12))),
          color: Colors.white70,
          child: ListTile(
              title: Text(title),
              leading: CircleAvatar(
                child: Text("$id"),
              ),
              subtitle: Text(desc),
              trailing: IconButton(
                onPressed: () =>fc(),
                icon: Icon(Icons.delete),
              )),
        )
      ],
    );
  }
}
