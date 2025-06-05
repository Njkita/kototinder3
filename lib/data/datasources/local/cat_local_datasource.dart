import 'package:drift/drift.dart' show Value;
import '../../models/cat_model.dart' as models;
import '../../database/database.dart';

abstract class CatLocalDataSource {
  Future<List<models.Cat>> getLikedCats();
  Future<void> likeCat(models.Cat cat);
  Future<void> unlikeCat(String catId);
  Future<bool> isCatLiked(String catId);
  Future<void> cacheCats(List<models.Cat> cats);
  Future<List<models.Cat>> getCachedCats();
}

class CatLocalDataSourceImpl implements CatLocalDataSource {
  final AppDatabase database;

  CatLocalDataSourceImpl({required this.database});

  @override
  Future<List<models.Cat>> getLikedCats() async {
    final results = await database.select(database.cats).get();
    return results.map((dbCat) => models.Cat(
      id: dbCat.id,
      imageUrl: dbCat.imageUrl,
      breedName: dbCat.breedName,
      description: dbCat.description,
      origin: dbCat.origin,
      temperament: dbCat.temperament,
      lifeSpan: dbCat.lifeSpan,
      likedAt: dbCat.likedAt,
    )).toList();
  }

  @override
  Future<void> likeCat(models.Cat cat) async {
    await database.into(database.cats).insertOnConflictUpdate(
      CatsCompanion(
        id: Value(cat.id),
        imageUrl: Value(cat.imageUrl),
        breedName: Value(cat.breedName),
        description: Value(cat.description),
        origin: Value(cat.origin),
        temperament: Value(cat.temperament),
        lifeSpan: Value(cat.lifeSpan),
        likedAt: Value(cat.likedAt),
      ),
    );
  }

  @override
  Future<void> unlikeCat(String catId) async {
    await (database.delete(database.cats)..where((t) => t.id.equals(catId))).go();
  }

  @override
  Future<bool> isCatLiked(String catId) async {
    final cat = await (database.select(database.cats)..where((t) => t.id.equals(catId))).getSingleOrNull();
    return cat != null;
  }

  @override
  Future<void> cacheCats(List<models.Cat> cats) async {
    await database.batch((batch) {
      batch.deleteAll(database.cachedCats);
      batch.insertAll(
        database.cachedCats,
        cats.map((cat) => CachedCatsCompanion(
          id: Value(cat.id),
          imageUrl: Value(cat.imageUrl),
          breedName: Value(cat.breedName),
          description: Value(cat.description),
          origin: Value(cat.origin),
          temperament: Value(cat.temperament),
          lifeSpan: Value(cat.lifeSpan),
        )),
      );
    });
  }

  @override
  Future<List<models.Cat>> getCachedCats() async {
    final cached = await database.select(database.cachedCats).get();
    return cached.map((cat) => models.Cat(
      id: cat.id,
      imageUrl: cat.imageUrl,
      breedName: cat.breedName,
      description: cat.description,
      origin: cat.origin,
      temperament: cat.temperament,
      lifeSpan: cat.lifeSpan,
      likedAt: null,
    )).toList();
  }
}