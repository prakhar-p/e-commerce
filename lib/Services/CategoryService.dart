import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Models/Category.dart';

List<Category> listCategory=[];
class CategoryService{

  Future<List<Category>> getCategory() async{
    final response=await http.get(Uri.parse('https://api.escuelajs.co/api/v1/categories'));
    var data=jsonDecode(response.body.toString());
    if(response.statusCode==200){
      listCategory.clear();
      for(Map i in data){
        listCategory.add(Category.fromJson(i));
      }
      return listCategory;
    }else{
      return listCategory;
    }
  }
}