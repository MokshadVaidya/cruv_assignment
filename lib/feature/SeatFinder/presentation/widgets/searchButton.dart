import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seat_finder_cruv/core/utils/constants.dart';
import 'package:seat_finder_cruv/feature/SeatFinder/presentation/cubit/seat_finder_cubit.dart';
class SearchButton extends StatelessWidget {
  const SearchButton({
    Key? key,
    required this.val,
  }) : super(key: key);

  final int val;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: val != 0
        ? () {
      BlocProvider.of<SeatFinderCubit>(
          context)
          .selectSeats(val);
      FocusManager.instance.primaryFocus
          ?.unfocus();
    }
        : () {},
      child: Container(
        margin: EdgeInsets.only(left: 2.w),
        decoration: BoxDecoration(
          color: val!=0?searchActiveColor:searchNonactiveColor,
          borderRadius: BorderRadius.circular(textFieldBorderRadius.r)
        ),
        child: const Center(
          child: Text("Find"),
        ),
      ),
    );
  }
}