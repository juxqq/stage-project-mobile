import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  final int indexSelected;
  const AppBarWidget(this.indexSelected, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed, // plus de 3 éléments
      currentIndex: indexSelected,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Articles',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_shopping_cart_outlined),
          label: 'Evenement',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart_outlined),
          label: 'Emploie',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart_outlined),
          label: 'Association',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Parametres',
        ),
      ],
      onTap: (index) {
        String page = '/';
        switch (index) {
          case 0:
            page = '/articles';
            break;
          case 1:
            page = '/events';
            break;
          case 2:
            page = '/jobs';
            break;
          case 4:
            page = '/settings';
            break;
        }
        Navigator.pushNamed(context, page);
      },
    );
  }
}
