import 'package:flutter/material.dart';

import 'empty_content_animation_view.dart';

class EmptyContentWithTextAnimationView extends StatelessWidget {
  final String text;
  const EmptyContentWithTextAnimationView({Key? key, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            text,
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(color: Colors.white54),
          ),
          const EmptyContentAnimationView()
        ],
      ),
    );
  }
}
