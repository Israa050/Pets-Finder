



import 'dart:ui';

import 'package:pets_finder_app/core/networking/api_results.dart';
import 'package:pets_finder_app/core/networking/api_service.dart';
import 'package:pets_finder_app/features/home/data/models/favorite_request_body.dart';
import 'package:pets_finder_app/features/home/data/models/favorite_response_body.dart';
import 'package:pets_finder_app/features/home/data/models/favorites.dart';
import 'package:pets_finder_app/features/home/data/models/image.dart';
import 'package:pets_finder_app/features/home/data/models/pet.dart';


class HomeRepo {

  final ApiService apiService;

  HomeRepo({required this.apiService});

  Future<ApiResult<List<Pet>>> getPets () async {
    try {
      final response = await apiService.getPets();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.error(e);
    }
  }

  Future<ApiResult<List<PetImage>>> getImages () async {
    try {
      final response = await apiService.getImages();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.error(e);
    }
  }

  Future<ApiResult<FavoriteResponseBody>> favoriteImage (FavoriteRequestBody body) async {
    try {
      final response = await apiService.favoriteImage(body);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.error(e);
    }
  }

  Future<ApiResult<List<Favorite>>> getFavorites () async {
    try {
      final response = await apiService.getFavorites();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.error(e);
    }
  }



}