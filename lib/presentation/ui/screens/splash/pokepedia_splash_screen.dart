import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokepedia/generated/assets.dart';
import 'package:pokepedia/presentation/navigation/nav_routes.dart';
import 'package:pokepedia/presentation/ui/widgets/pokepedia_cover.dart';

class PokepediaSplashScreen extends StatefulWidget {
  const PokepediaSplashScreen({super.key});

  @override
  State<PokepediaSplashScreen> createState() => _PokepediaSplashScreenState();
}

class _PokepediaSplashScreenState extends State<PokepediaSplashScreen> {
  bool initAnimation = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Column(
              children: <Widget>[
                Expanded(
                  child: FadeOutUpBig(
                    curve: Curves.decelerate,
                    animate: initAnimation,
                    delay: const Duration(milliseconds: 500),
                    child: const PokepediaCover(),
                  ),
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: FadeOutDownBig(
                    curve: Curves.decelerate,
                    animate: initAnimation,
                    delay: const Duration(milliseconds: 500),
                    child: const PokepediaCover(isTopCover: false),
                  ),
                )
              ],
            ),
            Center(
              child: ZoomOut(
                animate: initAnimation,
                duration: const Duration(milliseconds: 1200),
                child: GestureDetector(
                  onTap: () => setState(() => initAnimation = true),
                  child: const _Pokeball(),
                ),
                onFinish: (direction) => context.go(HomeRoute().route),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Pokeball extends StatelessWidget {
  const _Pokeball();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 200,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          border: Border.all(
            color: Colors.black87,
            width: 3,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Bounce(
            infinite: true,
            duration: const Duration(milliseconds: 1600),
            child: Image.asset(Assets.iconIconApp),
          ),
        ),
      ),
    );
  }
}
