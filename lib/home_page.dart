import 'package:app_ios/etapas_page.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _positionAnimation;
  late Animation<double> _opacityAnimation;
  late AnimationController _shakeController;
  late Animation<Offset> _shakeAnimation;
  Timer? _shakeTimer;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();

    _positionAnimation = Tween<double>(
      begin: -20,
      end: 100,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _opacityAnimation = TweenSequence([
      TweenSequenceItem(
          tween: Tween<double>(begin: 0.0, end: 1.0).chain(
            CurveTween(curve: Curves.easeInExpo),
          ),
          weight: 25),
      TweenSequenceItem(
        tween: ConstantTween<double>(1.0),
        weight: 60,
      ),
      TweenSequenceItem(
          tween: Tween<double>(begin: 1.0, end: 0.0).chain(
            CurveTween(curve: Curves.easeOut),
          ),
          weight: 15),
    ]).animate(_controller);

    _shakeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _shakeAnimation = TweenSequence<Offset>([
      TweenSequenceItem(
          tween: Tween(begin: Offset.zero, end: const Offset(-5, -5)),
          weight: 1),
      TweenSequenceItem(
          tween: Tween(begin: const Offset(-5, -5), end: const Offset(5, 5)),
          weight: 2),
      TweenSequenceItem(
          tween: Tween(begin: const Offset(5, 5), end: const Offset(-5, 5)),
          weight: 2),
      TweenSequenceItem(
          tween: Tween(begin: const Offset(-5, 5), end: const Offset(5, -5)),
          weight: 2),
      TweenSequenceItem(
          tween: Tween(begin: const Offset(5, -5), end: Offset.zero),
          weight: 1),
    ]).animate(
      CurvedAnimation(
        parent: _shakeController,
        curve: Curves.linear,
      ),
    );

    _shakeTimer = Timer.periodic(const Duration(seconds: 2), (_) {
      _shakeController.forward(from: 0.0);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _shakeController.dispose();
    _shakeTimer?.cancel();
    super.dispose();
  }

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
        automaticallyImplyLeading: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: SizedBox(
              width: 200,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Image.asset('assets/app-store.png'),
                  AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      return Positioned(
                        bottom: _positionAnimation.value,
                        right: -32,
                        child: Opacity(
                          opacity: _opacityAnimation.value,
                          child: child!,
                        ),
                      );
                    },
                    child: Image.asset(
                      'assets/seta.png',
                      width: 70,
                    ),
                  ),
                ],
              ),
            ),
          ),
          AnimatedBuilder(
            animation: _shakeController,
            builder: (context, child) {
              return Transform.translate(
                offset: _shakeAnimation.value,
                child: child,
              );
            },
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const EtapasPage(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                elevation: 4,
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 15,
                ),
              ),
              child: const Text(
                "Começar Aprendizado",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
