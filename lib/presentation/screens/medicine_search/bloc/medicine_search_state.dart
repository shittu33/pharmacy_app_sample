part of 'medicine_search_bloc.dart';

// import 'package:equatable/equatable.dart';
// import 'package:pharmacy/models/medicine_item.dart';

@immutable
abstract class MedicineSearchState extends Equatable {
  const MedicineSearchState();
}

class MedicineSearchLoading extends MedicineSearchState {
  @override
  List<Object> get props => [];
}

class MedicineSearchLoaded extends MedicineSearchState {
  const MedicineSearchLoaded(
      {this.medicines = const []});

  final List<MedicineItem> medicines;

  @override
  List<Object> get props => [medicines];
}

class MedicineSearchError extends MedicineSearchState {
  @override
  List<Object> get props => [];
}