class FavoriteClassModel
{
  bool ? status;
  favoritedataclass? data;
  FavoriteClassModel.fromJson(Map<String , dynamic>json)
  {
    status = json['status'];
    data = json['data']  !=null ? favoritedataclass.fromJson(json['data']) :null;

  }
}

class favoritedataclass
{
  int? current_page;
  List<dataclass> ? data =[];
  String? first_page_url;
  int? from;
  int? last_page;
  String? last_page_url;
  String? next_page_url;
  String? first_ppathage_url;
  int? per_page;
  int? to;
  int? total;





  favoritedataclass.fromJson(Map<String , dynamic>json)
  {
    current_page = json['current_page'];
    //data = json['data']  !=null ? dataclass.fromJson(json['product']) :null;
    json['data'].forEach((element)
    {
      data!.add(dataclass.fromJson(element));
    });
    //data=dataclass.fromJson( json['data']) as List<dataclass>?;
    first_page_url = json['first_page_url'];
    from = json['from'];
    last_page = json['last_page'];
    last_page_url = json['last_page_url'];
    next_page_url = json['next_page_url'];
    first_ppathage_url = json['first_ppathage_url'];
    per_page = json['per_page'];
    to = json['to'];
    total = json['total'];

  }
}

class dataclass
{
  int? id;
  //List<productdata>? product=[];
  productdata? product;
  dataclass.fromJson(Map<String , dynamic>json)
  {
    id = json['id'];
    // json['product'].forEach((element)
    // {
    //   product!.add( productdata.fromJson(element));
    // });
    // product = json['product'] !=null ?productdata.fromJson(json['product']) : null;
    product= productdata.fromJson(json['product']);

  }
}

class productdata {
  int? id;
  dynamic? price;
  dynamic? old_price;
  dynamic? discount;
  String? image;
  String? name;
  String? description;

  productdata.fromJson(Map<String, dynamic>json)
  {
    id = json['id'];
    price = json['price'];
    old_price = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    description = json['description'];
  }
}