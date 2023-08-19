import 'package:flutter/material.dart';
import 'package:freecodecamp1/pages/contactsPage.dart';
import 'package:freecodecamp1/pages/homePage.dart';
import 'package:freecodecamp1/pages/weatherPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: mainHomePage(),
    );
  }
}

class mainHomePage extends StatefulWidget {
  const mainHomePage({super.key});

  @override
  State<mainHomePage> createState() => _mainHomePageState();
}

int currentindex = 0;
PageController pC = PageController(initialPage: 0);

class _mainHomePageState extends State<mainHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pC,
        onPageChanged: (value) {
          setState(() {
            currentindex = value;
          });
        },
        children: [
          homePage(),
          contactsPage(),
          weatherPage(),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentindex,
        elevation: 0.0,
        height: 80,
        backgroundColor: Color.fromARGB(255, 173, 140, 128),
        onDestinationSelected: (value) {
          pC.animateToPage(
            value,
            duration: Duration(milliseconds: 500),
            curve: Curves.decelerate,
          );
        },
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
