import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../domain/repositories/cat_repository.dart';
import '../../data/models/cat_model.dart';

part 'liked_cats_event.dart';
part 'liked_cats_state.dart';

class LikedCatsBloc extends Bloc<LikedCatsEvent, LikedCatsState> {
  final CatRepository catRepository;
  String? _filterBreed;

  LikedCatsBloc(this.catRepository) : super(LikedCatsInitial()) {
    on<LoadLikedCatsEvent>(_onLoadLikedCats);
    on<AddLikedCatEvent>(_onAddLikedCat);
    on<RemoveLikedCatEvent>(_onRemoveLikedCat);
    on<FilterLikedCatsEvent>(_onFilterLikedCats);
  }

  Future<void> _onLoadLikedCats(
    LoadLikedCatsEvent event,
    Emitter<LikedCatsState> emit,
  ) async {
    emit(LikedCatsLoading());
    try {
      final cats = await catRepository.getLikedCats();
      emit(LikedCatsUpdated(cats, _filterBreed));
    } catch (e) {
      emit(LikedCatsError(e.toString()));
    }
  }

  Future<void> _onAddLikedCat(
    AddLikedCatEvent event,
    Emitter<LikedCatsState> emit,
  ) async {
    try {
      await catRepository.likeCat(event.cat);
      final cats = await catRepository.getLikedCats();
      emit(LikedCatsUpdated(cats, _filterBreed));
    } catch (e) {
      emit(LikedCatsError(e.toString()));
    }
  }

  Future<void> _onRemoveLikedCat(
    RemoveLikedCatEvent event,
    Emitter<LikedCatsState> emit,
  ) async {
    try {
      await catRepository.unlikeCat(event.catId);
      final cats = await catRepository.getLikedCats();
      
      if (_filterBreed != null) {
        final hasCatsWithBreed = cats.any((cat) => cat.breedName == _filterBreed);
        if (!hasCatsWithBreed) {
          _filterBreed = null;
        }
      }
      
      emit(LikedCatsUpdated(cats, _filterBreed));
    } catch (e) {
      emit(LikedCatsError(e.toString()));
    }
  }

  void _onFilterLikedCats(
    FilterLikedCatsEvent event,
    Emitter<LikedCatsState> emit,
  ) {
    _filterBreed = event.breed;
    if (state is LikedCatsUpdated) {
      emit(LikedCatsUpdated((state as LikedCatsUpdated).cats, _filterBreed));
    }
  }
}