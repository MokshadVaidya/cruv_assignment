import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seat_finder_cruv/feature/SeatFinder/presentation/cubit/seat_finder_cubit.dart';
import 'package:seat_finder_cruv/feature/SeatFinder/presentation/pages/seatFinderPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(390, 844),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (ctx, _) => MaterialApp(
              debugShowCheckedModeBanner: false,
              home: BlocProvider(
                create: (context) => SeatFinderCubit(),
                child: BlocBuilder<SeatFinderCubit, SeatFinderState>(
                  builder: (ctx, state) {
                    return MyHomePage(title: "Seat Finder");
                  },
                ),
              ),
            ));
  }
}
