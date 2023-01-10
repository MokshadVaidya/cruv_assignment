import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seat_finder_cruv/feature/SeatFinder/presentation/pages/seatFinderPage.dart';

class AppTitle extends StatelessWidget {
  const AppTitle({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final MyHomePage widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 25.0.h,left: 16.w),
      child: Text(
        widget.title,
        style: TextStyle(
          color: Colors.lightBlueAccent,
          fontSize: 30.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}