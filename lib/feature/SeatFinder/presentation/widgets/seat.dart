import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seat_finder_cruv/core/utils/constants.dart';
import 'package:seat_finder_cruv/feature/SeatFinder/presentation/cubit/seat_finder_cubit.dart';

class Seat extends StatelessWidget {
  const Seat({Key? key, required this.seatNo, required this.compartmentNumber,required this.side})
      : super(key: key);
  final int seatNo;
  final int compartmentNumber;
  final Side side;
  @override
  Widget build(BuildContext context) {
        return Container(
          margin: EdgeInsets.only(left: 3.w),
          decoration: BoxDecoration(
            color:
            (BlocProvider.of<SeatFinderCubit>(context).seatNumber == seatNo)
                ? selectedSeatColor
                : notSelectedSeatColor,
            borderRadius: BorderRadius.circular(5.r),
          ),
          width: 50.w,
          height: 50.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: side==Side.up?[Text(seatNo.toString(),style: TextStyle(fontSize: 15.sp),), Text(birthType[seatNo % 8]!,style: TextStyle(fontSize: 15.sp))]:[Text(birthType[seatNo % 8]!,style: TextStyle(fontSize: 15.sp)),Text(seatNo.toString(),style: TextStyle(fontSize: 15.sp))],
          ),
        );
  }
}
