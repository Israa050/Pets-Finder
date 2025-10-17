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

final class FavoriteImae extends HomeState{

  final String? message;

  FavoriteImae({required this.message});
  
}

final class Favorites extends  HomeState {
  final List<Favorite> favorites;

  Favorites({required this.favorites});
}
