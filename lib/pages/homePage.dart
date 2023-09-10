import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freecodecamp1/pages/info.dart';
import 'package:shared_preferences/shared_preferences.dart';

class homePage extends StatefulWidget {
  homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
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
      ),
      body: ListView(
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

  @override
  void initState() {
    super.initState();
    initPrefs();
  }

  initPrefs() async {
    prefs = await SharedPreferences.getInstance();
    loadSavedData();
  }

  final _nameController = TextEditingController();

  final _phone_numberController = TextEditingController();

  final _date_of_birthController = TextEditingController();

  late SharedPreferences prefs;

//Main Body
  Flexible MiddleFlexBody() {
    return Flexible(
      flex: 3,
      child: Container(
        margin: const EdgeInsets.only(top: 60, left: 40, right: 40),
        child: Column(
          children: [
            const Align(
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
                  controller: _nameController,
                  decoration: InputDecoration(
                    hintText: 'enter your name',
                    hintStyle: const TextStyle(
                      fontStyle: FontStyle.italic,
                    ),
                    filled: true,
                    fillColor: const Color.fromARGB(255, 233, 237, 240),
                    contentPadding: const EdgeInsets.all(15),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10.0),
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
                  controller: _phone_numberController,
                  decoration: InputDecoration(
                    hintText: 'enter your phone number',
                    hintStyle: const TextStyle(
                      fontStyle: FontStyle.italic,
                    ),
                    filled: true,
                    fillColor: const Color.fromARGB(255, 233, 237, 240),
                    contentPadding: const EdgeInsets.all(15),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10.0),
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
                  controller: _date_of_birthController,
                  decoration: InputDecoration(
                    hintText: 'enter your date of birth',
                    hintStyle: const TextStyle(
                      fontStyle: FontStyle.italic,
                    ),
                    filled: true,
                    fillColor: const Color.fromARGB(255, 233, 237, 240),
                    contentPadding: const EdgeInsets.all(15),
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

  void loadSavedData() {
    String name = prefs.getString('name') ?? '';
    String phoneNumber = prefs.getString('phone_number') ?? '';
    String dateOfBirth = prefs.getString('date_of_birth') ?? '';

    _nameController.text = name;
    _phone_numberController.text = phoneNumber;
    _date_of_birthController.text = dateOfBirth;
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
              backgroundColor: const Color.fromARGB(255, 173, 140, 128),
            ),
            onPressed: () async {
              String name = _nameController.text;
              String phone_number = _phone_numberController.text;
              String date_of_birth = _date_of_birthController.text;

              //Save the data in shared preferences
              SharedPreferences prefs = await SharedPreferences.getInstance();
              await prefs.setString('name', name);
              await prefs.setString('phone_number', phone_number);
              await prefs.setString('date_of_birth', date_of_birth);
            },
            child: const Text('Save'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 173, 140, 128),
            ),
            onPressed: () {
              _nameController.clear();
              _phone_numberController.clear();
              _date_of_birthController.clear();
            },
            child: const Text('Reset'),
          ),
        ],
      ),
    );
  }
}
