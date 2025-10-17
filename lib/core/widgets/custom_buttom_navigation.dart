
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pets_finder_app/core/helpers/extensions.dart';
import 'package:pets_finder_app/core/routing/routes.dart';

class CustomButtomNavigation extends StatelessWidget {
  const CustomButtomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
  height: 80,
  width: double.infinity,
  decoration: const BoxDecoration(
    color: Colors.white,
    boxShadow: [
      BoxShadow(
        color: Color(0x0D000000), // #0000000D
        blurRadius: 4,
        spreadRadius: 0,
        offset: Offset(0, -4), // upward shadow
      ),
    ],
  ),
  child: Padding(
    padding: const EdgeInsets.fromLTRB(40,23,40,23,),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
    
        GestureDetector(onTap: () => context.pushReplacementNamed(Routes.homeScreen), child: SvgPicture.asset('assets/svgs/home.svg')),
        GestureDetector(onTap: () => context.pushReplacementNamed(Routes.favorite), child: SvgPicture.asset('assets/svgs/heart.svg')),
        SvgPicture.asset('assets/svgs/messages.svg'),
        SvgPicture.asset('assets/svgs/profile-circle.svg'),
      ],
    ),
  ),
);
  }
}