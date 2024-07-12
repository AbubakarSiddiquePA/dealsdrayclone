import 'package:dealsdray/home/screens/cart.dart';
import 'package:dealsdray/home/screens/categories.dart';
import 'package:dealsdray/home/home.dart';
import 'package:dealsdray/home/screens/deals.dart';
import 'package:dealsdray/home/screens/profile.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNavApp extends StatefulWidget {
  const BottomNavApp({super.key});

  @override
  State<BottomNavApp> createState() => _BottomNavAppState();
}

class _BottomNavAppState extends State<BottomNavApp> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static final List<Widget> _widgetOptions = <Widget>[
    const Home(),
    const Categories(),
    const Deals(),
    const Cart(),
    const Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.list),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.dropletSlash),
              label: 'Deals',
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.cartShopping),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.user),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex,
          elevation: 0,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          selectedItemColor: Colors.red,
          onTap: _onItemTapped,
        ),
        floatingActionButton: FloatingActionButton.extended(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          isExtended: true,
          onPressed: () {},
          backgroundColor: Colors.red,
          label: const Text(
            "Chat",
            style: TextStyle(color: Colors.white),
          ),
          icon: const Icon(
            Icons.message,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
