import 'package:app_ios/dicas_page.dart';
import 'package:app_ios/etapas_page.dart';
import 'package:app_ios/home_page.dart';
import 'package:flutter/material.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Color(0xFFBAD8F8),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Image.asset(
                'assets/icon-app.png',
              ),
            ),
          ),
          Card(
            elevation: 0.4,
            child: ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Home"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ),
                );
              },
            ),
          ),
          Card(
            elevation: 0.4,
            child: ListTile(
              leading: const Icon(Icons.stacked_line_chart),
              title: const Text("Etapas Visuais"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const EtapasPage(),
                  ),
                );
              },
            ),
          ),
          Card(
            elevation: 0.4,
            child: ListTile(
              leading: const Icon(Icons.lightbulb_outline),
              title: const Text("Dicas"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DicasPage(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
