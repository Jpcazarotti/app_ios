import 'package:app_ios/faq_page.dart';
import 'package:app_ios/menu_drawer.dart';
import 'package:flutter/material.dart';

class EtapasPage extends StatelessWidget {
  const EtapasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Etapas Visuais da Publicação",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FaqPage(),
                ),
              );
            },
            icon: Semantics(
              label: "Botão para dúvidas/ajuda",
              child: const Icon(Icons.help_outline_sharp),
            ),
          ),
        ],
      ),
      drawer: const MenuDrawer(),
    );
  }
}
