import 'package:app_ios/menu_drawer.dart';
import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import 'dart:math';

class ParabensPage extends StatefulWidget {
  const ParabensPage({super.key});

  @override
  State<ParabensPage> createState() => _ParabensPageState();
}

class _ParabensPageState extends State<ParabensPage>
    with TickerProviderStateMixin {
  late ConfettiController _confettiController;
  late AnimationController _fadeController;
  late AnimationController _shineController;

  late Animation<double> _fadeAnimation;

  bool showCheckIcon = false;

  @override
  void initState() {
    super.initState();
    _confettiController =
        ConfettiController(duration: const Duration(seconds: 1));
    _confettiController.play();

    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _fadeController,
      curve: const Interval(0.9, 1.0, curve: Curves.easeIn),
    );

    _shineController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();

    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        showCheckIcon = true;
      });
      _fadeController.forward();
    });
  }

  @override
  void dispose() {
    _confettiController.dispose();
    _fadeController.dispose();
    _shineController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Aprendizado Concluído",
          style: TextStyle(fontWeight: FontWeight.w400),
        ),
        centerTitle: true,
      ),
      drawer: const MenuDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(64.0),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Image(
                    image: AssetImage('assets/icon-app.png'),
                    width: 140,
                  ),
                  const SizedBox(height: 130),
                  const Text(
                    'Parabéns! Agora você já sabe como publicar um app na AppStore!',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF000000),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 130),
                  if (showCheckIcon)
                    FadeTransition(
                      opacity: _fadeAnimation,
                      child: AnimatedBuilder(
                        animation: _shineController,
                        builder: (context, child) {
                          return ShaderMask(
                            shaderCallback: (rect) {
                              return LinearGradient(
                                colors: [
                                  Colors.white.withOpacity(0.0),
                                  Colors.white.withOpacity(0.8),
                                  Colors.white.withOpacity(0.0),
                                ],
                                stops: const [0.2, 0.5, 0.8],
                                begin: Alignment(
                                    -1.0 + 2 * _shineController.value, 0),
                                end: Alignment(
                                    1.0 + 2 * _shineController.value, 0),
                              ).createShader(rect);
                            },
                            blendMode: BlendMode.srcATop,
                            child: const Icon(
                              Icons.check,
                              size: 80,
                              color: Color(0xFF007aff),
                            ),
                          );
                        },
                      ),
                    ),
                ],
              ),
            ),
            ConfettiWidget(
              confettiController: _confettiController,
              blastDirection: pi / 2,
              emissionFrequency: 0.05,
              numberOfParticles: 20,
              maxBlastForce: 20,
              minBlastForce: 5,
              gravity: 0.1,
              shouldLoop: false,
              colors: const [
                Color(0xFF007aff),
                Color(0xFF6374D4),
                Color(0xFF00ff00),
                Color(0xFF0000ff),
                Color(0xFF0001ff),
                Color(0xFF0021ff),
                Color(0xFF0061ff),
                Color(0xFF0091ff),
                Color(0xFF0E30C5),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
