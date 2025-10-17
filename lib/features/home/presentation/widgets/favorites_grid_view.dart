import 'package:flutter/material.dart';
import 'package:pets_finder_app/features/home/presentation/widgets/pet_favorite_card.dart';

class FavoritesGridView extends StatelessWidget {
  const FavoritesGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 6,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Two columns
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
      ),
      itemBuilder: (context, index) {
        return const PetFavoriteCard();
      },
    );
  }
}
