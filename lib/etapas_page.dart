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
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height -
                AppBar().preferredSize.height -
                MediaQuery.of(context).padding.top,
          ),
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
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
                    child: Container(
                      width: 160,
                      height: 110,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black45,
                            blurRadius: 4,
                            offset: Offset(1, 3),
                          ),
                        ],
                      ),
                      child: const Center(
                        child: Image(
                          image: AssetImage('assets/imagem6.png'),
                          width: 100,
                        ),
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
                    child: Container(
                      width: 160,
                      height: 110,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black45,
                            blurRadius: 4,
                            offset: Offset(1, 3),
                          ),
                        ],
                      ),
                      child: const Center(
                        child: Image(
                          image: AssetImage('assets/imagem5.png'),
                          width: 100,
                        ),
                      ),
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
                    child: Container(
                      width: 160,
                      height: 110,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black45,
                            blurRadius: 4,
                            offset: Offset(1, 3),
                          ),
                        ],
                      ),
                      child: const Center(
                        child: Image(
                          image: AssetImage('assets/imagem4.png'),
                          width: 100,
                        ),
                      ),
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
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Video4(),
                        ),
                      );
                    },
                    child: Container(
                      width: 160,
                      height: 110,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black45,
                            blurRadius: 4,
                            offset: Offset(1, 3),
                          ),
                        ],
                      ),
                      child: const Center(
                        child: Image(
                          image: AssetImage('assets/icon-app.png'),
                          width: 100,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
