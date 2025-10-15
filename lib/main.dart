import 'package:flutter/material.dart';
import 'package:pets_finder_app/core/themes/colors/app_colors.dart';
import 'package:pets_finder_app/features/home/presentation/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pets Finder App',
      theme: ThemeData(
        primaryColor: AppColors.primaryGreen,
      ),
      home: HomeScreen(),
    );
  }
}
