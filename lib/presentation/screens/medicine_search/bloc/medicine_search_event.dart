part of 'medicine_search_bloc.dart';

@immutable
abstract class MedicineSearchEvent extends Equatable {
  const MedicineSearchEvent();
}

class MedicineSearchStarted extends MedicineSearchEvent {
  @override
  List<Object> get props => [];
}

class MedicineSearch extends MedicineSearchEvent {
  const MedicineSearch(this.query);

  final String query;

  @override
  List<Object> get props => [query];
}
