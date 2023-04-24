import 'package:flutter/material.dart';



BottomNavigationBar btnv(int id,Function fc){
  return  BottomNavigationBar(elevation: 5,
      currentIndex: id,
      onTap: fc(),
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

  );
}