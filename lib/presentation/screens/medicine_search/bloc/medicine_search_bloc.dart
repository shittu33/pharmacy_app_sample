import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy/models/models.dart';
import 'package:pharmacy/repository/medicine_repository.dart';


part 'medicine_search_event.dart';
part 'medicine_search_state.dart';

class MedicineSearchBloc extends Bloc<MedicineSearchEvent, MedicineSearchState> {
  MedicineSearchBloc({required this.medicineRepository}) : super(MedicineSearchLoading()) {
    on<MedicineSearchStarted>(_onStarted);
    on<MedicineSearch>(_onMedicineSearch);
  }

  final MedicineRepository medicineRepository;

  void _onStarted(MedicineSearchStarted event, Emitter<MedicineSearchState> emit) async {
    emit(MedicineSearchLoading());
    try {
      emit(const MedicineSearchLoaded(medicines: []));
    } catch (_) {
      emit(MedicineSearchError());
    }
  }

  void _onMedicineSearch(MedicineSearch event, Emitter<MedicineSearchState> emit) async {
    final state = this.state;
    if (state is MedicineSearchLoaded) {
      try {
        var newMedicines = await medicineRepository.searchMedicines(event.query);
        emit(MedicineSearchLoaded(medicines: newMedicines));
      } catch (_) {
        emit(MedicineSearchError());
      }
    }
  }

  // void _onItemAdded(CartItemAdded event, Emitter<CartState> emit) async {
  //   final state = this.state;
  //   if (state is CartLoaded) {
  //     try {
  //       shoppingRepository.addItemToCart(event.item);
  //       emit(CartLoaded(cart: Cart(items: [...state.cart.items, event.item])));
  //     } catch (_) {
  //       emit(CartError());
  //     }
  //   }
  // }
  //
  // void _onItemRemoved(CartItemRemoved event, Emitter<CartState> emit) {
  //   final state = this.state;
  //   if (state is CartLoaded) {
  //     try {
  //       shoppingRepository.removeItemFromCart(event.item);
  //       emit(
  //         CartLoaded(
  //           cart: Cart(
  //             items: [...state.cart.items]..remove(event.item),
  //           ),
  //         ),
  //       );
  //     } catch (_) {
  //       emit(CartError());
  //     }
  //   }
  // }
}
