import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'EditProfile.dart';
import 'Login_Page.dart';
import 'ProfilePage1.dart';
import 'planning.dart';

class SideBarScreen extends StatelessWidget {
  const SideBarScreen({super.key});
  clearToken() async {
    //
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
  }

  final List drawerMenuListname = const [
    {
      "leading": Icon(
        Icons.account_circle,
        color: Color(0xFF13C0E3),
      ),
      "title": "Profile",
      "trailing": Icon(
        Icons.chevron_right,
      ),
      "action_id": 1,
    },
    {
      "leading": Icon(
        Icons.schedule,
        color: Color(0xFF13C0E3),
      ),
      "title": "Planning",
      "trailing": Icon(Icons.chevron_right),
      "action_id": 2,
    },
    {
      "leading": Icon(
        Icons.notifications_active,
        color: Color(0xFF13C0E3),
      ),
      "title": "Notifications",
      "trailing": Icon(Icons.chevron_right),
      "action_id": 3,
    },
    {
      "leading": Icon(
        Icons.settings,
        color: Color(0xFF13C0E3),
      ),
      "title": "Paramétres",
      "trailing": Icon(Icons.chevron_right),
      "action_id": 4,
    },
    {
      "leading": Icon(
        Icons.contact_emergency,
        color: Color(0xFF13C0E3),
      ),
      "title": "Contactez-nous",
      "trailing": Icon(Icons.chevron_right),
      "action_id": 5,
    },
    {
      "leading": Icon(
        Icons.logout_outlined,
        color: Color(0xFF13C0E3),
      ),
      "title": "Déconnecter",
      "trailing": Icon(Icons.chevron_right),
      "action_id": 6,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: 280,
        child: Drawer(
          child: ListView(
            children: [
              const ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage("images/logohne.jpeg"),
                ),
                title: Text(
                  "Boulkheir",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                subtitle: Text(
                  "boulkheir@gmail.com",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(
                height: 1,
              ),
              ...drawerMenuListname.map((sideMenuData) {
                return ListTile(
                    leading: sideMenuData['leading'],
                    title: Text(
                      sideMenuData['title'],
                    ),
                    trailing: sideMenuData['trailing'],
                    onTap: () {
                      // Navigator.pop(context);

                      if (sideMenuData['action_id'] == 1) {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const EditProfile(),
                          ),
                        );
                      } else if (sideMenuData['action_id'] == 4) {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const ProfilePage1(),
                          ),
                        );
                      } else if (sideMenuData['action_id'] == 2) {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => PlanningScreen(),
                          ),
                        );
                      } else if (sideMenuData['action_id'] == 6) {
                        // Navigator.of(context).push(
                        //   MaterialPageRoute(
                        //     builder: (context) => PlanningScreen(),
                        //   ),
                        // );
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return SignInPage1();
                            },
                          ),
                        );
                        clearToken();
                      }
                    });
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }
}
