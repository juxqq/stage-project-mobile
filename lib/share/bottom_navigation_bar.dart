import 'package:provider/provider.dart';
import 'package:mobile_app/share/badge_widget.dart';
import 'package:flutter/material.dart';



class BottomNavigationBarWidget extends StatelessWidget {
  final int indexSelected;
  const BottomNavigationBarWidget(this.indexSelected, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed, // plus de 3 éléments
      currentIndex: indexSelected,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Accueil',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_shopping_cart_outlined),
          label: 'Commande',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart_outlined),
          label: 'Panier',
          ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profil',
        ),
      ],
      onTap: (index) {
        String page = '/';
        switch (index) {
          case 2:
            page = '/panier';
            break;
          case 3:
            page = '/profil';
            break;
        }
        Navigator.pushNamed(context, page);
      },
    );
  }
}