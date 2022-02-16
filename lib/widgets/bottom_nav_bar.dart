import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatefulWidget {
  const AppBarWidget({Key? key}) : super(key: key);

  @override
  _AppBarWidgetState createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  PageController _pageController = PageController();
  int _selectedIndex = 1;
  @override
  Widget build(BuildContext context) {
    return BottomNavyBar(
      iconSize: 25,
      selectedIndex: _selectedIndex,
      onItemSelected: (index) {
        setState(() => _selectedIndex = index);
        _pageController.jumpToPage(index);
      },
      items: [
        BottomNavyBarItem(
          icon: const Icon(Icons.home_outlined),
          title: const Text('Accueil'),
          activeColor: Colors.cyan,
        ),
        BottomNavyBarItem(
            icon: const Icon(Icons.shopping_cart_outlined),
            title: const Text('Panier'),
            activeColor: Colors.cyan),
        BottomNavyBarItem(
            icon: Icon(Icons.access_time),
            title: Text('Commandes'),
            activeColor: Colors.cyan),
        BottomNavyBarItem(
            icon: Icon(Icons.app_settings_alt_rounded),
            title: Text('Paramètres'),
            activeColor: Colors.cyan),
      ],
    );
  }
}
