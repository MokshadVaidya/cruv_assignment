import 'package:flutter/material.dart';
import 'package:seat_finder_cruv/feature/SeatFinder/presentation/widgets/seat.dart';

class CompartmentRow extends StatelessWidget {
  const CompartmentRow(
      {Key? key, required this.startNumber, required this.compartmentNumber})
      : super(key: key);
  final int startNumber;
  final int compartmentNumber;
  List<Widget> getSeats() {
    List<Widget> seats = [];
    for (int i = 0; i < 5; i++) {
      Widget wid;
      if (i == 3) {
        wid = Spacer();
      } else {
        if (i == 4) {
          wid = Seat(
            seatNo: startNumber % 2 == 0 ? startNumber + 4 : startNumber + 6,
            compartmentNumber: compartmentNumber,
          );
        } else {
          wid = Seat(
            seatNo: startNumber + i,
            compartmentNumber: compartmentNumber,
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
      child: Row(
        children: getSeats(),
      ),
    );
  }
}