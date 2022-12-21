class HomeData
{
  bool? status;
  listData ?data;
  HomeData.fromJson(Map<String , dynamic>json)
  {
    status =json['status'];
    data = listData.fromJson(json['data']);
  }
}
class listData
{
  List<listbanners>? banners=[];
  List<listproducts>? products=[] ;
  listData.fromJson(Map<String , dynamic>json)
  {
    json['banners'].forEach((element)
    {
      banners!.add(listbanners.fromJson(element));

    });
    json['products'].forEach((element)
    {
      products!.add(listproducts.fromJson(element));
    });
  }
}

class listbanners
{
  int? id;
  String? image;
  listbanners.fromJson(Map<String , dynamic>json)
  {
    id = json['id'];
    image = json['image'];

  }
}

class listproducts
{
  int? id;
  dynamic? price;
  dynamic? old_price;
  dynamic? discount;
  String? image;
  String? name;
  bool? infavorites;
  bool? in_cart;
  listproducts.fromJson(Map<String , dynamic>json)
  {
    name = json['name'];
    id = json['id'];
    price = json['price'];
    old_price = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    //description = json['description'];
    infavorites = json['in_favorites'];
    in_cart = json['in_cart'];

  }
}