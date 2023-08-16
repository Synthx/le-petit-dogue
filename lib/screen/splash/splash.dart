import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jet_dogue/core/core.dart';
import 'package:jet_dogue/theme/theme.dart';
import 'package:video_player/video_player.dart';

import 'splash_store.dart';

class Splash extends StatelessWidget {
  final Widget child;

  const Splash({
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashStore(
        dataStore: context.read(),
      )..init(),
      child: BlocSelector<SplashStore, bool, bool>(
        selector: (state) => state,
        builder: (context, initialized) {
          if (!initialized) {
            return const SplashScreen();
          }

          return child;
        },
      ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _videoController = VideoPlayerController.asset(
    'assets/videos/splash.mp4',
  );

  @override
  void initState() {
    super.initState();
    _videoController.initialize().then((_) {
      _videoController.play();
      _videoController.setLooping(true);
      setState(() {});
    });
  }

  @override
  void dispose() {
    _videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenAspectRatio = MediaQuery.of(context).size.aspectRatio;
    final videoAspectRatio = _videoController.value.aspectRatio;
    final scale = videoAspectRatio / screenAspectRatio;

    return Scaffold(
      backgroundColor: context.primaryColor,
      body: Stack(
        children: [
          Center(
            child: Transform.scale(
              scale: scale,
              child: AspectRatio(
                aspectRatio: _videoController.value.aspectRatio,
                child: VideoPlayer(_videoController),
              ),
            ),
          ),
          const SafeArea(
            child: Padding(
              padding: EdgeInsets.all(kSafeArea),
              child: Column(
                children: [
                  Image(
                    image: AssetImage('assets/images/logo.png'),
                    height: 90,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
