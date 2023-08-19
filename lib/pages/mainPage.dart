import 'package:flutter/material.dart';
import 'package:freecodecamp1/pages/homePage.dart';
import 'package:freecodecamp1/pages/contactsPage.dart';
import 'package:freecodecamp1/pages/weatherPage.dart';

class mainPage extends StatefulWidget {
  const mainPage({super.key});

  @override
  State<mainPage> createState() => _mainPageState();
}

class _mainPageState extends State<mainPage> {
  int index = 0;
  var pages = [
    homePage(),
    contactsPage(),
    weatherPage(),
  ];

  @override
  Widget build(BuildContext context) => finalPage();

  Scaffold finalPage() {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        height: 60,
        selectedIndex: index,
        onDestinationSelected: (index) => setState(() => this.index = index),
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.person_2_outlined),
            label: 'Profile',
          ),
          NavigationDestination(
            icon: Icon(Icons.phone),
            label: 'Contacts',
          ),
          NavigationDestination(
            icon: Icon(Icons.wb_cloudy_outlined),
            label: 'Weather',
          )
        ],
      ),
    );
  }
}
