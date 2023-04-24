import 'dart:convert';

List<vegmodel> userModelFromJson(String str) =>
    List<vegmodel>.from(json.decode(str).map((x) => vegmodel.fromJson(x)));

String userModelToJson(List<vegmodel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class vegmodel {
  vegmodel({
    required this.id,
    required this.name,
    required this.desc,
    required this.isDone,
    required this.date
  });

  int id;
  String name;
  String desc;
  String isDone;
  DateTime date;


  factory vegmodel.fromJson(Map<String, dynamic> json) => vegmodel(
    id: json["id"],
    name: json["name"],
    desc: json["desc"],
    isDone: json["isDone"],
    date: json["date"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "desc": desc,
    "isDone": isDone,
    "date":date

  };
}

