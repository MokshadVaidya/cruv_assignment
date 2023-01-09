import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
part 'seat_finder_state.dart';

class SeatFinderCubit extends Cubit<SeatFinderState> {
  final int maxSeats = 72;
  int compartmentNumber = -1;
  int seatNumber = -1;
  SeatFinderCubit() : super(SeatFinderInitial());

  void selectSeats(int seatNumber){
    compartmentNumber = seatNumber%8;
    this.seatNumber = seatNumber;
    emit(SeatsSelected());
  }
}
