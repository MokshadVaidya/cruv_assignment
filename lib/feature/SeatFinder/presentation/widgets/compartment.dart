import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seat_finder_cruv/core/utils/constants.dart';
import 'package:seat_finder_cruv/feature/SeatFinder/presentation/cubit/seat_finder_cubit.dart';
import 'package:seat_finder_cruv/feature/SeatFinder/presentation/cubit/seat_finder_cubit.dart';
import 'package:seat_finder_cruv/feature/SeatFinder/presentation/widgets/compartmentRow.dart';

class Compartment extends StatelessWidget {
  const Compartment({Key? key, required this.compartmentNumber})
      : super(key: key);
  final int compartmentNumber;

  @override
  Widget build(BuildContext context) {
    late int selectedCompartment;
    return BlocConsumer<SeatFinderCubit, SeatFinderState>(
      listener: (context, state) {
        if(state is SeatsSelected){
        selectedCompartment = BlocProvider.of<SeatFinderCubit>(context).seatNumber;}
      },
      buildWhen: (previousState, state) {
        return ((state is SeatsSelected) && (compartmentNumber==selectedCompartment));
      },
      builder: (context, state) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 16.w),
          padding: EdgeInsets.all(5),
          color: compartmentNumber % 2 != 0
              ? oddCompartmentColor
              : evenCompartmentColor,
          height: 150.h,
          child: Column(
            children: [
              CompartmentRow(
                startNumber: (compartmentNumber * 8) + 1,
                compartmentNumber: compartmentNumber,
                side: Side.up,
              ),
              Spacer(),
              CompartmentRow(
                startNumber: (compartmentNumber * 8) + 4,
                compartmentNumber: compartmentNumber,
                side: Side.down,
              )
            ],
          ),
        );
      },
    );
  }
}