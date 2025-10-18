
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pets_finder_app/features/home/cubit/home_cubit.dart';
import 'package:pets_finder_app/features/home/data/models/pet.dart';
import 'package:pets_finder_app/features/home/presentation/widgets/pet_card.dart';

class PetListView extends StatefulWidget {

  List<Breeds> breeds;
  PetListView({super.key,required this.breeds});

  @override
  State<PetListView> createState() => _PetListViewState();
}

class _PetListViewState extends State<PetListView> {

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(top: 12, bottom: 24),
      itemCount: widget.breeds.length,
      itemBuilder: (context, index) {
        return PetInfoCard(
          breeds: widget.breeds[index],
          imagePath: widget.breeds[index].image?.url ?? '',
          name: widget.breeds[index].name ??  'Snowy',
          age: widget.breeds[index].lifeSpan?? '5 months',
          location: widget.breeds[index].origin?? 'US',
          gender:  'Female',
          isFavorite: widget.breeds[index].isFavorite,
          onFavoriteTap: () async{

            setState((){
           widget.breeds[index].isFavorite = !widget.breeds[index].isFavorite;

            });

            if(widget.breeds[index].isFavorite){
              widget.breeds[index].favoriteId = await context.read<HomeCubit>().favoriteImage(widget.breeds[index].image?.id);
              print('ID: ${widget.breeds[index].favoriteId}');
            }else{
                context.read<HomeCubit>().removeImageFromFavorite(widget.breeds[index].favoriteId);
                widget.breeds[index].favoriteId = -1;
            }
          },
          
        );
      },
    );
  }
}
