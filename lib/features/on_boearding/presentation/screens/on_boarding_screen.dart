import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pets_finder_app/core/helpers/spacing.dart';
import 'package:pets_finder_app/core/themes/styles/styles.dart';
import 'package:pets_finder_app/features/on_boearding/presentation/widgets/custom_button.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/background_image.png'),
        
            verticalPadding(67),
        
            Text(
              'Find Your Best \nCompanion With Us',
              style: TextStyles.font32BlackBold,
              textAlign: TextAlign.center,
            ),
        
            verticalPadding(10),
        
            Text(
              'Join & discover the best suitable pets as \nper your preferences in your location',
              style: TextStyles.font16GreyRegular,
              textAlign: TextAlign.center,
            ),
        
            verticalPadding(61),
        
            CustomButton()
          ],
        ),
      ),
    );
  }
}
