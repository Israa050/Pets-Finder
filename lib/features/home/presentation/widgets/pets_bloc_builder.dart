import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pets_finder_app/features/home/cubit/home_cubit.dart';
import 'package:pets_finder_app/features/home/presentation/widgets/empty_filterd_breeds.dart';
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
    getBreeds();
  }

  void getBreeds() {
    context.read<HomeCubit>().getBreeds();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) {
        if (current is BreedsSate ||
            current is Faliure ||
            current is FilteredBreeds ||
            current is EmptyFilteredBreedsState) {
          return true;
        } else {
          return false;
        }
      },
      builder: (context, state) {
        switch (state) {
          case Loading():
          case HomeInitial():
            return Expanded(child: Center(child: CircularProgressIndicator()));

          case Succuss():
          case Favorites():
          case FavoriteImage():
            return Expanded(child: SizedBox());

          case Faliure():
            return Expanded(child: Center(child: Text(state.error.errors[0])));

          case BreedsSate():
            return Expanded(child: PetListView(breeds: state.breeds));

          case FilteredBreeds():
            return Expanded(child: PetListView(breeds: state.breeds));

          case EmptyFilteredBreedsState():
            return EmptyFilterdBreeds(
              key: const Key('no_results_widget'), // ✅ Add this
            );
        }
      },
    );
  }
}
