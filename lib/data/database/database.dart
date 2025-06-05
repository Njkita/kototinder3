import 'package:drift/drift.dart';
import 'package:path_provider/path_provider.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'dart:io';

part 'database.g.dart';

class Cats extends Table {
  TextColumn get id => text()();
  TextColumn get imageUrl => text()();
  TextColumn get breedName => text()();
  TextColumn get description => text().nullable()();
  TextColumn get origin => text().nullable()();
  TextColumn get temperament => text().nullable()();
  TextColumn get lifeSpan => text().nullable()();
  DateTimeColumn get likedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

class CachedCats extends Table {
  TextColumn get id => text()();
  TextColumn get imageUrl => text()();
  TextColumn get breedName => text()();
  TextColumn get description => text().nullable()();
  TextColumn get origin => text().nullable()();
  TextColumn get temperament => text().nullable()();
  TextColumn get lifeSpan => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

@DriftDatabase(tables: [Cats, CachedCats])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<List<Cat>> getLikedCats() async {
    final results = await select(cats).get();
    return results.map((cat) => Cat(
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

  Future<void> likeCat(Cat cat) async {
    await into(cats).insertOnConflictUpdate(
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

  Future<void> unlikeCat(String catId) async {
    await (delete(cats)..where((t) => t.id.equals(catId))).go();
  }

  Future<bool> isCatLiked(String catId) async {
    final cat = await (select(cats)..where((t) => t.id.equals(catId))).getSingleOrNull();
    return cat != null;
  }

  Future<void> cacheCats(List<Cat> cats) async {
    await batch((batch) {
      batch.deleteAll(cachedCats);
      batch.insertAll(
        cachedCats,
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

  Future<List<Cat>> getCachedCats() async {
    final cached = await select(cachedCats).get();
    return cached.map((cat) => Cat(
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

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}