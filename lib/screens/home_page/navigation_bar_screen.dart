import 'package:flutter/material.dart';
import 'package:movie_app/screens/home_page/home_screen.dart';

class NavigationBarScreen extends StatefulWidget {
  const NavigationBarScreen({super.key});

  @override
  State<NavigationBarScreen> createState() => _NavigationBarScreenState();
}

class _NavigationBarScreenState extends State<NavigationBarScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        currentIndex: _currentIndex,
        items: getBottomNaviItems(color: Colors.white),
        selectedIconTheme:
            IconThemeData(color: Theme.of(context).colorScheme.primary),
        unselectedIconTheme:
            const IconThemeData(color: Colors.grey),
        selectedItemColor: Theme.of(context).colorScheme.primary,
      ),
      body: listScreen()[_currentIndex],
    );
  }

  List<BottomNavigationBarItem> getBottomNaviItems({Color? color}) {
    return [
      BottomNavigationBarItem(
        icon: const Icon(Icons.home),
        label: "Home",
        backgroundColor: color,
      ),
      BottomNavigationBarItem(
        icon: const Icon(Icons.explore),
        label: "Explore",
        backgroundColor: color,
      ),
      BottomNavigationBarItem(
        icon: const Icon(Icons.bookmark),
        label: "My List",
        backgroundColor: color,
      ),
      BottomNavigationBarItem(
        icon: const Icon(Icons.download),
        label: "Download",
        backgroundColor: color,
      ),
      BottomNavigationBarItem(
        icon: const Icon(Icons.person),
        label: "Profile",
        backgroundColor: color,
      )
    ];
  }
  List<Widget> listScreen() {
    return [
      const HomeScreen(),
      const HomeScreen(),
      const HomeScreen(),
      const HomeScreen(),
      const HomeScreen(),
    ];
  }
}
