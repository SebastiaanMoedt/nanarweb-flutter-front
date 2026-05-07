import 'package:flutter/material.dart';

class NanarBottomNavBar extends StatelessWidget {
  const NanarBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        backgroundColor: Colors.green,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Consulter Films',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_movies),
            label: 'Ajouter Cycle',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.movie),
            label: 'Ajouter Film',
          ),
        ],
        selectedItemColor: Colors.pink[800],
    );
  }
}
