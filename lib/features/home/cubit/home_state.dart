part of 'home_cubit.dart';

sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class Loading extends HomeState {}

final class Succuss extends HomeState {
  final List<Pet> pets;

  Succuss({required this.pets});
}

final class Faliure extends HomeState {
  final ApiErrorModel error;

  Faliure({required this.error});
}
