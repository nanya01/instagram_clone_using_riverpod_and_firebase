import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'models/lottie_animation.dart';

class LottieAnimationView extends StatelessWidget {
  final LottieAnimation animation;
  final bool repeat;
  final bool reverse;
  const LottieAnimationView(
      {required this.animation,
      this.repeat = true,
      this.reverse = false,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Lottie.asset(animation.fullPath);
}

extension GetFullPath on LottieAnimation {
  String get fullPath => 'assets/animations/$name.json';
}
