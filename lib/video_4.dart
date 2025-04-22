import 'package:app_ios/parabens_page.dart';
import 'package:app_ios/video_3.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter/services.dart';

class Video4 extends StatefulWidget {
  const Video4({super.key});

  @override
  State<Video4> createState() => _Video4State();
}

class _Video4State extends State<Video4> {
  late YoutubePlayerController _controller;
  bool _isFullScreen = false;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(
          'https://www.youtube.com/watch?v=Ao5uPhjMs68')!,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    );

    _controller.addListener(() {
      final isFullScreenNow = _controller.value.isFullScreen;
      if (isFullScreenNow != _isFullScreen) {
        setState(() {
          _isFullScreen = isFullScreenNow;
        });
      }
    });

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }

  @override
  void dispose() {
    _controller.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _isFullScreen
          ? null
          : AppBar(
              title: const Text(
                "Subir App",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              centerTitle: true,
            ),
      body: _isFullScreen
          ? Container(
              color: Colors.black,
              child: YoutubePlayer(
                controller: _controller,
                showVideoProgressIndicator: true,
                progressIndicatorColor: Colors.red,
                progressColors: const ProgressBarColors(
                  playedColor: Color(0xff007aff),
                  handleColor: Color(0xff007aff),
                  bufferedColor: Color(0xFF99BCE2),
                  backgroundColor: Colors.white38,
                ),
              ),
            )
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: YoutubePlayer(
                      controller: _controller,
                      showVideoProgressIndicator: true,
                      progressIndicatorColor: Colors.red,
                      progressColors: const ProgressBarColors(
                        playedColor: Color(0xff007aff),
                        handleColor: Color(0xff007aff),
                        bufferedColor: Color(0xFF99BCE2),
                        backgroundColor: Colors.white38,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: Text(
                      "Tudo o que você precisa para publicar na App Store",
                      style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 35),
                    child: Text(
                      "Pontos Importantes:",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    child: SizedBox(
                      height: 330,
                      child: Card(
                        elevation: 4,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: ListView(
                            children: [
                              listItem("Leia a documentação oficial da Apple"),
                              listItem("Siga as diretrizes da App Store"),
                              listItem(
                                  "Ative sua conta com um dispositivo Apple"),
                              listItem(
                                  "Crie a conta com o nome do app para evitar rejeição"),
                              listItem(
                                  "Remova qualquer vínculo com Google Play"),
                              listItem(
                                  "O app deve ter interação real com o usuário"),
                              listItem(
                                  "Garanta um design fluido e no padrão Apple (UX/UI)"),
                              listItem(
                                  "Nome único, ícone em alta e prints reais"),
                              listItem("Descrição fiel e clara do aplicativo"),
                              listItem(
                                  "Se houver login, forneça usuário/senha de teste"),
                              listItem(
                                  "Adicione Política de Privacidade e Termos de Uso"),
                              listItem(
                                  "Evite apps genéricos ou de template pronto"),
                              listItem(
                                  "Siga as leis de privacidade (LGPD/GDPR)"),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
      floatingActionButton: AnimatedOpacity(
        duration: const Duration(milliseconds: 300),
        opacity: _isFullScreen ? 0.0 : 1.0,
        child: !_isFullScreen
            ? SizedBox(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 75,
                      height: 75,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black45,
                            blurRadius: 6,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: FloatingActionButton(
                        heroTag: "btnBack",
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Video3(),
                            ),
                          );
                        },
                        backgroundColor: const Color(0xff007aff),
                        foregroundColor: Colors.blueGrey.shade100,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: const Icon(
                          Icons.keyboard_arrow_left_rounded,
                          size: 60,
                        ),
                      ),
                    ),
                    Container(
                      width: 75,
                      height: 75,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black45,
                            blurRadius: 6,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: FloatingActionButton(
                        heroTag: "btnGo",
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ParabensPage(),
                            ),
                          );
                        },
                        backgroundColor: const Color(0xff007aff),
                        foregroundColor: Colors.blueGrey.shade100,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: const Icon(
                          Icons.keyboard_arrow_right_rounded,
                          size: 60,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : null,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

Widget listItem(String text) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4.0),
    child: Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 7),
              child: Icon(Icons.circle, size: 10, color: Colors.green),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                text,
                style: const TextStyle(fontSize: 17),
              ),
            ),
          ],
        ),
        const Divider(),
      ],
    ),
  );
}
