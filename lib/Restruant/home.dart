import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class home extends StatefulWidget {


  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  List tabel = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16];
  int contentText = 0;
  int _counter = 0;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    showAlertDialog(BuildContext context, int n) {
      int c = 0;
       addition() {
        setState(() {
          c++;
        });
      }
      // set up the buttons
      Widget cancelButton = TextButton(
        child: Text("Cancel"),
        onPressed: ()=>_incrementCounter(),
      );
      Widget continueButton = TextButton(
        child: Text("Continue"),
        onPressed: () {},
      );

      Widget addButton = TextButton(
          child: Text("add"),
          onPressed:(){
            setState(() {
              // contentText++;
              // print(contentText);

            });
          }
      );

      // set up the AlertDialog
      AlertDialog alert = AlertDialog(

        title: Text('Tabel Number $n'.toString()),
        content: Container(width: 500,
            child: Column(
              children: [
                Text("$_counter "),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("contentText"),
                      SizedBox(
                        width: 5,
                      ),
                      Text("$c")
                    ],
                  ),
                )
              ],
            )),
        actions: [
          cancelButton,
          continueButton,
          addButton,
          TextButton(onPressed: (){
            setState(() {

      c++;
      print(c);

            });
          }, child: Text("test"))
        ],
      );

      // show the dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    }
    return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(12.0),
        child: GridView.builder(
          itemCount: tabel.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 4.0,
              mainAxisSpacing: 4.0),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () => showAlertDialog(context, index),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    side: BorderSide(color: Colors.black)),
                color: Colors.lightBlueAccent,
                elevation: 5,
                child: Container(
                    alignment: Alignment.center,
                    child: Text(" Tabel No ${tabel[index] + 1}")),
              ),
            );
          },
        ));
  }
}
