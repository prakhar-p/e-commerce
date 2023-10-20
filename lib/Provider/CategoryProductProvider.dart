import 'package:flutter/foundation.dart';
import 'package:shop/Services/CategoryService.dart';
import '../Models/CategoryProduct.dart';
import '../Services/CategoryProductService.dart';

class CategoryProductProvider extends ChangeNotifier{
  final _service=CategoryProductService();
  bool isLoading=false;
  List<CategoryProduct> _categoryProduct=[];
  List<CategoryProduct> get category=> _categoryProduct;

  Future<void> getAllCategoryProduct() async{
    isLoading=true;
    notifyListeners();
    final response= await _service.getCategoryProduct(listCategory[index].id!.toInt());

    _categoryProduct=response;
    isLoading=false;
    notifyListeners();
  }
}