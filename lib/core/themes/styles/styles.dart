

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pets_finder_app/core/themes/colors/app_colors.dart';
import 'package:pets_finder_app/core/themes/styles/font_weight_helper.dart';

class TextStyles{

  static TextStyle base({
    required double size,
    required FontWeight fontWeight,
    required Color color,
  }) {
    return GoogleFonts.poppins(
      fontSize: size,
      fontWeight: fontWeight,
      color: color,
    );
  }


   static TextStyle font24BlackBold =
    base(size: 24, fontWeight: FontWeightHelper.bold, color: Colors.black);

  static TextStyle font16GreyRegular =
    base(size: 16, fontWeight: FontWeightHelper.regular, color: AppColors.lightGrey);

  static TextStyle font20BlackBold =
    base(size: 20, fontWeight: FontWeightHelper.bold, color: Colors.black);


  static TextStyle font14WhiteSemiBold =
    base(size: 14, fontWeight: FontWeightHelper.semiBold, color: Colors.white);

    static TextStyle font18BlackBold =
    base(size: 18, fontWeight: FontWeightHelper.bold, color: Colors.black);

      static TextStyle font14DarkGreyRegular =
    base(size: 14, fontWeight: FontWeightHelper.regular, color: AppColors.darkGrey);

       static TextStyle font32BlackBold =
    base(size: 32, fontWeight: FontWeightHelper.bold, color: Colors.black);

      static TextStyle font18WhiteMedium =
    base(size: 18, fontWeight: FontWeightHelper.medium, color: Colors.white);







}