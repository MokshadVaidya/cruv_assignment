import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seat_finder_cruv/core/utils/constants.dart';
import 'package:seat_finder_cruv/feature/SeatFinder/presentation/widgets/backSeat.dart';
import 'package:seat_finder_cruv/feature/SeatFinder/presentation/widgets/compartmentRow.dart';

class Compartment extends StatelessWidget {
  const Compartment({Key? key, required this.compartmentNumber})
      : super(key: key);
  final int compartmentNumber;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding: EdgeInsets.symmetric(vertical: 2.h,horizontal: 2.w),
      color: compartmentNumber % 2 != 0
          ? oddCompartmentColor
          : evenCompartmentColor,
      height: 150.h,
      child: Column(
        children: [
          Stack(children: [
            SeatBack(side: Side.up),
            CompartmentRow(
              startNumber: (compartmentNumber * 8) + 1,
              compartmentNumber: compartmentNumber,
              side: Side.up,
            ),
          ]),
          const Spacer(),
          Stack(alignment: Alignment.bottomLeft, children: [
            SeatBack(side: Side.down),
            CompartmentRow(
              startNumber: (compartmentNumber * 8) + 4,
              compartmentNumber: compartmentNumber,
              side: Side.down,
            ),
          ])
        ],
      ),
    );
  }
}
