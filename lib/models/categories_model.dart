class CategoriesModel
{
  bool? status;
  CategoriesData? data;
  CategoriesModel.fromJson(Map<String , dynamic>json)
  {
    status = json['status'];
    data = CategoriesData.fromJson(json['data']);
  }
}
class CategoriesData
{
  int? current_page;
  List<ListData> ?data =[];
  String? first_page_url;
  int? from;
  int? last_page;
  String? last_page_url;
  String? next_page_url;
  String? path;
  int? per_page;
  int? to;
  int? total;
  CategoriesData.fromJson(Map<String , dynamic>json)
  {
    current_page = json['current_page'];
    json['data'].forEach((element){
      data!.add(ListData.fromJson(element));
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
 class ListData{
   int? id;
   String? name;
   String? image;
   ListData.fromJson(Map<String , dynamic>json)
   {
     id = json['id'];
     name = json['name'];
     image = json['image'];

   }

 }
