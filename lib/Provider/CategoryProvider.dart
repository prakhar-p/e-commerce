import 'package:flutter/foundation.dart';
import 'package:shop/Models/Category_m.dart';
import 'package:shop/Services/CategoryService.dart';

class CategoryProvider extends ChangeNotifier{
  final _service=CategoryService();
  bool isLoading=false;
  List<CategoryM> _category=[];
  List<CategoryM> get category=> _category;

  Future<void> getAllCategory() async{
    isLoading=true;
    notifyListeners();
    final response= await _service.getCategory();

    _category=response.cast<CategoryM>();
    isLoading=false;
    notifyListeners();
  }
}