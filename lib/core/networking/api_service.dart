


import 'package:dio/dio.dart';
import 'package:pets_finder_app/core/networking/api_constants.dart';
import 'package:pets_finder_app/features/home/data/models/favorite_request_body.dart';
import 'package:pets_finder_app/features/home/data/models/favorite_response_body.dart';
import 'package:pets_finder_app/features/home/data/models/favorites.dart';
import 'package:pets_finder_app/features/home/data/models/image.dart';
import 'package:pets_finder_app/features/home/data/models/pet.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';



part 'api_service.g.dart';


@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {

  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;


  @GET('${ApiConstants.imagesSearch}?limit=10&breed_ids=beng&api_key=live_23O8T2qvHwGPkFYNbldtVPaavcv7YzLwcJwaZ1pvs9V3zq5p6KXctFlEm70zhjXv')
  Future<List<Pet>> getPets();

  @GET(ApiConstants.breeds)
  Future<List<Breeds>> getBreeds();


  @GET('${ApiConstants.imagesSearch}?limit=10')
  Future<List<PetImage>> getImages();


  @POST(ApiConstants.favourites)
  Future<FavoriteResponseBody> favoriteImage(@Body() FavoriteRequestBody body);

  @GET(ApiConstants.favourites)
  Future<List<Favorite>> getFavorites();

  @DELETE('${ApiConstants.favourites}/{favouriteId}')
  Future<FavoriteResponseBody> deleteFromFavorite(@Path('favouriteId') int favouriteId);

}