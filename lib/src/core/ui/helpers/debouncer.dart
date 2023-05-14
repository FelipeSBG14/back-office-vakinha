import 'dart:async';

import 'package:flutter/material.dart';

class Debouncer {
  final int milisencods;
  Timer? _timer;

  Debouncer({required this.milisencods});

  void call(VoidCallback callback) {
    _timer?.cancel();
    _timer = Timer(
      Duration(microseconds: milisencods),
      callback,
    );
  }
}
