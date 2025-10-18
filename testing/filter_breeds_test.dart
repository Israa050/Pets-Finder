
import 'package:flutter_test/flutter_test.dart';
import 'package:pets_finder_app/core/helpers/extensions.dart';
import 'package:pets_finder_app/features/home/data/models/pet.dart';

void main(){

  test('Filter Breeds By keyword', (){

    List<Breeds> breeds = [
      Breeds(
        id: 'beng',
      ),
       Breeds(
        id: 'beng',
      ), Breeds(
        id: 'beng',
      ), Breeds(
        id: 'cspa',
      ), Breeds(
        id: 'caspa',
      ), Breeds(
        id: 'citf',
      ), Breeds(
        id: 'char',
      ), Breeds(
        id: 'char',
      ), Breeds(
        id: 'char',
      ),
    ];
    
    expect(breeds.filter('char').length, 3 );
  });


}