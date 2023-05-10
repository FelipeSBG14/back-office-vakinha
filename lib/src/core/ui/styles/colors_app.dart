import 'package:flutter/material.dart';

class ColorsApp {
  static ColorsApp? _i;
  ColorsApp._();
  static ColorsApp get i {
    _i ??= ColorsApp._();
    return _i!;
  }

  Color get primary => const Color(0xFF007D21);
  Color get secondary => const Color(0xFFFFAB18);
  Color get black => const Color(0xFF140E0E);
}

extension ColorsAppExceptions on BuildContext {
  ColorsApp get colors => ColorsApp.i;
}
