class FavoritesModel
{
  bool ? status;
  String ? message;

  FavoritesModel.fromJson(Map<String , dynamic>json)
  {
    status = json['status'];
    message = json['message'];

  }
}

//
// class FavoriteData
// {
//   int? id;
//   List<Favoritesproduct> ? product=[];
//   FavoriteData.fromJson(Map<String , dynamic>json)
//   {
//     id = json['id'];
//      json['product'].forEach((element){
//        product!.add( Favoritesproduct.fromJson(element));
//      });
//   }
// }
//
// class Favoritesproduct
// {
//   int? id;
//   dynamic price;
//   dynamic old_price;
//   dynamic discount;
//   String? image;
//   Favoritesproduct.fromJson(Map<String , dynamic>json)
//   {
//     id =json['id'];
//     price =json['price'];
//     old_price =json['old_price'];
//     discount =json['discount'];
//     image =json['image'];
//
//
//   }
//
// }