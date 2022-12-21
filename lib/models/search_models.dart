class SearchModel
{
  bool? status;
  SearchData? data;
  SearchModel.fromJson(Map<String , dynamic>json)
  {
    status = json['status'];
    data =  SearchData.fromJson(json['data']);
    //SearchData.fromJson(json['data']);
  }
}
class SearchData
{
  int? current_page;
  List<searchListData> ?data =[];
  String? first_page_url;
  int? from;
  int? last_page;
  String? last_page_url;
  String? next_page_url;
  String? path;
  int? per_page;
  int? to;
  int? total;
  SearchData.fromJson(Map<String , dynamic>json)
  {
    current_page = json['current_page'];
    json['data'].forEach((element){
      data!.add(searchListData.fromJson(element));
    });
    first_page_url = json['first_page_url'];
    from = json['from'];
    last_page = json['last_page'];
    last_page_url = json['last_page_url'];
    next_page_url = json['next_page_url'];
    path = json['path'];
    per_page = json['per_page'];
    to = json['to'];
    total = json['total'];

  }
}
class searchListData{
  int? id;
  dynamic? price;
  dynamic? old_price;
  dynamic? discount;
  String? image;
  String? name;
  bool? infavorites;
  bool? in_cart;
  searchListData.fromJson(Map<String , dynamic>json)
  {

    id = json['id'];
    price = json['price'];
    old_price = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    //description = json['description'];
    infavorites = json['in_favorites'];
    in_cart = json['in_cart'];

  }

}
