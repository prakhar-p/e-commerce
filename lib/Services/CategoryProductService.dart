import 'dart:convert';
import '../Models/CategoryProduct.dart';
import 'package:http/http.dart' as http;

List<CategoryProduct> listCategoryProduct=[];
class CategoryProductService{
  Future<List<CategoryProduct>> getCategoryProduct(int digit) async{
    final response=await http.get(Uri.parse('https://api.escuelajs.co/api/v1/categories/${digit}/products'));
    var data=jsonDecode(response.body.toString());
    if(response.statusCode==200){
      listCategoryProduct.clear();
      for(Map i in data){
        listCategoryProduct.add(CategoryProduct.fromJson(i));
      }
      return listCategoryProduct;
    }else{
      return listCategoryProduct;
    }
  }
}