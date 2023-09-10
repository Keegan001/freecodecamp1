import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:freecodecamp1/pages/info.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freecodecamp1/pages/detailsPage.dart';

class contactsPage extends StatefulWidget {
  const contactsPage({super.key});

  @override
  State<contactsPage> createState() => contactsPageState();
}

class contactsPageState extends State<contactsPage> {
  static late String name;
  static late String phone;
  @override
  void initState() {
    super.initState();
    importContacts();
  }

  Future<List<Contact>?> importContacts() async {
    List<Contact>? contactlist = await ContactsService.getContacts();
    return contactlist;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Contacts',
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
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(color: Color.fromARGB(255, 245, 236, 232)),
          padding: EdgeInsets.only(
            left: 20.0,
            top: 20.0,
            bottom: 30.0,
            right: 20.0,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // const Text(
              //   'Contacts',
              //   textScaleFactor: 2,
              // ),
              FutureBuilder(
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Text(snapshot.error.toString());
                  }
                  if (snapshot.connectionState == ConnectionState.done) {
                    List<Contact>? contacts = snapshot.data;
                    return ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: contacts?.length ?? 0,
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border(
                              bottom: BorderSide(
                                  color: Color.fromARGB(255, 245, 236, 232),
                                  width: 10),
                            ),
                          ),
                          child: ListTile(
                            tileColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                              side: BorderSide(
                                color: Color.fromARGB(255, 245, 236, 232),
                              ),
                            ),
                            title: Text(
                                contacts?[index].displayName.toString() ?? ""),
                            subtitle: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: contacts?[index].phones?.length ?? 0,
                              itemBuilder: (context, i) {
                                return ListTile(
                                  onTap: () {
                                    phone = contacts?[index]
                                            .phones![i]
                                            .value!
                                            .toString() ??
                                        '';
                                    name = contacts?[index]
                                            .displayName
                                            .toString() ??
                                        "";

                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => details()),
                                    );
                                  },
                                  title: Text(contacts?[index]
                                          .phones?[i]
                                          .value
                                          .toString() ??
                                      ''),
                                );
                              },
                            ),
                          ),
                        );
                      },
                    );
                  }
                  return const SizedBox.shrink();
                },
                future: importContacts(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
