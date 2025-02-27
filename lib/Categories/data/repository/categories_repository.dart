import '../../../core/client.dart';
import '../models/category_model.dart';

class CategoriesRepository {
  CategoriesRepository({required this.client});

  final ApiClient client;
  List<CategoriesModel>? myCategory;

  Future<List<CategoriesModel>?> fetchCategories() async {
    print("Ma'lumotlarni olib kelish boshlandi...");

    var response = await client.fetchCategories();

    if (response == null || response.data == null) {
      print("API dan ma'lumot kelmadi!");
      return null;
    }

    try {
      var data = response.data as List; // JSON list sifatida olish
      myCategory = data.map((e) => CategoriesModel.fromJson(e)).toList();
      print("Olingan kategoriya: $myCategory");
      return myCategory;
    } catch (e) {
      print("Kategoriya parsing xatosi: $e");
      return null;
    }
  }
}
