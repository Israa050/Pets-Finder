
import 'package:flutter/material.dart';

class EmptyFilterdBreeds extends StatelessWidget {
  const EmptyFilterdBreeds({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/not_found.png',
              width: 180,
              height: 180,
            ),
            const SizedBox(height: 16),
            const Text(
              'No pets found 🐾',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      );
  }
}