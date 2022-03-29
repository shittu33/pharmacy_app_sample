part of 'medicine_list_bloc.dart';

@immutable
abstract class MedicineEvent extends Equatable {
  const MedicineEvent();
}

class MedicineStarted extends MedicineEvent {
  @override
  List<Object> get props => [];
}

// class CartItemAdded extends CartEvent {
//   const CartItemAdded(this.item);
//
//   final Item item;
//
//   @override
//   List<Object> get props => [item];
// }
//
// class CartItemRemoved extends CartEvent {
//   const CartItemRemoved(this.item);
//
//   final Item item;
//
//   @override
//   List<Object> get props => [item];
// }
