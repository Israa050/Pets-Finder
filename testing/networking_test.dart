
import 'package:flutter_test/flutter_test.dart';
import 'package:pets_finder_app/core/di/dependency_injection.dart';
import 'package:pets_finder_app/core/networking/api_error_model.dart';
import 'package:pets_finder_app/core/networking/api_results.dart';
import 'package:pets_finder_app/core/networking/api_service.dart';
import 'package:pets_finder_app/features/home/data/models/pet.dart';
import 'package:pets_finder_app/features/home/data/repos/home_repo.dart';

void main(){
    setupGetIt();


  test('Test Home Repo Fetch Data From API', ()async{
    HomeRepo homeRepo = getIt<HomeRepo>();
    final response = await homeRepo.getBreeds();
    response.when(onSuccess: (data) {
     expect(response.runtimeType, ApiSuccess<List<Pet>>);
    },onError: (error){
      expect(response.runtimeType, ApiErrorModel);
    });
  });

   test('Test Api Service Fetch Data From DB', ()async{
    ApiService apiService = getIt<ApiService>();
    final response = await apiService.getPets();
    expect(response.runtimeType, List<Pet>);
  });
}