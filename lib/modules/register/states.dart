import 'package:sall_app/models/login_models.dart';

abstract class RegisterShopStates{}

class ShopInitialSates extends RegisterShopStates{}
class ShopRegisterLoadingStates extends RegisterShopStates{}
class shopRegisterSccussStates extends RegisterShopStates{
  final LoginModel? model;

  shopRegisterSccussStates(this.model);
}
class shopRegistererrorStates extends RegisterShopStates{
  final String error;

  shopRegistererrorStates(this.error);
}