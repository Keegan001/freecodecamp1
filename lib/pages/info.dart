import 'package:flutter/material.dart';

class info extends StatelessWidget {
  const info({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'About Me',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Container(
        margin: EdgeInsets.only(top: 100, left: 40, right: 40),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Text.rich(
                TextSpan(
                  text: 'Hello, My name Is Divyam Jain. I made this App. The link to the code is ',
                  
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                
              ),
            ),
          ],
        ),
      ),
    );
  }
}
