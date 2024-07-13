import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:routetask/features/list_of_products/domain/repositories/product_repositry.dart';
import 'package:routetask/features/list_of_products/presentation/pages/list_of_products.dart';


import '../../features/list_of_products/presentation/manager/products_cubit.dart';
import '../../features/splash/ui/splash_page.dart';
import 'app_routes.dart';

class AppRouter {
  static Route? onGenerate(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case AppRoutes.splash:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (context) => const SplashPage(),
        );
      case AppRoutes.ProductListScreen:
        return MaterialPageRoute(
          settings: routeSettings,

          builder: (context) =>
              BlocProvider(
                create: (context) => ProductCubit(ProductRepositoryImpl(Dio(),Logger()))..fetchProducts(),
                child: const ProductListScreen(),
              ),
        );
    }
    return null;
  }
}
