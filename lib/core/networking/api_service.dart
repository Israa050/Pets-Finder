



import 'package:dio/dio.dart';
import 'package:pets_finder_app/core/networking/api_constants.dart';
import 'package:pets_finder_app/features/home/data/models/pet.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';



part 'api_service.g.dart';


@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {

  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;


  @GET('${ApiConstants.images}?limit=10&breed_ids=beng&api_key=live_23O8T2qvHwGPkFYNbldtVPaavcv7YzLwcJwaZ1pvs9V3zq5p6KXctFlEm70zhjXv')
  Future<List<Pet>> getPets();


}