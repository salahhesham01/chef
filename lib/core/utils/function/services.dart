import 'package:app_links/app_links.dart';
import 'package:chef/features/auth/presentation/views/new_password_view.dart';
import 'package:flutter/material.dart';

configDeepLink(BuildContext context) {
  final appLinks = AppLinks();

  appLinks.uriLinkStream.listen((uri) {
    if (uri.host == 'reset-password') {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const NewPasswordView(),
          ));
    }
  });
}
