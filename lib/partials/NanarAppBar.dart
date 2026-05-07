import 'package:flutter/material.dart';

class NanarAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget> actions;

  const NanarAppbar({super.key, required this.title, required this.actions});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      flexibleSpace: Image(
        image: AssetImage('assets/House.jpg'),
        fit: BoxFit.cover,
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
