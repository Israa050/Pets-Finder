
import 'package:pets_finder_app/core/networking/api_error_model.dart';
import 'package:pets_finder_app/features/home/data/models/favorite_request_body.dart';
import 'package:pets_finder_app/features/home/data/models/favorites.dart';
import 'package:pets_finder_app/features/home/data/models/image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pets_finder_app/features/home/data/repos/home_repo.dart';


part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo homeRepo;
  HomeCubit({required this.homeRepo}) : super(HomeInitial());


  void getPets()async{
    emit(Loading());

    // final response = await homeRepo.getPets();

    // response.when(onSuccess: (data){
    //   emit(Succuss(pets: data));
    // }, onError: (error){
    //    emit(Faliure(error: error));
    // });
  }

   void getImages()async{
    emit(Loading());

    final response = await homeRepo.getImages();

    response.when(onSuccess: (data){
      emit(Succuss(pets: data));
    }, onError: (error){
       emit(Faliure(error: error));
    });
  }

  void favoriteImage(FavoriteRequestBody body)async{
    emit(Loading());
    final response = await homeRepo.favoriteImage(body);
    response.when(
      onSuccess: (data){
        emit(FavoriteImae(message: data.message));
      },
     onError: (error){
      emit(Faliure(error: error));
    });
  }

  void favorites()async{
    emit(Loading());
    final response = await homeRepo.getFavorites();
    response.when(
      onSuccess: (data){
        emit(Favorites(favorites: data));
      },
     onError: (error){
      emit(Faliure(error: error));
    });
  }


}
