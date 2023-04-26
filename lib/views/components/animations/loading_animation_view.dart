import 'package:instagram_clone_with_riverpod/views/components/animations/lottie_animation_view.dart';

import 'models/lottie_animation.dart';

class LoadingAnimationView extends LottieAnimationView {
  const LoadingAnimationView({super.key})
      : super(animation: LottieAnimation.loading);
}
