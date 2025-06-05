import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'app.dart';
import 'di.dart';
import 'presentation/bloc/cat_bloc.dart';
import 'presentation/bloc/liked_cats_bloc.dart';
import 'domain/repositories/cat_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupDependencies();
  
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CatBloc(
            getIt<CatRepository>(),
            connectivity: getIt<Connectivity>(),
          )..add(LoadRandomCatEvent())..add(CheckConnectivityEvent()),
        ),
        BlocProvider(
          create: (context) => LikedCatsBloc(getIt<CatRepository>())..add(LoadLikedCatsEvent()),
        ),
      ],
      child: const MyApp(),
    ),
  );
}