import 'package:flutter/material.dart';


const Color oddCompartmentColor = Colors.white;
const Color evenCompartmentColor = Colors.white;
const Color selectedSeatColor = Colors.green;
const Color notSelectedSeatColor = Colors.lightBlueAccent;
const Color backSeatColor = Colors.black;
const Color textFieldBorderColor = Colors.lightBlueAccent;
const Color searchActiveColor = Colors.lightBlueAccent;
const Color searchNonactiveColor = Colors.grey;
const double textFieldBorderRadius = 8;
const double backSeatRadius = 5;
enum Side{
  up,
  down
}

Map<int,String> birthType= {
  0: "SU",
  1: "Lower",
  2: "Middle",
  3: "Upper",
  4: "Lower",
  5: "Middle",
  6: "Upper",
  7: "SL"
};