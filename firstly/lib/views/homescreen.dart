import 'package:firstly/views/bookings.dart';
import 'package:firstly/views/dashboard.dart';
import 'package:firstly/views/profile.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int _page = 0;
  final List<Widget> _views = [
  Dashboard(),
  Bookings(),
  ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _views[_page],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        items: const [
          Icon(Icons.home, size: 30),
              Icon(Icons.search, size: 30),
           Icon(Icons.person, size: 30),
          // Icon(Icons.search, size: 30)
          // Icon(Icons.dashboard, size: 30),
          // Icon(Icons.shopping_cart, size: 30),
          // Icon(Icons.person, size: 30),
        ],
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
      ),
    );
  }
}
