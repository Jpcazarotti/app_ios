import 'package:app_ios/video_2.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter/services.dart';

class Video1 extends StatefulWidget {
  const Video1({super.key});

  @override
  State<Video1> createState() => _Video1State();
}

class _Video1State extends State<Video1> {
  late YoutubePlayerController _controller;
  bool _isFullScreen = false;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(
          'https://www.youtube.com/watch?v=yCOwoylY7e8')!,
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
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _isFullScreen
          ? null
          : AppBar(
              title: const Text(
                "Apple Developer",
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
                      "Criando a conta Desenvolvedor Apple",
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
                      height: 300,
                      child: ListView(
                        children: [
                          listItem("Criar um ID Apple (Apple ID)"),
                          listItem("Acessar o site do Apple Developer"),
                          listItem("Iniciar o processo de inscrição"),
                          listItem("Escolher o tipo de conta"),
                          listItem("Preencher as informações solicitadas"),
                          listItem("Aceitar os termos e condições"),
                          listItem("Pagar a taxa anual (582 reais)"),
                          listItem("Aguardar aprovação"),
                        ],
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
            ? Padding(
                padding: const EdgeInsets.all(15),
                child: Container(
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
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Video2(),
                        ),
                      );
                    },
                    backgroundColor: const Color(0xff007aff),
                    foregroundColor: const Color(0xFF24333D),
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
              )
            : null,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

Widget listItem(String text) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4.0),
    child: Row(
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
  );
}
