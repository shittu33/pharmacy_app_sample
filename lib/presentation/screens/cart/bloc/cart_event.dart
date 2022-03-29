part of 'cart_bloc.dart';

@immutable
abstract class CategoryEvent extends Equatable {
  const CategoryEvent();
}

class CategoryStarted extends CategoryEvent {
  @override
  List<Object> get props => [];
}

class CategorySelected extends CategoryEvent {
  const CategorySelected(this.category);

  final int category;

  @override
  List<Object> get props => [category];
}

