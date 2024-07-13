import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:routetask/core/utils/app_colors.dart';
import 'package:routetask/features/list_of_products/presentation/manager/products_cubit.dart';
import 'package:routetask/features/list_of_products/presentation/manager/products_state.dart';
import 'package:routetask/features/list_of_products/presentation/widgets/product_card.dart';


class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title:  Text('Route',style: TextStyle(color: Color(AppColor.primary.value)),),

        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'What do you search for?',
                      prefixIcon: const Icon(Icons.search, color: Colors.blue),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide:  BorderSide(color: Color(AppColor.primary.value), width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide:  BorderSide(color: Color(AppColor.primary.value), width: 2),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide:  BorderSide(color: Color(AppColor.primary.value), width: 2),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                IconButton(
                  icon:  Icon(Icons.shopping_cart, color: Color(AppColor.primary.value)),
                  onPressed: () {
                  },
                )
              ],
            ),
          ),
          Expanded(
            child: BlocBuilder<ProductCubit, ProductState>(
              bloc: BlocProvider.of<ProductCubit>(context),
              builder: (context, state) {
                if (state is ProductLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is ProductLoadedSuccessfully) {
                  return GridView.builder(
                    gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: (192 / 237),
                        crossAxisCount: 2,
                        mainAxisSpacing: 2.h,
                        crossAxisSpacing: 3.w,
                    ),
                    itemCount: state.products.products!.length,
                    itemBuilder: (context, index) {
                      final product = state.products.products![index];
                      return ProductCard(product: product);
                    },
                  );
                } else if (state is ProductError) {
                  return Center(child: Text(state.message));
                }
                return const Center(child: Text('No products found'));
              },
            ),
          ),
        ],
      ),
    );
  }
}

