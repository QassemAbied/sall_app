import 'package:sall_app/models/login_models.dart';

abstract class LoginStates{}
class LoginInitialStats extends LoginStates{}

class LoginLoadingStates extends LoginStates{}
class LoginSccussStates extends LoginStates{
  final LoginModel loginmodel;

  LoginSccussStates(this.loginmodel);
}
class LoginerrorStates extends LoginStates{
  final String error;

  LoginerrorStates(this.error);
}