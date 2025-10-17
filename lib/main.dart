import 'package:flutter/material.dart';
import 'package:pets_finder_app/core/di/dependency_injection.dart';
import 'package:pets_finder_app/core/routing/app_router.dart';
import 'package:pets_finder_app/core/routing/routes.dart';
import 'package:pets_finder_app/core/themes/colors/app_colors.dart';
import 'package:pets_finder_app/features/home/presentation/screens/favorite_screen.dart';

void main()  {
  WidgetsFlutterBinding.ensureInitialized();

  setupGetIt();


  runApp(MyApp(appRouter: AppRouter(),));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;

  const MyApp({super.key,required this.appRouter});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pets Finder App',
      theme: ThemeData(primaryColor: AppColors.primaryGreen),
      //home: FavoriteScreen(),
      initialRoute: Routes.homeScreen,
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}
