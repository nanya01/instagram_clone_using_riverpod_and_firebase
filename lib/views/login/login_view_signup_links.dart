import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../components/rich_text/base_text.dart';
import '../components/rich_text/rich_text_widget.dart';
import '../constants/strings.dart';

class LoginViewSignupLink extends StatelessWidget {
  const LoginViewSignupLink({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichTextWidget(
      styleForAll: Theme.of(context).textTheme.subtitle1?.copyWith(height: 1.3),
      texts: [
        BaseText.plain(text: Strings.dontHaveAnAccount),
        BaseText.plain(text: Strings.signUpOn),
        BaseText.link(
            text: Strings.google,
            onTapped: () {
              launchUrl(Uri.parse(Strings.googleSignupUrl));
            }),
        BaseText.plain(text: Strings.orCreateAnAccountOn)
      ],
    );
  }
}
