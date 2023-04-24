import 'package:apitester/Restruant/cc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class other extends StatefulWidget {
  const other({Key? key}) : super(key: key);

  @override
  State<other> createState() => _otherState();
}

class _otherState extends State<other> {
  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: (){
      Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage( title: "title"),));
    }, child: Text("data"));
  }
}


