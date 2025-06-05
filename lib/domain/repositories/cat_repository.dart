import '../../data/models/cat_model.dart';

abstract class CatRepository {
  Future<Cat> fetchRandomCat();
  Future<List<Cat>> getLikedCats();
  Future<void> likeCat(Cat cat);
  Future<void> unlikeCat(String catId);
  Future<bool> isCatLiked(String catId);
}