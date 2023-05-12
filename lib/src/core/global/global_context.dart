import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../storage/storage.dart';

class GlobalContext {
  late final GlobalKey<NavigatorState> _navigatorKey;

  static GlobalContext? _i;
  GlobalContext._();
  static GlobalContext get i {
    _i ??= GlobalContext._();
    return _i!;
  }

  set navigatoKey(GlobalKey<NavigatorState> key) => _navigatorKey = key;

  void loginExpire() {
    Modular.get<Storage>().clean();
    ScaffoldMessenger.of(_navigatorKey.currentContext!).showSnackBar(
      SnackBar(
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        padding: const EdgeInsets.only(top: 62),
        backgroundColor: Colors.transparent,
        content: AwesomeSnackbarContent(
          title: 'Login Expirado',
          message: 'Login expirado, faça o login novamente',
          contentType: ContentType.failure,
        ),
      ),
    );
    Modular.to.navigate('/login');
  }
}
