abstract class ProductState {
  final dynamic data;

  ProductState({required this.data});
}

class ProductInitialState extends ProductState{
  ProductInitialState() : super(data: null);
}

class ProductLoadingState extends ProductState{
  ProductLoadingState() : super(data: null);
}

class ProductLoadedState extends ProductState{
  ProductLoadedState({required super.data});
}

class ProductErrorState extends ProductState{
  final Exception exception;

  ProductErrorState({required this.exception}) : super(data: null);
}