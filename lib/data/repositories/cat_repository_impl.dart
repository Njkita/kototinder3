import '../../domain/repositories/cat_repository.dart';
import '../datasources/local/cat_local_datasource.dart';
import '../datasources/remote/cat_remote_datasource.dart';
import '../models/cat_model.dart';

class CatRepositoryImpl implements CatRepository {
  final CatRemoteDataSource remoteDataSource;
  final CatLocalDataSource localDataSource;

  CatRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Cat> fetchRandomCat() async {
    try {
      final cat = await remoteDataSource.fetchRandomCat();
      await localDataSource.cacheCats([cat]);
      return cat;
    } catch (e) {
      final cachedCats = await localDataSource.getCachedCats();
      if (cachedCats.isNotEmpty) {
        return cachedCats.first;
      }
      throw Exception('No cats available');
    }
  }

  @override
  Future<List<Cat>> getLikedCats() async {
    final cats = await localDataSource.getLikedCats();
    return cats.map((cat) => Cat(
      id: cat.id,
      imageUrl: cat.imageUrl,
      breedName: cat.breedName,
      description: cat.description,
      origin: cat.origin,
      temperament: cat.temperament,
      lifeSpan: cat.lifeSpan,
      likedAt: cat.likedAt,
    )).toList();
  }

  @override
  Future<void> likeCat(Cat cat) async {
    await localDataSource.likeCat(cat);
  }

  @override
  Future<void> unlikeCat(String catId) async {
    await localDataSource.unlikeCat(catId);
  }

  @override
  Future<bool> isCatLiked(String catId) async {
    return await localDataSource.isCatLiked(catId);
  }
}