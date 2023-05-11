// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:mobx/mobx.dart';

import '../../core/exceptions/unauthorized_exception.dart';
import '../../services/auth/login_service.dart';

part 'login_controller.g.dart';

enum LoginStateStatus {
  inital,
  loading,
  success,
  error;
}

class LoginController = LoginControllerBase with _$LoginController;

abstract class LoginControllerBase with Store {
  final LoginService _loginService;

  @readonly
  LoginStateStatus _loginStatus = LoginStateStatus.inital;

  @readonly
  String? _errorMessage;

  LoginControllerBase(this._loginService);

  @action
  Future<void> login(String email, String password) async {
    try {
      _loginStatus = LoginStateStatus.loading;
      await _loginService.execute(email, password);
      _loginStatus = LoginStateStatus.success;
    } on UnauthorizedException {
      _errorMessage = 'Login ou senha inválidos';
      _loginStatus = LoginStateStatus.error;
    } catch (e, s) {
      log('Erro ao realizar login', error: e, stackTrace: s);
      _errorMessage = 'Tente novamente mais tarde';
      _loginStatus = LoginStateStatus.error;
    }
  }
}
