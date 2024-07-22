import 'package:flutter/material.dart';
import 'package:flutter_app/pages/favorite.dart';
import 'package:flutter_app/pages/menu.dart';
import 'package:flutter_app/pages/profile.dart';
import 'package:flutter_app/pages/splashcreen.dart';
import 'package:flutter_app/pages/transaksi_peminjaman.dart';
import 'dart:ui'; // For ImageFilter

void main() => runApp(Utama());

class Utama extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: loding(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    Menu(), // Placeholder widget for Home
    peminjaman(), // Assuming you have a BukuPage widget
    Favorite(), // Placeholder widget for Events
    ProfileScreen(), // Placeholder widget for Profile
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home), // Corrected Icons to Icons.home
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book), // Corrected Icons to Icons.book
            label: 'Transaksi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark), // Corrected Icons to Icons.event
            label: 'Events',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person), // Corrected Icons to Icons.person
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromARGB(255, 66, 248, 193),
        unselectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}
