import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pets_finder_app/features/home/cubit/home_cubit.dart';
import 'package:pets_finder_app/features/home/data/models/favorites.dart';
import 'package:pets_finder_app/features/home/presentation/widgets/pet_favorite_card.dart';

class FavoritesGridView extends StatefulWidget {

  List<Favorite> favorites;

  FavoritesGridView({super.key,required this.favorites});

  @override
  State<FavoritesGridView> createState() => _FavoritesGridViewState();
}

class _FavoritesGridViewState extends State<FavoritesGridView> {
    late List<Favorite> _favorites; // local copy

@override
  void initState() {
    super.initState();
    _favorites = List.from(widget.favorites);
  }
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: widget.favorites.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Two columns
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 162 / 212, // Based on card size
      ),
      itemBuilder: (context, index) {
        return  PetFavoriteCard(
          key: Key('favorite_list_item_${_favorites[index].id}'),
          favoriteImage: _favorites[index],
          onTap: () {
            context.read<HomeCubit>().removeImageFromFavorite(widget.favorites[index].id);
            setState(() {
              widget.favorites.removeAt(index);
            });
          },
        );
      },
    );
  }
}
