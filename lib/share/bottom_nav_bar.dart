import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatefulWidget {
  const AppBarWidget({Key? key}) : super(key: key);

  @override
  _AppBarWidgetState createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  int _selectedIndex = 0;
  PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _selectedIndex = index);
          },
        ),
      ),
        bottomNavigationBar: BottomNavyBar(
          iconSize: 25,
          selectedIndex: _selectedIndex,
          onItemSelected: (index) {
            setState(() => _selectedIndex = index);
            _pageController.jumpToPage(index);
          },
          items: [
            BottomNavyBarItem(
              icon: Icon(Icons.home_outlined),
              title: Text('Accueil'),
              activeColor: Colors.cyan,
            ),
            BottomNavyBarItem(
                icon: Icon(Icons.shopping_cart_outlined),
                title: Text('Panier'),
                activeColor: Colors.cyan
            ),
            BottomNavyBarItem(
                icon: Icon(Icons.access_time),
                title: Text('Commandes'),
                activeColor: Colors.cyan
            ),
            BottomNavyBarItem(
                icon: Icon(Icons.account_circle_outlined),
                title: Text('Profil'),
                activeColor: Colors.cyan
            ),
          ],
        )
    );
  }
}
