import 'package:flutter/material.dart';
import 'nav_screens/contact.dart';
import 'nav_screens/home.dart';
import 'nav_screens/service.dart';

class BottomNavigation extends StatefulWidget {
  final name;
  final UID;
  const BottomNavigation({Key? key, this.name, this.UID}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _BottomNavigation();
  }
}

class _BottomNavigation extends State<BottomNavigation> {
  int tabSelected = 1; // index to iterate and select items in screen List
  @override
  Widget build(BuildContext context) {
    var screens = [
      // Stores different screens to show in Bottom_Nav_Bar
      Services(UID: widget.UID, name: widget.name,),
      Home(),
      Contact(),
    ];

  return Scaffold(
    body: Container(
      child: screens[tabSelected],
    ),
    bottomNavigationBar: NavigationBarTheme(
      data: NavigationBarThemeData(
        indicatorColor: Colors.grey.shade200,
        backgroundColor: Colors.black54,
        labelTextStyle: MaterialStateProperty.all(
          const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
        ),
      ),
      child: NavigationBar(
      height: 60,
      selectedIndex: tabSelected,
      labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
      animationDuration: const Duration(seconds: 2),
      onDestinationSelected: (index) {
        setState(() {
          tabSelected = index;
        });
      },
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.bar_chart_rounded),
          label: 'Trades',
          selectedIcon: Icon(Icons.track_changes_rounded),
        ),
        NavigationDestination(
          icon: Icon(Icons.home_filled),
          label: 'Home',
          selectedIcon: Icon(Icons.home_outlined),
        ),
        NavigationDestination(
          icon: Icon(Icons.contact_page),
          label: 'Contact',
          selectedIcon: Icon(Icons.contact_page_outlined),
        ),
      ],
    ),
  ),
    );
  }
}
