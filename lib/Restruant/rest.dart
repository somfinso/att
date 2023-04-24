import 'package:apitester/Restruant/bottom.dart';
import 'package:apitester/Restruant/home.dart';
import 'package:apitester/Restruant/other.dart';
import 'package:apitester/Restruant/reportmaster.dart';
import 'package:flutter/material.dart';
import 'apbar.dart';

class rest extends StatefulWidget {
  @override
  State<rest> createState() => _restState();
}

class _restState extends State<rest> {
  List tabel = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16];
  int contentText = 0;


  showAlertDialog(BuildContext context, int n) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("Cancel"),
      onPressed: () {},
    );
    Widget continueButton = TextButton(
      child: Text("Continue"),
      onPressed: () {},
    );

    Widget addButton = TextButton(
      child: Text("add"),
      onPressed:(){
        setState(() {
          contentText++;
          print(contentText);
          
        });
      }
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text('Tabel Number $n'.toString()),
      content: Container(width: 500,
          child: Column(
        children: [
          Text("Order "),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("$contentText"),
                SizedBox(
                  width: 5,
                ),
                Text("Price")
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
            contentText++;
            print(contentText);

          });
        }, child: Text("$contentText"))
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

  int _selectedIndex = 0;
   _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List lc = [home(),report(),other()];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        drawer: Drawer(width: 300.0,
            backgroundColor: Colors.blueAccent,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(topRight: Radius.circular(24.0))),
            child: Column(
              children: [
                SizedBox(height: 23,),
                CircleAvatar(maxRadius: 50.0,
                  child: Text('Logo'),
                ),
                TextButton(onPressed: () {}, child: Text("login"))
              ],
            )),
        appBar: apbar("Denzong Restaurant", true),
        body:
        lc[_selectedIndex],
        bottomNavigationBar:BottomNavigationBar(elevation: 5,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          selectedItemColor: Colors.white,
          backgroundColor: Colors.blueAccent,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                label: 'Home',
                icon: Icon(Icons.home),

                backgroundColor: Colors.green
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.bookmark_add),
                label: 'Report Master',

                backgroundColor: Colors.yellow
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Other',
              backgroundColor: Colors.blue,
            ),
          ],

        ),
      ),
    );
  }
}
