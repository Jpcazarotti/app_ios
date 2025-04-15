import 'package:app_ios/faq_page.dart';
import 'package:app_ios/menu_drawer.dart';
import 'package:app_ios/video_1.dart';
import 'package:app_ios/video_2.dart';
import 'package:app_ios/video_3.dart';
import 'package:app_ios/video_4.dart';
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
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                'Registre-se no site Apple Developer',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Video1(),
                    ),
                  );
                },
                child: const Card(
                  child: Image(
                    image: AssetImage('assets/imagem6.png'),
                    width: 100,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Crie o app e exporte o IPA',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Video2(),
                    ),
                  );
                },
                child: const Image(
                  image: AssetImage('assets/imagem5.png'),
                  width: 100,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Teste com os amigos pelo TestFlight',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF000000),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Video3(),
                    ),
                  );
                },
                child: const Image(
                  image: AssetImage('assets/imagem4.png'),
                  width: 100,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Subir para App Store Connect',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF000000),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Video4(),
                      ),
                    );
                  },
                  child: const Image(
                    image: AssetImage('assets/icon-app.png'),
                    width: 100,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
