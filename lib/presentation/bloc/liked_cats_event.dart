part of 'liked_cats_bloc.dart';

@immutable
abstract class LikedCatsEvent {}

class LoadLikedCatsEvent extends LikedCatsEvent {}

class AddLikedCatEvent extends LikedCatsEvent {
  final Cat cat;
  AddLikedCatEvent(this.cat);
}

class RemoveLikedCatEvent extends LikedCatsEvent {
  final String catId;
  RemoveLikedCatEvent(this.catId);
}

class FilterLikedCatsEvent extends LikedCatsEvent {
  final String? breed;
  FilterLikedCatsEvent(this.breed);
}