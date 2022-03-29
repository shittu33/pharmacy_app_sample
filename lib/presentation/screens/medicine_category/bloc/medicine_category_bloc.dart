import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy/models/models.dart';
import 'package:pharmacy/repository/medicine_repository.dart';


part 'medicine_category_event.dart';
part 'medicine_category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc({required this.medicineRepository}) : super(CategoryLoading()) {
    on<CategoryStarted>(_onStarted);
  }

  final MedicineRepository medicineRepository;

  void _onStarted(CategoryStarted event, Emitter<CategoryState> emit) async {
    emit(CategoryLoading());
    try {
      final items = await medicineRepository.loadCategory();
      emit(CategoryLoaded(categories: items));
    } catch (_) {
      emit(CategoryError());
    }
  }

}
