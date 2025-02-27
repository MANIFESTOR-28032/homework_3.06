import 'package:flutter/cupertino.dart';

import '../data/models/category_model.dart';
import '../data/repository/categories_repository.dart';



class CategoriesViewModel extends ChangeNotifier {
  CategoriesViewModel({required CategoriesRepository repo}) : _repo = repo {
    load();
  }

  final CategoriesRepository _repo;

  List<CategoriesModel>? myCategory = [];

  Future load() async {
    print("nimadir");
    myCategory = await _repo.fetchCategories();
    print(myCategory.toString());
    notifyListeners();
  }
}