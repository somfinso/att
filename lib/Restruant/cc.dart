import 'package:flutter/material.dart';


class MyHomePage extends StatefulWidget {
  MyHomePage({ required this.title});

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int  sent = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  void _sent() {
    setState(() {
      sent++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text('$sent'),
            TextButton(onPressed: (){

                  
                

            }, child: Text("alert"))
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ),
    );
  }
}