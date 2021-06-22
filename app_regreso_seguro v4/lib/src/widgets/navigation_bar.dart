import 'package:flutter/material.dart';

class CustomBottonNavigation extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: Colors.pink,
      backgroundColor: Color.fromRGBO(55, 57, 84, 1),
      unselectedItemColor: Color.fromRGBO(117, 117, 152, 1),
      currentIndex: 0,
      items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.exit_to_app),
              label: 'Salir',
          ),
      ],
    );
  }
}
