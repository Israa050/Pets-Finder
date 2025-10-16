import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pets_finder_app/core/helpers/spacing.dart';
import 'package:pets_finder_app/core/themes/styles/styles.dart';
import 'package:pets_finder_app/core/widgets/custom_buttom_navigation.dart';
import 'package:pets_finder_app/features/home/presentation/widgets/custom_search_field.dart';
import 'package:pets_finder_app/features/home/presentation/widgets/pets_bloc_builder.dart';
import 'package:pets_finder_app/features/home/presentation/widgets/pets_list.dart';
import 'package:pets_finder_app/features/home/presentation/widgets/tabs_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Find Your Forever Pet', style: TextStyles.font24BlackBold),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: SvgPicture.asset('assets/svgs/notification.svg'),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            verticalPadding(20),

            SearchField(),

            verticalPadding(20),

            Text('Categories', style: TextStyles.font20BlackBold),

            verticalPadding(20),

            SizedBox(height: 40, child: TabsList()),

            verticalPadding(20),

            PetsBlocBuilder()
            
          ],
        ),
      ),
      bottomNavigationBar: CustomButtomNavigation(),
    );
  }
}
