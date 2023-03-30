import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy/models/models.dart';
import 'package:pharmacy/repository/medicine_repository.dart';

part 'cart_event.dart';

part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc({required this.medicineRepository}) : super(CartLoading()) {
    on<CartStarted>(_onStarted);
    on<CartItemAdded>(_onItemAdded);
    on<CartItemRemoved>(_onItemRemoved);
  }

  final MedicineRepository medicineRepository;

  void _onStarted(CartStarted event, Emitter<CartState> emit) async {
    emit(CartLoading());
    try {
      final items = await medicineRepository.loadCarts();
      emit(CartLoaded(carts: items));
    } catch (_) {
      emit(CartError());
    }
  }

  void _onItemAdded(CartItemAdded event, Emitter<CartState> emit) async {
    final state = this.state;
    if (state is CartLoaded) {
      try {
        medicineRepository.addItemToCart(event.item);
        emit(CartLoaded(carts: [...state.carts, event.item]));
      } catch (_) {
        emit(CartError());
      }
    }
  }

  void _onItemRemoved(CartItemRemoved event, Emitter<CartState> emit) {
    final state = this.state;
    if (state is CartLoaded) {
      try {
        medicineRepository.removeItemFromCart(event.item);
        emit(
          CartLoaded(
            carts: [...state.carts]..removeWhere((item) => event.item == item.id),
          ),
        );
      } catch (_) {
        emit(CartError());
      }
    }
  }
}
