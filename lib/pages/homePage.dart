import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class homePage extends StatelessWidget {
  const homePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: appBar(),
      body: Column(
        children: [
          ProfilePictureFlex(),
          MiddleFlexBody(),
          Flexible(
            flex: 1,
            child: Container(),
          ),
        ],
      ),
    );
  }

//Profile Picture
  Flexible ProfilePictureFlex() {
    return Flexible(
      flex: 2,
      child: Container(
        alignment: Alignment.center,
        child: Center(
          child: CircleAvatar(
            backgroundColor: Colors.grey,
            radius: 100,
            child: SvgPicture.asset(
              'assets/images/default_user.svg',
              height: 300,
              width: 300,
            ),
          ),
        ),
      ),
    );
  }

//Main Body
  Flexible MiddleFlexBody() {
    return Flexible(
      flex: 3,
      child: Container(
        margin: EdgeInsets.only(top: 60, left: 40, right: 40),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Name',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'enter your name',
                    hintStyle: TextStyle(
                      fontStyle: FontStyle.italic,
                    ),
                    filled: true,
                    fillColor: Color.fromARGB(255, 233, 237, 240),
                    contentPadding: EdgeInsets.all(15),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Phone Number',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'enter your phone number',
                    hintStyle: TextStyle(
                      fontStyle: FontStyle.italic,
                    ),
                    filled: true,
                    fillColor: Color.fromARGB(255, 233, 237, 240),
                    contentPadding: EdgeInsets.all(15),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Date Of Birth',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'enter your date of birth',
                    hintStyle: TextStyle(
                      fontStyle: FontStyle.italic,
                    ),
                    filled: true,
                    fillColor: Color.fromARGB(255, 233, 237, 240),
                    contentPadding: EdgeInsets.all(15),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ),
            HomeButtons(),
          ],
        ),
      ),
    );
  }

//Home Buttons
  Padding HomeButtons() {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 173, 140, 128),
            ),
            onPressed: () {},
            child: Text('Save'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 173, 140, 128),
            ),
            onPressed: () {},
            child: Text('Reset'),
          ),
        ],
      ),
    );
  }

//AppBar
  AppBar appBar() {
    return AppBar(
      title: const Text(
        'Profile',
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Colors.white,
      centerTitle: true,
      elevation: 0.0,
      leading: GestureDetector(
        onTap: () {},
        child: Container(
          margin: const EdgeInsets.all(10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: SvgPicture.asset(
            'assets/images/three-dots-svgrepo-com.svg',
            height: 22,
            width: 22,
          ),
        ),
      ),
    );
  }
}
