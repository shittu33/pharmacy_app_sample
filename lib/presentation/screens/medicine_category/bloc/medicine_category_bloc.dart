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
    on<CategorySelected>(_onCategorySelected);
  }

  final MedicineRepository medicineRepository;

  void _onStarted(CategoryStarted event, Emitter<CategoryState> emit) async {
    emit(CategoryLoading());
    try {
      final items = await medicineRepository.loadCategory();
      emit(CategoryLoaded(categories: items, selectedCategory: items[0]));
    } catch (_) {
      emit(CategoryError());
    }
  }

  void _onCategorySelected(
      CategorySelected event, Emitter<CategoryState> emit) async {
    final state = this.state;
    if (state is CategoryLoaded) {
      try {
        var newCategories =
            await medicineRepository.selectCategory(event.category);

        var selectedCategories = newCategories.where((value) {
          return value.id == event.category;
        }).toList();

        emit(CategoryLoaded(
            categories: newCategories,
            selectedCategory: selectedCategories[0]));
      } catch (_) {
        emit(CategoryError());
      }
    }
  }
}
