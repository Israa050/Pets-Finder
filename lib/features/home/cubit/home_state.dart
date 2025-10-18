part of 'home_cubit.dart';

sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class Loading extends HomeState {}

final class Succuss extends HomeState {
  final List<PetImage> pets;

  Succuss({required this.pets});
}

final class Faliure extends HomeState {
  final ApiErrorModel error;

  Faliure({required this.error});
}

final class FavoriteImage extends HomeState{

  final String? message;

  FavoriteImage({required this.message});
  
}

final class Favorites extends  HomeState {
  final List<Favorite> favorites;

  Favorites({required this.favorites});
}

final class BreedsSate extends HomeState{
  final List<Breeds> breeds;

  BreedsSate({required this.breeds});
}

final class FilteredBreeds extends HomeState{
  final List<Breeds> breeds;

  FilteredBreeds({required this.breeds});

  
}

final class EmptyFilteredBreedsState extends HomeState {}

