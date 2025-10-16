import 'package:dio/dio.dart';
import 'package:pets_finder_app/core/networking/api_error_model.dart';
import 'package:pets_finder_app/core/networking/api_results.dart';
import 'package:pets_finder_app/features/home/data/models/pet.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pets_finder_app/features/home/data/repos/home_repo.dart';


part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo homeRepo;
  HomeCubit({required this.homeRepo}) : super(HomeInitial());


  void getPets()async{
    emit(Loading());

    final response = await homeRepo.getPets();

    response.when(onSuccess: (data){
      emit(Succuss(pets: data));
    }, onError: (error){
       emit(Faliure(error: error));
    });
  }
}
