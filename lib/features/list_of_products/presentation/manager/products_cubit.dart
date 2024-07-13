import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:routetask/features/list_of_products/domain/repositories/product_repositry.dart';
import 'package:routetask/features/list_of_products/presentation/manager/products_state.dart';



class ProductCubit extends Cubit<ProductState> {
  final ProductRepository repository;

  ProductCubit(this.repository) : super(ProductInitial());

  void fetchProducts() async {
    try {
      emit(ProductLoading());
      final products = await repository.fetchProducts();
      emit(ProductLoadedSuccessfully(products));
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }
}
