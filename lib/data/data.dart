import 'package:wallpaper_hub/Models/category_model.dart';

String apiKey = '563492ad6f91700001000001451153483e634f4bace97ce98c0cefe6';

List<CategoryModel> getCategory() {
  List<CategoryModel> categories = [];
  CategoryModel categoryModel = new CategoryModel();

  categoryModel.categoryName = "Street Art";
  categoryModel.imgUrl =
      "https://images.pexels.com/photos/545008/pexels-photo-545008.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categories.add(categoryModel);
  categoryModel = new CategoryModel();

  categoryModel.categoryName = "Wild Life";
  categoryModel.imgUrl =
  "https://images.pexels.com/photos/704320/pexels-photo-704320.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categories.add(categoryModel);
  categoryModel = new CategoryModel();

  categoryModel.categoryName = "Nature";
  categoryModel.imgUrl =
  "https://images.pexels.com/photos/34950/pexels-photo.jpg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categories.add(categoryModel);
  categoryModel = new CategoryModel();

  categoryModel.categoryName = "City";
  categoryModel.imgUrl =
  "https://images.pexels.com/photos/466685/pexels-photo-466685.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categories.add(categoryModel);
  categoryModel = new CategoryModel();

  categoryModel.categoryName = "Motivation";
  categoryModel.imgUrl =
  "https://images.pexels.com/photos/1434819/pexels-photo-1434819.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260";
  categories.add(categoryModel);
  categoryModel = new CategoryModel();

  categoryModel.categoryName = "Bikes";
  categoryModel.imgUrl =
  "https://images.pexels.com/photos/2116475/pexels-photo-2116475.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categories.add(categoryModel);
  categoryModel = new CategoryModel();

  return categories;
}
