import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seat_finder_cruv/core/utils/constants.dart';
import 'package:seat_finder_cruv/feature/SeatFinder/presentation/cubit/seat_finder_cubit.dart';
import 'package:seat_finder_cruv/feature/SeatFinder/presentation/widgets/appTitle.dart';
import 'package:seat_finder_cruv/feature/SeatFinder/presentation/widgets/compartment.dart';
import 'package:seat_finder_cruv/feature/SeatFinder/presentation/widgets/searchButton.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _seatController = TextEditingController();
  final ValueNotifier<int> number = ValueNotifier(0);

  List<Widget> getCompartments(int numberOfCompartments) {
    List<Widget> compartments = [];
    for (int i = 0; i < numberOfCompartments; i++) {
      late int selectedCompartment;
      late int previousSelectedCompartment;
      var wid = BlocConsumer<SeatFinderCubit, SeatFinderState>(
        listener: (context, state) {
          if (state is SeatsSelected) {
            selectedCompartment =
                BlocProvider.of<SeatFinderCubit>(context).compartmentNumber;
            previousSelectedCompartment = BlocProvider.of<SeatFinderCubit>(context).previousCompartmentNumber;
          }
        },
        buildWhen: (previousState, state) {
          return ((state is SeatsSelected) && ((i == selectedCompartment)||i==previousSelectedCompartment));
        },
        builder: (context, state) {
          return Compartment(compartmentNumber: i);
        },
      );
      compartments.add(wid);
    }
    return compartments;
  }

  @override
  Widget build(BuildContext context) {
    var seatFinderCubit = BlocProvider.of<SeatFinderCubit>(context);
    int maxSeats = seatFinderCubit.maxSeats;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTitle(widget: widget),
            Container(
              margin: EdgeInsets.all(16.sp),
              padding: EdgeInsets.symmetric(vertical: 5.h),
              height: 50.h,
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: CupertinoTextFormFieldRow(
                      controller: _seatController,
                      padding: EdgeInsets.zero,
                      placeholder: "Enter Seat Number",
                      decoration: BoxDecoration(
                          border: Border.all(width: 2.w,color: textFieldBorderColor),
                          borderRadius: BorderRadius.circular(textFieldBorderRadius.r)),
                      onChanged: (value) {
                        if (value.isEmpty) {
                          number.value = 0;
                        } else {
                          number.value = int.parse(value);
                        }
                      },
                      keyboardType: const TextInputType.numberWithOptions(),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value!.isEmpty ||
                            int.parse(value) > maxSeats ||
                            int.parse(value) < 1) {
                          if (value.isEmpty) {
                          } else {
                            return 'Error';
                          }
                        }
                      },
                    ),
                  ),
                  Expanded(
                      child: ValueListenableBuilder<int>(
                          valueListenable: number,
                          builder: (context, val, child) {
                            return SearchButton(val: val);
                          })),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(top: 10.h),
                  child: Column(
                    children: getCompartments(seatFinderCubit.maxSeats ~/ 8),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


