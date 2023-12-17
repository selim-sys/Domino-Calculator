import 'package:domino_calculator/view/constants/assets.dart';
import 'package:domino_calculator/view/constants/colors.dart';
import 'package:domino_calculator/view/views/screens/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double turns = 0;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        turns += 1;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedRotation(
                turns: turns,
                onEnd: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    )),
                duration: Duration(seconds: 2),
                child: Image.asset(AppAssets.logo,
                    color: Colors.white, width: 500.w)),
          ],
        ),
      ),
    );
  }
}
