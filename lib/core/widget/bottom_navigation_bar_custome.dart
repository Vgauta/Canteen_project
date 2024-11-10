import 'package:flutter/material.dart';

import 'snack_bar_helper.dart';

class BottomNavigationBarCustome extends StatelessWidget {
  const BottomNavigationBarCustome({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: 60,
      elevation: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: () {
              SnackBarHelper.showSnackBar(context, "Home", false);
            },
            icon: const Icon(Icons.home),
          ),
          IconButton(
            onPressed: () {
              
            },
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notification_add),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}
