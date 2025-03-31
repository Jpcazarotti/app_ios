import 'package:flutter/material.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: const [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xff007aff),
            ),
            child: Icon(
              Icons.apple,
              size: 80,
            ),
          ),
          Card(
            elevation: 0.4,
            child: ListTile(
              leading: Icon(Icons.person),
              title: Text("Perfil"),
            ),
          ),
          Card(
            elevation: 0.4,
            child: ListTile(
              leading: Icon(Icons.person),
              title: Text("Perfil"),
            ),
          ),
        ],
      ),
    );
  }
}
