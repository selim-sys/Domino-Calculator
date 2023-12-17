import 'package:domino_calculator/view/constants/assets.dart';
import 'package:domino_calculator/view/constants/colors.dart';
import 'package:domino_calculator/view/views/widgets/customTextFormField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

String player1Name = '', player2Name = '';
int c1 = 0, c2 = 0;
var p1Controller = TextEditingController();
var p2Controller = TextEditingController();
var c1Controller = TextEditingController();
var c2Controller = TextEditingController();

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Image.asset(
          AppAssets.logo,
          color: AppColors.whiteColor,
          width: 75.w,
        ),
        centerTitle: true,
      ),
      backgroundColor: AppColors.mainColor,
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 24.0.w, vertical: 120.h),
        child: ListView(
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 150.w,
                      child: CustomTextFormField(
                          onFieldSubmitted: (p1) {
                            setState(() {
                              player1Name = p1;
                              p1Controller.clear();
                              c1 = 0;
                              c2 = 0;
                            });
                          },
                          textEditingController: p1Controller,
                          label: 'Player 1 Name',
                          isPassword: false,
                          textInputType: TextInputType.name),
                    ),
                    Container(
                      width: 150.w,
                      child: CustomTextFormField(
                          onFieldSubmitted: (p2) {
                            setState(() {
                              player2Name = p2;
                              p2Controller.clear();
                              c1 = 0;
                              c2 = 0;
                            });
                          },
                          textEditingController: p2Controller,
                          label: 'Player 2 Name',
                          isPassword: false,
                          textInputType: TextInputType.name),
                    ),
                  ],
                ),
                SizedBox(height: 16.h,),
                IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding:  EdgeInsets.symmetric(vertical: 40.h),
                        child: Column(
                          children: [
                            Text(
                              player1Name,
                              style: GoogleFonts.pressStart2p(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 25.sp,
                                  color: Color(0XFFEFBC9B)),
                            ),
                            SizedBox(
                              height: 24.h,
                            ),
                            Text(
                              c1.toString(),
                              style: GoogleFonts.specialElite(
                                  textStyle:
                                      Theme.of(context).textTheme.displayLarge,
                                  fontSize: 80.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0XFFEFBC9B)),
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            Container(
                              width: 65.w,
                              height: 40.h,
                              child: TextField(
                                onSubmitted: (pts) {
                                  setState(() {
                                    c1 += int.parse(pts);
                                    c1Controller.clear();
                                    if (c1 >= 100) {
                                      showDialog<void>(
                                        context: context,
                                        barrierDismissible: false,
                                        // false = user must tap button, true = tap outside dialog
                                        builder: (BuildContext dialogContext) {
                                          return AlertDialog(
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(30.r),
                                            ),
                                            contentTextStyle: GoogleFonts.pressStart2p(
                                                color: AppColors.mainColor
                                            ),
                                            titleTextStyle: GoogleFonts.pressStart2p(
                                                color: AppColors.mainColor
                                            ),
                                            backgroundColor: AppColors.whiteColor,
                                            title: Text('Winner!'),
                                            content: Text('$player1Name Wins!'),
                                            actions: <Widget>[
                                              TextButton(
                                                child: Text('Play Again!',style: GoogleFonts.pressStart2p(

                                                ),),
                                                onPressed: () {
                                                  Navigator.of(dialogContext)
                                                      .pop();
                                                  setState(() {});
                                                  c1 = 0;
                                                  c2 = 0; // Dismiss alert dialog
                                                },
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                      ();
                                    }
                                  });
                                },
                                controller: c1Controller,
                                style: TextStyle(color: Color(0XFFEFBC9B)),
                                maxLines: 1,
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Color(0XFFEFBC9B)),
                                      borderRadius: BorderRadius.circular(8.r),
                                    ),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0XFFEFBC9B)),
                                        borderRadius: BorderRadius.circular(8.r)),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Color(0XFFEFBC9B)),
                                      borderRadius: BorderRadius.circular(8.r),
                                    ),
                                    contentPadding: EdgeInsets.all(8.w),
                                    label: Text(
                                      'Points',
                                      style: GoogleFonts.specialElite(
                                          color: Color(0XFFEFBC9B),
                                          fontSize: 14.sp),
                                    )),
                              ),
                            ),
                          ],
                        ),
                      ),
                      VerticalDivider(
                        thickness: 3,
                        color: AppColors.whiteColor.withOpacity(0.7),
                        endIndent: 35,
                        indent: 50,
                      ),
                      Padding(
                        padding:  EdgeInsets.symmetric(vertical: 40.h),
                        child: Column(
                          children: [
                            Text(
                              player2Name,
                              style: GoogleFonts.pressStart2p(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 25.sp,
                                  color: Colors.white.withOpacity(0.9)),
                            ),
                            SizedBox(
                              height: 24.h,
                            ),
                            Text(
                              c2.toString(),
                              style: GoogleFonts.specialElite(
                                  textStyle:
                                      Theme.of(context).textTheme.displayLarge,
                                  fontSize: 80.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white.withOpacity(0.9)),
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            Container(
                              width: 65.w,
                              height: 40.h,
                              child: TextField(
                                onSubmitted: (pts) {
                                  setState(() {
                                    c2 += int.parse(pts);
                                    c2Controller.clear();
                                    if (c2 >= 100) {
                                      showDialog<void>(
                                        context: context,
                                        barrierDismissible: false,
                                        // false = user must tap button, true = tap outside dialog
                                        builder: (BuildContext dialogContext) {
                                          return AlertDialog(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.r),
                                            ),
                                            contentTextStyle:
                                                GoogleFonts.pressStart2p(
                                                    color: AppColors.mainColor),
                                            titleTextStyle:
                                                GoogleFonts.pressStart2p(
                                                    color: AppColors.mainColor),
                                            backgroundColor:
                                                AppColors.whiteColor,
                                            title: Text('Winner!'),
                                            content: Text('$player2Name Wins!'),
                                            actions: <Widget>[
                                              TextButton(
                                                child: Text('Play Again!',style: GoogleFonts.pressStart2p(),),
                                                onPressed: () {
                                                  Navigator.of(dialogContext)
                                                      .pop();
                                                  setState(() {});
                                                  c1 = 0;
                                                  c2 =
                                                      0; // Dismiss alert dialog
                                                },
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                      ();
                                    }
                                  });
                                },
                                controller: c2Controller,
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.9)),
                                maxLines: 1,
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: AppColors.whiteColor),
                                      borderRadius: BorderRadius.circular(8.r),
                                    ),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: AppColors.whiteColor),
                                        borderRadius: BorderRadius.circular(8.r)),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: AppColors.whiteColor),
                                      borderRadius: BorderRadius.circular(8.r),
                                    ),
                                    contentPadding: EdgeInsets.all(8.w),
                                    label: Text(
                                      'Points',
                                      style: GoogleFonts.specialElite(
                                          color: Colors.white, fontSize: 14.sp),
                                    )),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30.r),
                  bottomRight: Radius.circular(30.r),
                ))),
                onPressed: () {
                  setState(() {
                    c1 = 0;
                    c2 = 0;
                  });
                },
                child: Text('Play Again!',
                    style: GoogleFonts.pressStart2p(
                      fontWeight: FontWeight.w700,
                      fontSize: 20.sp,
                      color: Colors.white.withOpacity(0.9),
                    )))
          ],
        ),
      ),
    );
  }
}
