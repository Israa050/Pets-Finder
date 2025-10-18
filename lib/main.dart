import 'package:flutter/material.dart';
import 'package:pets_finder_app/core/di/dependency_injection.dart';
import 'package:pets_finder_app/core/routing/app_router.dart';
import 'package:pets_finder_app/core/routing/routes.dart';
import 'package:pets_finder_app/core/themes/colors/app_colors.dart';

void main()  {
  WidgetsFlutterBinding.ensureInitialized();

  setupGetIt();
  runApp(MyApp(appRouter: AppRouter(),));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;

  const MyApp({super.key,required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pets Finder App',
      theme: ThemeData(primaryColor: AppColors.primaryGreen),
      initialRoute: Routes.onBoardingScreen,
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}
