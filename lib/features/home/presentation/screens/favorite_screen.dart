
import 'package:flutter/material.dart';
import 'package:pets_finder_app/core/helpers/spacing.dart';
import 'package:pets_finder_app/features/home/presentation/widgets/favorites_bloc_builder.dart';
import 'package:pets_finder_app/features/home/presentation/widgets/tabs_list.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return 
    // Scaffold(
    //   appBar: AppBar(
    //     title: Text('Find Your Forever Pet', style: TextStyles.font24BlackBold),
    //   ),
    //   body: 
      Padding(
        padding: const EdgeInsets.only(left: 16,right: 10),
        child: Column(
          children: [
        
            verticalPadding(20),
        
            SizedBox(height: 40, child: TabsList()),

            verticalPadding(22),

           FavoritesBlocBuilder(),
          ],
        ),
      );
  }
}