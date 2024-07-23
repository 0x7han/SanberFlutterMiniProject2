import 'package:flutter/material.dart';
import 'package:sanber_flutter_mini_project_2/model/user.dart';

class ProfileScreen extends StatelessWidget {
  final User user;
  const ProfileScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,

        title: const Text('User Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Column(
                  children: [
                    const Icon(
                      Icons.person_rounded,
                      size: 64,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "${user.name['firstname']} ${user.name['lastname']}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: [
                          const Text(
                            "Profile Info",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          IconButton(
                              onPressed: () {
                                showModalBottomSheet(
                                  isDismissible: false,
                                  context: context,
                                  builder: (BuildContext context) {
                                    return SizedBox(
                                      height: 130,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          ListTile(
                                            title: const Text(
                                              "Profile",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            trailing: IconButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              icon: const Icon(
                                                  Icons.close_outlined),
                                            ),
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 14, vertical: 5),
                                            child: Text(
                                              "This information appears on public pages and can be seen by other users.",
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                              },
                              icon: const Icon(Icons.info_outline))
                        ],
                      ),
                      Table(
                        children: [
                          TableRow(
                            children: [
                              const Text("Name"),
                              Text(
                                "${user.name['firstname']} ${user.name['lastname']}",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              const Text("Username"),
                              Text(
                                user.username,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: [
                          const Text(
                            "Private Info",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          IconButton(
                              onPressed: () {
                                showModalBottomSheet(
                                  isDismissible: false,
                                  context: context,
                                  builder: (
                                    BuildContext context,
                                  ) {
                                    return SizedBox(
                                      height: 130,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          ListTile(
                                            title: const Text(
                                              "Private",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            trailing: IconButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              icon: const Icon(
                                                  Icons.close_outlined),
                                            ),
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 14, vertical: 5),
                                            child: Text(
                                              "This information is personal. Only you can see it and it cannot be shared with anyone.",
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                              },
                              icon: const Icon(Icons.info_outline))
                        ],
                      ),
                      Table(
                        children: [
                          TableRow(
                            children: [
                              const Text("Password"),
                              Text(
                                user.password,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              const Text("Email"),
                              Text(
                                user.email,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              const Text("Phone"),
                              Text(
                                user.phone,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              const Text("Street"),
                              Text(
                                user.address['street'],
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              const Text("City"),
                              Text(
                                user.address['city'],
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              const Text("Zip Code"),
                              Text(
                                user.address['zipcode'],
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              const Text("Geo Location"),
                              Text(
                                'Lat: ${user.address['geolocation']['lat']}\nLong: ${user.address['geolocation']['long']}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
