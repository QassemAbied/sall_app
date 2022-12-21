//import 'dart:html';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sall_app/components/constant.dart';
import 'package:sall_app/models/categories_model.dart';
import 'package:sall_app/models/changefavorites.dart';
import 'package:sall_app/models/favorites_model.dart';
import 'package:sall_app/models/home_nodels.dart';
import 'package:sall_app/models/login_models.dart';
import 'package:sall_app/models/search_models.dart';
import 'package:sall_app/modules/home/categories_screen.dart';
import 'package:sall_app/modules/home/favorites_screen.dart';
import 'package:sall_app/modules/home/product_screen.dart';
import 'package:sall_app/modules/home/settings_screen.dart';
import 'package:sall_app/network/end_pointes.dart';
import 'package:sall_app/network/remote/diohelper.dart';
import 'package:sall_app/shard/cubit/states.dart';

class ShopCubit extends Cubit<ShopStates>{
  ShopCubit() : super(ShopInitialSates());

 static ShopCubit get(context) => BlocProvider.of(context);
List<Widget>Screens=
[
  ProductScreen(),
  CategoriesScreen(),
  FavoritesScreen(),
  SettingsScreen(),
];
  int currentIndex =0;
  void ChangeNavBar(index)
  {
    currentIndex=index;
    emit(ShopChangeNavBarSates(),);
  }

  LoginModel ? profilemodel;
void profiledata()
{
  emit(ShopProfileLoadingStates());
  DioHelper.getdata(
    url: PROFILE,
    token: token,
  ).then((value) {
    profilemodel=LoginModel.fromJson(value.data);
    emit(shopProfileSccussStates(profilemodel));
  }).catchError((error){
    emit(shopProfileerrorStates(error.toString()));
  });
}

void updateprofilr({
  String ? name,
  String ? phone,
  String ? email,
})
{

  emit(ShopupdateProfileLoadingStates());
  DioHelper.putData(
    url: UPDATE_PROFILE,
    token: token,
    data: {
      'name':name,
      'phone':phone,
      'email':email,
    }
  ).then((value) {
    profilemodel=LoginModel.fromJson(value.data);
    emit(shopupdateProfileSccussStates(profilemodel));
  }).catchError((error){
    emit(shopupdateProfileerrorStates(error.toString()));
  });
}
  CategoriesModel ? categoriesmodel;
   void Categoriesdata()
   {
     emit(ShopCategoriesLoadingStates());
     DioHelper.getdata(
       url: CATEGORIES,
     ).then((value){
       categoriesmodel=CategoriesModel.fromJson(value.data);

       emit(shopCategoriesSccussStates());
     }).catchError((error){
       emit(shopCategorieseerrorStates(error.toString()));
     });
     }


  Map<int , bool>? favorites = {};
  HomeData ? homemodel;
void data()
{
  emit(ShopHOMELoadingStates());
     DioHelper.getdata(
  url: HOME,
  token: token,
).then((value){
  homemodel=HomeData.fromJson(value.data);
   homemodel!.data!.products!.forEach((element) {
     favorites!.addAll({
       element.id! : element.infavorites!,
     });
   });
  emit(shopHOMESccussStates());
}).catchError((error){
  emit(shopHOMEeerrorStates(error.toString()));
});
}

  FavoritesModel ? favoritesmodel;
  void Favoritesdata(int ?productid)
  {
    favorites![productid!] =! favorites![productid]! ;
    emit(ShopFavoritesLoadingStates());
    DioHelper.postData(
      url: FAVORITES,
      token: token,
      data: {
        'product_id':productid ,
      }
    ).then((value) {
      favoritesmodel = FavoritesModel.fromJson(value.data);
      print(value.data);
      if(favoritesmodel!.status==false)
      {
        favorites![productid] =! favorites![productid]! ;
      }else
      {
        changefavorites();
      }
      emit(shopFavoritesSccussStates());
    }).catchError((error){
      favorites![productid] =! favorites![productid]! ;
      emit(shopFavoriteserrorStates(error.toString(),),);
    });
  }

  FavoriteClassModel? favoritesclass;
  void changefavorites()
  {
    emit(ShopchangeFavoritesLoadingStates());
    DioHelper.getdata(
      url: FAVORITES,
      token:  token,
    ).then((value) {
      favoritesclass=FavoriteClassModel.fromJson(value.data);
      emit(shopchangeFavoritesSccussStates());
    }).catchError((error){
      emit(shopchangeFavoriteserrorStates(error.toString()));
    });
  }





}