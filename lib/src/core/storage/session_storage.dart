import './storage.dart';
import 'dart:html';

class SessionStorage implements Storage {
  @override
  String getData(String key) => window.sessionStorage[key] ?? '';

  @override
  void setData(String key, String value) => window.sessionStorage[key] = value;

  @override
  void clean() => window.sessionStorage.clear();
}
