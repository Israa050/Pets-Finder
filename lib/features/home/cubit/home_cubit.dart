import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pets_finder_app/core/helpers/extensions.dart';
import 'package:pets_finder_app/core/networking/api_error_model.dart';
import 'package:pets_finder_app/features/home/data/models/favorite_request_body.dart';
import 'package:pets_finder_app/features/home/data/models/favorites.dart';
import 'package:pets_finder_app/features/home/data/models/image.dart';
import 'package:pets_finder_app/features/home/data/models/pet.dart';
import 'package:pets_finder_app/features/home/domain/repos/home_repo_interface.dart';

part 'home_state.dart';

/// Handles fetching pets, managing favorites, and filtering.
/// Keeps UI reactive via emitted states.
class HomeCubit extends Cubit<HomeState> {
  final HomeRepoInterface homeRepo;

  HomeCubit({required this.homeRepo}) : super(HomeInitial());

  // ───────────────────────────────
  // 🐾 State Data
  // ───────────────────────────────
  List<Breeds> breeds = [];
  List<Breeds> filteredBreeds = [];
  List<Favorite> favoritesList = [];
  Map<String, int> favoriteIds = {}; // imageId → favoriteId mapping

 

  // ───────────────────────────────
  // 🐕 Fetch breeds
  // ───────────────────────────────
  Future<void> getBreeds() async {
    emit(Loading());

    final response = await homeRepo.getBreeds();
    response.when(
      onSuccess: (data) {
        breeds = data;
        filteredBreeds = data;
        emit(BreedsSate(breeds: data));
      },
      onError: (error) => emit(Faliure(error: error)),
    );
  }

  // ───────────────────────────────
  // ❤️ Add image to favorites
  // Returns generated favorite ID
  // ───────────────────────────────
  Future<int> favoriteImage(String? imageId) async {
    if (imageId == null) return 0;

    int result = -1;

    final response = await homeRepo.favoriteImage(
      FavoriteRequestBody(imageId: imageId),
    );

    response.when(
      onSuccess: (data) {
        final favoriteId = data.id;
        if (favoriteId != null) {
          favoriteIds[imageId] = favoriteId;
          result = favoriteId;
        }
      },
      onError: (error) {
        emit(Faliure(error: error));
        result = -1;
      },
    );

    return result;
  }

  // ───────────────────────────────
  // 💔 Remove image from favorites
  // ───────────────────────────────
  Future<void> removeImageFromFavorite(int? favoriteImageId) async {
    if (favoriteImageId == null) return;

    final response = await homeRepo.deleteFromFavorite(favoriteImageId);

    response.when(
      onSuccess: (data) {
        favoritesList.removeWhere((f) => f.id == data.id);
        if(favoritesList.isEmpty){
          emit(EmptyFilteredBreedsState());
        }
        //emit(FavoritesUpdated(favorites: favoritesList));
      },
      onError: (error) => emit(Faliure(error: error)),
    );
  }

  // ───────────────────────────────
  // 🧡 Fetch all favorites
  // ───────────────────────────────
  Future<void> fetchFavorites() async {
    emit(Loading());

    final response = await homeRepo.getFavorites();

    response.when(
      onSuccess: (data) {
        if(data.isEmpty) {emit(EmptyFilteredBreedsState());}
        else{
        favoritesList = data;
        emit(Favorites(favorites: data));
        }
      },
      onError: (error) => emit(Faliure(error: error)),
    );
  }

  // ───────────────────────────────
  // 🔍 Filter breeds by keyword
  // ───────────────────────────────
  void filterBreeds(String keyword) {
  // 🧹 If user cleared the search field → show full list again
  if (keyword.isEmpty) {
    emit(BreedsSate(breeds: breeds));
    return;
  }

  // 🔍 Filter results
  filteredBreeds = breeds.filter(keyword);

  // 📭 If no matches found → emit empty state
  if (filteredBreeds.isEmpty) {
    emit(EmptyFilteredBreedsState());
  } else {
    emit(FilteredBreeds(breeds: filteredBreeds));
  }
}

}
