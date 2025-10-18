import 'package:flutter/material.dart';
import 'package:pets_finder_app/core/networking/api_error_model.dart';
import 'package:pets_finder_app/core/networking/api_results.dart';
import 'package:pets_finder_app/features/home/data/models/favorite_request_body.dart';
import 'package:pets_finder_app/features/home/data/models/favorite_response_body.dart';
import 'package:pets_finder_app/features/home/data/models/favorites.dart';
import 'package:pets_finder_app/features/home/data/models/image.dart';
import 'package:pets_finder_app/features/home/data/models/pet.dart';
import 'package:pets_finder_app/features/home/domain/repos/home_repo_interface.dart';

class MockedHomeRepo extends HomeRepoInterface {
  final List<Favorite> _favorites = [];
  final List<Breeds> _mockedBreeds = [
    Breeds(id: '1', name: 'Golden Retriever'),
    Breeds(id: '2', name: 'Bulldog'),
    Breeds(id: '3', name: 'Poodle'),
    Breeds(id: '4', name: 'German Shepherd'),
  ];

  int _nextFavoriteId = 1;

  // Simulate network delay
  Future<void> _simulateNetwork() async {
    await Future.delayed(const Duration(milliseconds: 500));
  }

  @override
  Future<ApiResult<FavoriteResponseBody>> deleteFromFavorite(
    int favoriteId,
  ) async {
     await _simulateNetwork();

    final removed =
        _favorites.firstWhere((fav) => fav.id == favoriteId, orElse: () => Favorite(id: -1));

    if (removed.id == -1) {
      return ApiResult.error(ApiErrorModel(message: 'Favorite not found',statusCode: 400,errors: [],icon: Icons.error));
    }

    _favorites.remove(removed);

    return ApiResult.success(FavoriteResponseBody(id: favoriteId, message: 'added'));
  }

  @override
  Future<ApiResult<FavoriteResponseBody>> favoriteImage(
    FavoriteRequestBody body,
  ) async {

    // Fake new favorite
    final newFavorite = Favorite(
      id: _nextFavoriteId++,
      imageId: body.imageId,
      image: PetImage(
        url:  'https://place-puppy.com/200x200', 
      )
    );

    _favorites.add(newFavorite);

    return ApiResult.success(
      FavoriteResponseBody(id: newFavorite.id,message: ''),
    );
    
  }

  @override
  Future<ApiResult<List<Breeds>>> getBreeds() async {
    await _simulateNetwork();
    return ApiResult.success(List.from(_mockedBreeds));
  }

  @override
  Future<ApiResult<List<Favorite>>> getFavorites() async {
    await _simulateNetwork();
    return ApiResult.success(List.from(_favorites));
  }
}
