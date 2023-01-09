import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seat_finder_cruv/feature/SeatFinder/presentation/cubit/seat_finder_cubit.dart';
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
  int val = 0;
  List<Widget> getCompartments(int numberOfCompartments) {

    List<Widget> compartments = [];
    for (int i = 0; i < numberOfCompartments; i++) {
      var wid = Compartment(compartmentNumber: i);
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
          children: [
            Container(child: Text(widget.title),),
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
                      decoration: BoxDecoration(border: Border.all(),borderRadius: BorderRadius.circular(8)),
                      onChanged: (value){
                        val  = int.parse(value);
                        setState(() {});
                      },
                      keyboardType: const TextInputType.numberWithOptions(),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value!.isEmpty ||
                            int.parse(value) > maxSeats ||
                            int.parse(value) < 1) {
                          if(value.isEmpty){
                          }
                          else{
                            return 'Please enter a value between 1 and 72';
                          }
                        }
                        return null;
                      },
                    ),
                  ),
                  Expanded(
                      child: GestureDetector(
                          onTap: val!=0 ?() {
                            BlocProvider.of<SeatFinderCubit>(context)
                                .selectSeats(val);
                            FocusManager.instance.primaryFocus?.unfocus();
                          }:(){},
                          child: SearchButton(val: val)))
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
            ),
          ],
        ),
      ),
    );
  }
}


