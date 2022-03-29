part of 'cart_bloc.dart';

@immutable
abstract class CartState extends Equatable {
  const CartState();
}

class CartLoading extends CartState {
  @override
  List<Object> get props => [];
}

class CartLoaded extends CartState {
  const CartLoaded(
      {this.carts = const []});

  final List<CartItem> carts;

  @override
  List<Object> get props => [carts];
}

class CartError extends CartState {
  @override
  List<Object> get props => [];
}
