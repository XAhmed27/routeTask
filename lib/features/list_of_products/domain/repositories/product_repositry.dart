import 'package:dio/dio.dart';

import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:routetask/features/list_of_products/data/models/list_of_products_response_body.dart';


abstract class ProductRepository {
  Future<ListOfProductsResponseBody> fetchProducts();
}


@module
abstract class RegisterModule {
  @lazySingleton
  Logger get logger => Logger();

  @lazySingleton
  Dio get dio {
    final dio = Dio();
    return dio;
  }
}
@LazySingleton(as: ProductRepository)
class ProductRepositoryImpl implements ProductRepository {
  final Dio client;
  final Logger logger;


  ProductRepositoryImpl(this.client, this.logger);

  @override
  Future<ListOfProductsResponseBody> fetchProducts() async {
    try {
      final response = await client.get('https://dummyjson.com/products');
      Logger().i(response.data);
      return ListOfProductsResponseBody.fromJson(response.data);
    } catch (e) {
      logger.e('Failed to load products', error: e);
      throw Exception('Failed to load products');
    }
  }
}
