import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vibgyor/pages/bottom_nav_screens/nav_screens/contact.dart';
import 'package:vibgyor/pages/drawer_screens/screens/about_us.dart';
import 'package:vibgyor/pages/drawer_screens/screens/profilepage.dart';
import 'package:vibgyor/pages/drawer_screens/screens/settings.dart';
import 'package:vibgyor/pages/login_signup_screens/login/login.dart';

class NavigationDrawer extends StatefulWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  State<NavigationDrawer> createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  late SharedPreferences logindata;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initial();
  }

  void initial() async {
    logindata = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
            topRight: Radius.circular(39), bottomRight: Radius.circular(39)),
        child: Drawer(
          elevation: 0,
          child: Container(
            color: Colors.grey,
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                const SizedBox(
                  height: 50,
                ),
                buildMenuItem(
                    text: "My account",
                    icon: Icons.account_circle,
                    onClicked: () => selectedItem(context, 0)),
                const SizedBox(
                  height: 16,
                ),
                buildMenuItem(
                    text: "Settings",
                    icon: Icons.settings,
                    onClicked: () => selectedItem(context, 2)),
                const SizedBox(
                  height: 16,
                ),
                buildMenuItem(
                    text: "Help & Support",
                    icon: Icons.help_center,
                    onClicked: () => selectedItem(context, 3)),
                const SizedBox(
                  height: 16,
                ),
                buildMenuItem(
                    text: "About us",
                    icon: Icons.accessibility_sharp,
                    onClicked: () => selectedItem(context, 4)),
                const SizedBox(
                  height: 246,
                ),
                MaterialButton(
                  elevation: 10,
                  hoverElevation: 58,
                  color: Colors.grey.shade600,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                    18,
                  )),
                  onPressed: () {
                    logindata.setBool('login', true);
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => const Login()));
                  },
                  child: const Text(
                    'LogOut',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildMenuItem(
      {required String text, required IconData icon, VoidCallback? onClicked}) {
    const color = Colors.white;
    const hoverColor = Colors.white;
    return ListTile(
      hoverColor: hoverColor,
      leading: Icon(
        icon,
        color: color,
        size: 30,
      ),
      title: Text(
        text,
        style: const TextStyle(color: color, fontSize: 20),
      ),
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();

    switch (index) {
      case 0:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => ProfilePage()));
        break;
      case 2:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Settings()));
        break;
      case 3:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Contact()));
        break;
      case 4:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => AboutUs()));
        break;
    }
  }
}
