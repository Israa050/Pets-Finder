

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pets_finder_app/features/home/cubit/home_cubit.dart';
import 'package:pets_finder_app/features/home/presentation/widgets/pets_list.dart';

class PetsBlocBuilder extends StatefulWidget {
  const PetsBlocBuilder({super.key});

  @override
  State<PetsBlocBuilder> createState() => _PetsBlocBuilderState();
}

class _PetsBlocBuilderState extends State<PetsBlocBuilder> {


  @override
  void initState() {
    super.initState();
    getPets();
  }

  void getPets(){
    //context.read<HomeCubit>().favorites();
    context.read<HomeCubit>().getImages();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit,HomeState>(
      builder: (context,state){

        switch(state){
          case Loading():
          case HomeInitial():
          return Expanded(child: Center(child: CircularProgressIndicator(),));

          case Succuss():
          return Expanded(child: PetListView(pets: state.pets,));
          //return SizedBox.expand();

          case Faliure():
          return Expanded(
            child: Center(
              child: Text(state.error.errors[0]),
            ),
          );

          case FavoriteImae():
          return Center(
            child: Text('Added to favorite list ${state.message}'),
          );

          case Favorites():
          //return Expanded(child: PetListView(pets: state.favorites));
          return SizedBox.expand();

        }

    });
  }
}