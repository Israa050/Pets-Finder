
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pets_finder_app/core/widgets/custom_buttom_navigation.dart';
import 'package:pets_finder_app/features/home/cubit/home_cubit.dart';
import 'package:pets_finder_app/features/home/domain/repos/home_repo_interface.dart';

class HomeApp extends StatelessWidget {
  final HomeRepoInterface repo;
  const HomeApp({required this.repo, super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<HomeRepoInterface>.value(
      value: repo,
      child: BlocProvider(
        create: (_) => HomeCubit(homeRepo: repo)..getBreeds()..fetchFavorites(),
        child: MaterialApp(home: CustomButtomNavigation()),
      ),
    );
  }
}
