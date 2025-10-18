import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pets_finder_app/core/helpers/spacing.dart';
import 'package:pets_finder_app/core/themes/styles/styles.dart';
import 'package:pets_finder_app/core/widgets/custom_buttom_navigation.dart';
import 'package:pets_finder_app/features/home/cubit/home_cubit.dart';
import 'package:pets_finder_app/features/home/presentation/widgets/custom_search_field.dart';
import 'package:pets_finder_app/features/home/presentation/widgets/pets_bloc_builder.dart';
import 'package:pets_finder_app/features/home/presentation/widgets/tabs_list.dart';

class HomeScreen extends StatefulWidget {

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

   TextEditingController searchTextField = TextEditingController();

   @override
  void initState() {
    super.initState();
    searchTextField.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    searchTextField.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    String keyword = searchTextField.text.toLowerCase();
      context.read<HomeCubit>().filterBreeds(keyword);
  }


  @override
  Widget build(BuildContext context) {
    return 
       Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            verticalPadding(20),

            SearchField(
              controller: searchTextField,
            ),

            verticalPadding(20),

            Text('Categories', style: TextStyles.font20BlackBold),

            verticalPadding(20),

            SizedBox(height: 40, child: TabsList()),

            verticalPadding(20),

            PetsBlocBuilder()
            
          ],
        ),
      );
  }
}
