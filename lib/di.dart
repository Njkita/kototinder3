import 'package:get_it/get_it.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import '../data/datasources/local/cat_local_datasource.dart';
import '../data/datasources/remote/cat_remote_datasource.dart';
import '../data/repositories/cat_repository_impl.dart';
import '../domain/repositories/cat_repository.dart';
import '../data/database/database.dart';

final getIt = GetIt.instance;

Future<void> setupDependencies() async {
  getIt.registerSingleton<AppDatabase>(AppDatabase());
  
  getIt.registerSingleton<CatRemoteDataSource>(CatRemoteDataSourceImpl());
  getIt.registerSingleton<CatLocalDataSource>(CatLocalDataSourceImpl(database: getIt()));
  
  getIt.registerSingleton<CatRepository>(
    CatRepositoryImpl(
      remoteDataSource: getIt(),
      localDataSource: getIt(),
    ),
  );
  
  // Connectivity
  getIt.registerSingleton<Connectivity>(Connectivity());
}