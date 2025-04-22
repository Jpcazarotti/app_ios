import 'package:app_ios/video_2.dart';
import 'package:app_ios/video_4.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter/services.dart';

class Video3 extends StatefulWidget {
  const Video3({super.key});

  @override
  State<Video3> createState() => _Video3State();
}

class _Video3State extends State<Video3> {
  late YoutubePlayerController _controller;
  bool _isFullScreen = false;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(
          'https://www.youtube.com/watch?v=ME4_RHCaCAk')!,
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
                "TestFlight",
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
                      "Como se tornar um Testador de Apps IOS",
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
                              listItem("Baixar o testFlight na AppleStore"),
                              listItem("Ler e aceitar os termos e condições"),
                              listItem("Abrir o TestFlight"),
                              listItem("Localizar o aplicativo"),
                              listItem(
                                  "Tocar no link convite para testar o aplicativo"),
                              listItem(
                                  "Participar recebendo e-mail do desenvolvedor"),
                              listItem("Via resgate de código"),
                              listItem("Aceitar os termos do aplicativo"),
                              listItem(
                                  "Abrir o aplicativo e testar funcionalidades sugeridas pelos Devs"),
                              listItem(
                                  "Tirar prints para serem enviados aos Devs quando se encontrar algo estranho"),
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
                              builder: (context) => const Video2(),
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
                              builder: (context) => const Video4(),
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
