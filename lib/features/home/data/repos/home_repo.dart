import 'dart:ui';

import 'package:pets_finder_app/core/networking/api_results.dart';
import 'package:pets_finder_app/core/networking/api_service.dart';
import 'package:pets_finder_app/features/home/data/models/favorite_request_body.dart';
import 'package:pets_finder_app/features/home/data/models/favorite_response_body.dart';
import 'package:pets_finder_app/features/home/data/models/favorites.dart';
import 'package:pets_finder_app/features/home/data/models/pet.dart';
import 'package:pets_finder_app/features/home/domain/repos/home_repo_interface.dart';

class HomeRepo extends HomeRepoInterface{
  final ApiService apiService;

  HomeRepo({required this.apiService});


  @override
  Future<ApiResult<FavoriteResponseBody>> favoriteImage(
    FavoriteRequestBody body,
  ) async {
    try {
      final response = await apiService.favoriteImage(body);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.error(e);
    }
  }

  @override
  Future<ApiResult<FavoriteResponseBody>> deleteFromFavorite(
    int favoriteId,
  ) async {
    try {
      final response = await apiService.deleteFromFavorite(favoriteId);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.error(e);
    }
  }

  @override
  Future<ApiResult<List<Favorite>>> getFavorites() async {
    try {
      final response = await apiService.getFavorites();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.error(e);
    }
  }

  @override
  Future<ApiResult<List<Breeds>>> getBreeds() async {
    try {
      final response = await apiService.getBreeds();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.error(e);
    }
  }

}
