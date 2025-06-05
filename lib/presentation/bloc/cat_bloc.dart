import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import '../../domain/repositories/cat_repository.dart';
import '../../data/models/cat_model.dart';

part 'cat_event.dart';
part 'cat_state.dart';

class CatBloc extends Bloc<CatEvent, CatState> {
  final CatRepository catRepository;
  final Connectivity connectivity;

  CatBloc(this.catRepository, {Connectivity? connectivity})
      : connectivity = connectivity ?? Connectivity(),
        super(CatInitial()) {
    on<LoadRandomCatEvent>(_onLoadRandomCat);
    on<CheckConnectivityEvent>(_onCheckConnectivity);
  }

  Future<void> _onLoadRandomCat(
    LoadRandomCatEvent event,
    Emitter<CatState> emit,
  ) async {
    emit(CatLoading());
    try {
      final cat = await catRepository.fetchRandomCat();
      final isLiked = await catRepository.isCatLiked(cat.id);
      emit(CatLoaded(cat.copyWith(likedAt: isLiked ? DateTime.now() : null)));
    } catch (e) {
      emit(CatError(e.toString()));
    }
  }

  Future<void> _onCheckConnectivity(
    CheckConnectivityEvent event,
    Emitter<CatState> emit,
  ) async {
    final connectivityResult = await connectivity.checkConnectivity();
    emit(ConnectivityStatus(connectivityResult != ConnectivityResult.none));
  }
}