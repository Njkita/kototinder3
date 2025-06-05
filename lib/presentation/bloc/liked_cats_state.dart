part of 'liked_cats_bloc.dart';

@immutable
abstract class LikedCatsState {}

class LikedCatsInitial extends LikedCatsState {}

class LikedCatsLoading extends LikedCatsState {}

class LikedCatsUpdated extends LikedCatsState {
  final List<Cat> cats;
  final String? filterBreed;
  
  LikedCatsUpdated(this.cats, this.filterBreed);
  
  List<Cat> get filteredCats {
    List<Cat> result = filterBreed == null 
        ? List<Cat>.from(cats) 
        : cats.where((cat) => cat.breedName == filterBreed).toList();
    
    result.sort((a, b) => a.breedName.compareTo(b.breedName));
    
    return result;
  }
}

class LikedCatsError extends LikedCatsState {
  final String message;
  LikedCatsError(this.message);
}