import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seat_finder_cruv/core/utils/constants.dart';
import 'package:seat_finder_cruv/feature/SeatFinder/presentation/widgets/seat.dart';

class CompartmentRow extends StatelessWidget {
  const CompartmentRow(
      {Key? key, required this.startNumber, required this.compartmentNumber,required this.side})
      : super(key: key);
  final int startNumber;
  final int compartmentNumber;
  final Side side;
  List<Widget> getSeats() {
    List<Widget> seats = [];
    for (int i = 0; i < 5; i++) {
      Widget wid;
      if (i == 3) {
        wid = const Spacer();
      } else {
        if (i == 4) {
          wid = Padding(
            padding: EdgeInsets.only(right: 3.w),
            child: Seat(
              seatNo: startNumber % 2 == 0 ? startNumber + 4 : startNumber + 6,
              compartmentNumber: compartmentNumber,
              side: side,
            ),
          );
        } else {
          wid = Seat(
            seatNo: startNumber + i,
            compartmentNumber: compartmentNumber,
            side: side,
          );
        }
      }
      seats.add(wid);
    }
    return seats;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Row(
        children: getSeats(),
      ),
    );
  }
}