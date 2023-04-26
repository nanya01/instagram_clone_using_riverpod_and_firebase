import 'package:instagram_clone_with_riverpod/views/components/animations/lottie_animation_view.dart';

import 'models/lottie_animation.dart';

class EmptyContentAnimationView extends LottieAnimationView {
  const EmptyContentAnimationView({super.key})
      : super(animation: LottieAnimation.empty);
}
