



import 'package:pets_finder_app/core/networking/api_results.dart';
import 'package:pets_finder_app/core/networking/api_service.dart';
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

}