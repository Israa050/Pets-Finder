
import 'package:pets_finder_app/core/networking/api_results.dart';
import 'package:pets_finder_app/features/home/data/models/favorite_request_body.dart';
import 'package:pets_finder_app/features/home/data/models/favorite_response_body.dart';
import 'package:pets_finder_app/features/home/data/models/favorites.dart';
import 'package:pets_finder_app/features/home/data/models/pet.dart';

abstract class HomeRepoInterface {

  Future<ApiResult<FavoriteResponseBody>> favoriteImage(FavoriteRequestBody body);

  Future<ApiResult<FavoriteResponseBody>> deleteFromFavorite(int favoriteId);

  Future<ApiResult<List<Favorite>>> getFavorites();

  Future<ApiResult<List<Breeds>>> getBreeds();
}