

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/themes/colors/app_colors.dart';
import '../../../../core/themes/styles/styles.dart';

class TabContainer extends StatelessWidget {

  String? text;
  double? height;
  double? width;
  final bool isSelected;
  final Function() onTap;

  TabContainer({super.key,required this.isSelected,required this.onTap,this.text,this.height,this.width});


  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(50),
      child: InkWell(
        borderRadius: BorderRadius.circular(50),
        onTap:onTap,
       splashColor: Colors.white.withValues(alpha:  0.2),
        child: AnimatedContainer(
          duration: Duration(seconds: 3),
          curve:Curves.easeIn,
          child: Ink(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            height: height?? 30,
            decoration: BoxDecoration(
              color: isSelected? AppColors.primaryGreen : AppColors.lightGreen,
              borderRadius: BorderRadius.circular(50),  
            ),
            child: Center(
              child: AnimatedDefaultTextStyle(
                  duration: const Duration(milliseconds: 500),
                curve: Curves.easeIn,
                style:isSelected? TextStyles.font14WhiteSemiBold: TextStyles.font14WhiteSemiBold.copyWith(color: AppColors.primaryGreen,),
                child: Text(
                  text ??'All',
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}