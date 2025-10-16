
import 'package:flutter/material.dart';
import 'package:pets_finder_app/features/home/data/models/pet.dart';
import 'package:pets_finder_app/features/home/presentation/widgets/pet_card.dart';

class PetListView extends StatelessWidget {

  List<Pet> pets;
  PetListView({Key? key,required this.pets}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 🐾 Example static data
    final List<Map<String, dynamic>> petsMocked = [
      {
        'image': 'assets/images/kitty-with-monochrome-wall-her 2.png',
        'name': 'Joli',
        'gender': 'Female',
        'age': '5 months old',
        'location': '1.6 km away',
        'favorite': false,
      },
      {
        'image': 'assets/images/kitty-with-monochrome-wall-her 2.png',
        'name': 'Rex',
        'gender': 'Male',
        'age': '2 years old',
        'location': '3.2 km away',
        'favorite': true,
      },
      {
        'image': 'assets/images/kitty-with-monochrome-wall-her 2.png',
        'name': 'Luna',
        'gender': 'Female',
        'age': '1 year old',
        'location': '0.8 km away',
        'favorite': false,
      },
      {
        'image': 'assets/images/kitty-with-monochrome-wall-her 2.png',
        'name': 'Snowy',
        'gender': 'Male',
        'age': '7 months old',
        'location': '2.1 km away',
        'favorite': false,
      },
      {
        'image': 'assets/images/kitty-with-monochrome-wall-her 2.png',
        'name': 'Buddy',
        'gender': 'Male',
        'age': '3 years old',
        'location': '4.5 km away',
        'favorite': true,
      },
      {
        'image': 'assets/images/kitty-with-monochrome-wall-her 2.png',
        'name': 'Kiwi',
        'gender': 'Female',
        'age': '8 months old',
        'location': '1.2 km away',
        'favorite': false,
      },
    ];

    return ListView.builder(
      padding: const EdgeInsets.only(top: 12, bottom: 24),
      itemCount: pets.length,
      itemBuilder: (context, index) {
       // final pet = petsMocked[index];
        return PetInfoCard(
          imagePath: pets[index].url ?? '',
          name: pets[index].breeds![0].name?? '',
          age: pets[index].breeds![0].lifeSpan?? '5 months',
          location: pets[index].breeds![0].origin?? '',
          isFavorite: false,
          gender:  'Female',
          onFavoriteTap: () {
          },
        );
      },
    );
  }
}
