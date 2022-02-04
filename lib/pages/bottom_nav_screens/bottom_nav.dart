import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'nav_screens/contact.dart';
import 'nav_screens/home.dart';
import 'nav_screens/service.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

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
      Services(),
      Home(),
      Contact(),
    ];
/*    final items = <Widget>[
      const Icon(
        Icons.bar_chart,
        size: 30,
      ),
      const Icon(
        Icons.home_filled,
        size: 30,
      ),
      const Icon(
        Icons.contact_page,
        size: 30,
      ),
    ];*/

/*    return Scaffold(
        extendBody: true,
        body: screens[index],
        bottomNavigationBar: Theme(
          data: Theme.of(context)
              .copyWith(iconTheme: const IconThemeData(color: Colors.white)),
          child: CurvedNavigationBar(
            backgroundColor: Colors.transparent,
            items: items,
            index: index,
            height: 45,
            color: Colors.grey,
            onTap: (index) => setState(() => this.index = index),
          ),
        ));*/

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
          label: 'Service',
          selectedIcon: Icon(Icons.miscellaneous_services_rounded),
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
