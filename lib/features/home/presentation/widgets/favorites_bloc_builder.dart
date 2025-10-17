
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pets_finder_app/features/home/cubit/home_cubit.dart';
import 'package:pets_finder_app/features/home/presentation/widgets/favorites_grid_view.dart';

class FavoritesBlocBuilder extends StatefulWidget {
  const FavoritesBlocBuilder({super.key});

  @override
  State<FavoritesBlocBuilder> createState() => _FavoritesBlocBuilderState();
}

class _FavoritesBlocBuilderState extends State<FavoritesBlocBuilder> {


  @override
  void initState() {
    super.initState();
    getFavorites();
  }

  void getFavorites(){
    context.read<HomeCubit>().getImages();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit,HomeState>(builder: (context,state){
      if(state is Loading || state is HomeInitial){
       return  Center(child: CircularProgressIndicator(),);
      }
      else if(state is Favorites){
        return Expanded(child: FavoritesGridView());
      }
      else{
        return Center(
          child: Text('Error'),
        );
      }
    });
  }
}