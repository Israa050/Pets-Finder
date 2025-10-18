
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pets_finder_app/core/helpers/extensions.dart';
import 'package:pets_finder_app/core/helpers/spacing.dart';
import 'package:pets_finder_app/core/routing/routes.dart';
import 'package:pets_finder_app/core/themes/colors/app_colors.dart';
import 'package:pets_finder_app/core/themes/styles/styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pushReplacementNamed(Routes.homeScreen),
      child: Container(
        height: 54,
        width: 297,
        decoration: BoxDecoration(
          color: AppColors.primaryGreen,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
      
      
            SvgPicture.asset('assets/svgs/ic_outline-pets.svg'),
      
            horizontalPadding(12),
      
            Text('Get Started', style: TextStyles.font18WhiteMedium,),
      
      
          ],
        ),
      ),
    );
  }
}