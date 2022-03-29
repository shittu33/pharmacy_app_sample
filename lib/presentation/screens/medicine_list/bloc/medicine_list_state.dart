part of 'medicine_list_bloc.dart';

// import 'package:equatable/equatable.dart';
// import 'package:pharmacy/models/medicine_item.dart';

@immutable
abstract class MedicineState extends Equatable {
  const MedicineState();
}

class MedicineLoading extends MedicineState {
  @override
  List<Object> get props => [];
}

class MedicineLoaded extends MedicineState {
  const MedicineLoaded(
      {this.medicines = const []});

  final List<MedicineItem> medicines;

  @override
  List<Object> get props => [medicines];
}

class MedicineError extends MedicineState {
  @override
  List<Object> get props => [];
}