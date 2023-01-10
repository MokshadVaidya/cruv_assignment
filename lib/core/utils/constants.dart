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
  1: "L",
  2: "M",
  3: "U",
  4: "L",
  5: "M",
  6: "U",
  7: "SL"
};