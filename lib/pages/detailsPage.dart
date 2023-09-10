import 'package:flutter/material.dart';
import 'package:freecodecamp1/pages/contactsPage.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freecodecamp1/pages/info.dart';

class details extends StatefulWidget {
  details({super.key});

  @override
  State<details> createState() => _detailsState();
}

class _detailsState extends State<details> {
  String name1 = contactsPageState.name;
  String phone1 = contactsPageState.phone;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Contact Details',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 245, 236, 232),
        centerTitle: true,
        elevation: 0.0,
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const info()),
            );
          },
          child: Container(
            margin: const EdgeInsets.all(10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 245, 236, 232),
              borderRadius: BorderRadius.circular(10),
            ),
            child: SvgPicture.asset(
              'assets/images/three-dots-svgrepo-com.svg',
              height: 22,
              width: 22,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Contact Name: ${name1}',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Contact Number: ${phone1}',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
