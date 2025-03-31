import 'package:app_ios/faq_page.dart';
import 'package:app_ios/menu_drawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Publicando na App Store",
          style: TextStyle(
            fontSize: 20,
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 30,
            ),
            child: Center(
              child: Stack(
                children: [
                  Container(
                    width: 200,
                    decoration: const BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.all(
                        Radius.circular(40),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black38,
                          blurRadius: 6,
                          offset: Offset(0, 1),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(40),
                      ),
                      child: Image.asset('assets/appStoreIcon.png'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
