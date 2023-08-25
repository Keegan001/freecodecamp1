import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:freecodecamp1/pages/info.dart';
import 'package:flutter_svg/flutter_svg.dart';

class contactsPage extends StatefulWidget {
  const contactsPage({super.key});

  @override
  State<contactsPage> createState() => _contactsPageState();
}

class _contactsPageState extends State<contactsPage> {
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
          'Welcome',
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          // direction: Axis.vertical,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Contacts',
              textScaleFactor: 2,
            ),
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
                      return ListTile(
                          title: Text(
                              contacts?[index].displayName.toString() ?? ""),
                          subtitle: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: contacts?[index].phones?.length ?? 0,
                            itemBuilder: (context, i) {
                              return Text(contacts?[index]
                                      .phones?[i]
                                      .value
                                      .toString() ??
                                  '');
                            },
                          )
                          //Text(
                          //     contacts?[index].phones?.toString() ?? ''),
                          );
                    },
                  );
                }
                return const SizedBox.shrink();
              },
              future: importContacts(),
            )
            // Flexible(
            //    print(snapshot);
            // if (snapshot.connectionState == ConnectionState.waiting) {
            //   return const Center(
            //       child: const CircularProgressIndicator.adaptive());
            // }
            // if (snapshot.hasError) {
            //   return Text(snapshot.error.toString());
            // }
            //   flex: 9,
            //   child: ListView.builder(
            //     shrinkWrap: true,
            //     itemCount: contactlist.length,
            //     itemBuilder: (context, index) {
            //       Contact contact = contactlist[index];
            //       return ListTile(
            //         title: Text(contact.displayName.toString()),
            //         subtitle: Text(contact.phones?[0].value.toString() ?? ''),
            //       );
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

class details extends StatelessWidget {
  const details({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Info'),
      ),
      body: const Center(
        child: Text('Info Page'),
      ),
    );
  }
}
