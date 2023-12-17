import 'package:domino_calculator/view/constants/colors.dart';
import 'package:domino_calculator/view/views/screens/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const DominoCalculator());
}

class DominoCalculator extends StatelessWidget {
  const DominoCalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.mainColor),
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
