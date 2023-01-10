import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seat_finder_cruv/core/utils/constants.dart';

class SeatBack extends StatelessWidget {
  SeatBack({Key? key, required this.side}) : super(key: key);
  Side side;
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Container(
        decoration: BoxDecoration(
            color: backSeatColor,
            borderRadius: side == Side.up
                ? BorderRadius.only(
                    topLeft: Radius.circular(backSeatRadius.r),
                    topRight: Radius.circular(backSeatRadius.r))
                : BorderRadius.only(
                    bottomLeft: Radius.circular(backSeatRadius.r),
                    bottomRight: Radius.circular(backSeatRadius.r))),
        width: 162.w,
        height: 35.h,
      ),
      Spacer(),
      Container(
        decoration: BoxDecoration(
            color: backSeatColor,
            borderRadius: side == Side.up
                ? BorderRadius.only(
                topLeft: Radius.circular(backSeatRadius.r),
                topRight: Radius.circular(backSeatRadius.r))
                : BorderRadius.only(
                bottomLeft: Radius.circular(backSeatRadius.r),
                bottomRight: Radius.circular(backSeatRadius.r))),
        width: 56.w,
        height: 35.h,
      )
    ]);
  }
}
