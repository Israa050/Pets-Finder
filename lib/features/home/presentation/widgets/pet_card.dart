import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pets_finder_app/core/helpers/spacing.dart';
import 'package:pets_finder_app/core/themes/colors/app_colors.dart';
import 'package:pets_finder_app/core/themes/styles/styles.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:pets_finder_app/features/home/data/models/pet.dart';

class PetInfoCard extends StatelessWidget {
  final String imagePath;
  final String name;
  final String gender;
  final String age;
  final String location;
  bool isFavorite = false;
  final VoidCallback? onFavoriteTap;

  final Breeds breeds;

   PetInfoCard({
    Key? key,
    required this.breeds,
    required this.imagePath,
    required this.name,
    required this.gender,
    required this.age,
    required this.location,
    this.isFavorite = false,
    this.onFavoriteTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 124,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Color(0x1A000000), // #0000001A
            blurRadius: 4,
            spreadRadius: 0.5,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          /// 🐶 Image section
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 6, bottom: 6),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                imageUrl: imagePath,
                width: 100,
                height: double.infinity,
                fit: BoxFit.cover,
                placeholder: (context, error) {
                  return Center(
                    child: Icon(Icons.image, color: AppColors.lightGrey),
                  );
                },
                errorWidget: (context, url, error) {
                  return Center(
                    child: Icon(Icons.error_rounded, color: AppColors.red),
                  );
                },
              ),
            ),
          ),

          /// 📝 Text + Favorite section
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 12,
                top: 8,
                bottom: 8,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Top Row: name + favorite icon
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(name, style: TextStyles.font18BlackBold),
                      GestureDetector(
                        onTap: onFavoriteTap,
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 300),
                          transitionBuilder: (child, anim) =>
                              ScaleTransition(scale: anim, child: child),
                          child: Icon(
                            isFavorite ? Icons.favorite : Icons.favorite_border,
                            key: ValueKey(
                              isFavorite,
                            ),
                            color: isFavorite ? Colors.red : Colors.grey,
                            size: 30,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),

                  Text(gender, style: TextStyles.font14DarkGreyRegular),
                  const SizedBox(height: 2),

                  Text(age, style: TextStyles.font14DarkGreyRegular),
                  const SizedBox(height: 2),

                  Row(
                    children: [
                      SvgPicture.asset('assets/svgs/location.svg'),
                      horizontalPadding(2),
                      Text(location, style: TextStyles.font14DarkGreyRegular),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
