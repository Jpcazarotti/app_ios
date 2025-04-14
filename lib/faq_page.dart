import 'package:flutter/material.dart';

class FaqPage extends StatelessWidget {
  const FaqPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FAQ"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            buildExpansionTile(
              'O que esse aplicativo faz?',
              'Este app tem como objetivo ensinar, passo a passo, como publicar um aplicativo na App Store. Através de vídeos explicativos, você aprenderá desde a criação da conta de desenvolvedor até a publicação final.',
            ),
            buildExpansionTile(
              'O que encontro na página de etapas?',
              'Cada etapa do processo está representada por um ícone. Ao tocar em um deles, você será redirecionado para um vídeo com a explicação detalhada daquela parte do processo.',
            ),
            buildExpansionTile(
              'Para que serve a página de dicas?',
              'Na aba de dicas, você encontrará sugestões, alertas e boas práticas para evitar erros comuns durante o processo de criação e publicação do seu app.',
            ),
            buildExpansionTile(
              'Preciso de internet para usar o app?',
              'Sim, é necessário estar conectado à internet, pois os vídeos explicativos estão hospedados em plataformas externas (como YouTube).',
            ),
            buildExpansionTile(
              'Posso publicar apps na App Store sem pagar?',
              'Não. A Apple exige uma conta de desenvolvedor paga, que custa uma taxa anual. Mais detalhes estão explicados nos vídeos.',
            ),
            buildExpansionTile(
              'O app ensina a programar?',
              'Não. Este aplicativo é focado exclusivamente na publicação na App Store, não aborda a programação ou desenvolvimento de apps.',
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildExpansionTile(String title, String content) {
  return Card(
    elevation: 5,
    margin: const EdgeInsets.symmetric(vertical: 5),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
    child: ExpansionTile(
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            content,
            style: const TextStyle(fontSize: 14, color: Colors.black87),
          ),
        ),
      ],
    ),
  );
}
