import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:marabh/core/configs/assets/app_image.dart';
import 'package:marabh/src/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:marabh/src/auth/presentation/bloc/auth/auth_state.dart';
import 'package:marabh/src/auth/presentation/pages/login_page.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthAuthenticated) {
          context.push('/auth/login');
        } else if (state is AuthUnauthenticated) {
          context.push('/auth/signup');
        }
      },
      child: Scaffold(
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/images/logo.png"),
            SizedBox(
              height: 10,
            ),
            Image.asset("assets/images/Text.png"),
          ],
        )
            // Lottie.asset(
            //   'assets/lotties/logo.json',
            // ),
            ),
      ),
    );
  }
}

class WavyTopContainer extends StatefulWidget {
  const WavyTopContainer({Key? key}) : super(key: key);

  @override
  State<WavyTopContainer> createState() => _WavyTopContainerState();
}

class _WavyTopContainerState extends State<WavyTopContainer>
    with TickerProviderStateMixin {
  late AnimationController slideController;
  late Animation<Offset> slideAnimation;

  late AnimationController waveController;

  @override
  void initState() {
    super.initState();

    // Slide animation from bottom to top
    slideController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );
    slideAnimation =
        Tween<Offset>(begin: Offset(0, 1), end: Offset(0, 0)).animate(
      CurvedAnimation(parent: slideController, curve: Curves.easeOut),
    );

    // Wave animation (looping)
    waveController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat();

    slideController.forward();
  }

  @override
  void dispose() {
    slideController.dispose();
    waveController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff72B745),
        body: Stack(
          children: [
            SlideTransition(
              position: slideAnimation,
              child: Align(
                alignment: Alignment.bottomRight,
                child: AnimatedBuilder(
                  animation: waveController,
                  builder: (context, child) {
                    return ClipPath(
                      clipper: CurvedWaveClipper(waveController.value),
                      child: Column(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height,
                            width: double.infinity,
                            color: Colors.black,
                            child: Center(
                              child: Text(
                                "🌊 Wavy & Animated Container!",
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                          Container(
                            height: 200,
                            color: Colors.black,
                            width: double.infinity,
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Wave Clipper with dynamic shift (for animation)
class CurvedWaveClipper extends CustomClipper<Path> {
  final double waveShift;

  CurvedWaveClipper(this.waveShift);

  @override
  Path getClip(Size size) {
    final path = Path();
    double waveHeight = 40;
    double waveLength = size.width / 1.5;

    path.lineTo(0, waveHeight);

    for (double x = 0; x <= size.width; x++) {
      double y = waveHeight *
          sin((2 * pi / waveLength) * (x + waveShift * size.width));
      path.lineTo(x, y + 20);
    }

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CurvedWaveClipper oldClipper) => true;
}
