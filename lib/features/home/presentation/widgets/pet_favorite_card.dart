
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pets_finder_app/core/helpers/spacing.dart';

class PetFavoriteCard extends StatefulWidget {
  const PetFavoriteCard({Key? key}) : super(key: key);

  @override
  State<PetFavoriteCard> createState() => _PetFavoriteCardState();
}

class _PetFavoriteCardState extends State<PetFavoriteCard> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 212,
      width: 162,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: Color(0x1A000000), // #0000001A
            blurRadius: 4,
            spreadRadius: 0.5,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(6, 7, 5, 9),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// 🐾 Image section
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                'assets/images/kitty-with-monochrome-wall-her 2.png',
                height: 140,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8),

            /// 📝 Name + Location + Favorite icon
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Text info on the left
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    Text(
                      'Joly',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 4),
                    Row(
                      children: [
                       SvgPicture.asset('assets/svgs/location.svg'),
                       horizontalPadding(2),
                        Text(
                          '1.6 km away',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                // ❤️ Favorite icon on the right
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isFavorite = !isFavorite;
                    });
                  },
                  child: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: isFavorite ? Colors.red : Colors.grey,
                    size: 24,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
