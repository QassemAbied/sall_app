import 'package:sall_app/models/login_models.dart';

abstract class ShopStates{}

class ShopInitialSates extends ShopStates{}
class ShopChangeNavBarSates extends ShopStates{}


class ShopProfileLoadingStates extends ShopStates{}
class shopProfileSccussStates extends ShopStates{
final LoginModel? model;

  shopProfileSccussStates(this.model);
}
class shopProfileerrorStates extends ShopStates{
  final String error;

  shopProfileerrorStates(this.error);
}



class ShopupdateProfileLoadingStates extends ShopStates{}
class shopupdateProfileSccussStates extends ShopStates{
  final LoginModel? model;

  shopupdateProfileSccussStates(this.model);
}
class shopupdateProfileerrorStates extends ShopStates{
  final String error;

  shopupdateProfileerrorStates(this.error);
}



class ShopHOMELoadingStates extends ShopStates{}
class shopHOMESccussStates extends ShopStates{

}
class shopHOMEeerrorStates extends ShopStates{
  final String error;

  shopHOMEeerrorStates(this.error);
}

class ShopCategoriesLoadingStates extends ShopStates{}
class shopCategoriesSccussStates extends ShopStates{

}
class shopCategorieseerrorStates extends ShopStates{
  final String error;

  shopCategorieseerrorStates(this.error);
}


class ShopFavoritesLoadingStates extends ShopStates{}
class shopFavoritesSccussStates extends ShopStates{

}
class shopFavoriteserrorStates extends ShopStates{
  final String error;

  shopFavoriteserrorStates(this.error);
}



class ShopchangeFavoritesLoadingStates extends ShopStates{}
class shopchangeFavoritesSccussStates extends ShopStates{

}
class shopchangeFavoriteserrorStates extends ShopStates{
  final String error;

  shopchangeFavoriteserrorStates(this.error);
}


class ShopSearchLoadingStates extends ShopStates{}
class shopSearchSccussStates extends ShopStates{

}
class shopSearcherrorStates extends ShopStates{
  final String error;

  shopSearcherrorStates(this.error);
}