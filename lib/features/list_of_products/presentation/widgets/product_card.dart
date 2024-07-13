import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:routetask/core/utils/app_colors.dart';
import 'package:routetask/features/list_of_products/data/models/list_of_products_response_body.dart';


class ProductCard extends StatelessWidget {
  final Products product;

  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(2.0.w),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.sp),
              border: Border.all(color: Color(AppColor.primary.value), width: 4.sp),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    AspectRatio(
                      aspectRatio: 6 / 4,
                      child: ClipRRect(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(8.sp)),
                        child: Image.network(
                          product.thumbnail!,
                          width: double.infinity,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 1.w,
                      right: 1.w,
                      child: IconButton(
                        icon: Icon(
                          Icons.favorite_border,
                          color: Colors.indigo,
                          size: 3.h,
                        ),
                        onPressed: () {
                          // Add your onPressed logic here
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 1.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.w),
                  child: Text(
                    product.title!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 2.h,
                      color:Color(AppColor.primary.value),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.w),
                  child: Text(
                    product.description!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Color(AppColor.primary.value),
                      fontSize: 1.8.h,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.w),
                  child: Row(
                    children: [
                      Text(
                        'EGP ${product.price}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14.sp,
                          color: Color(AppColor.primary.value),
                        ),
                      ),
                      SizedBox(width: 2.w),
                      if (product.discountPercentage != null)
                        Text(
                          'EGP ${(product.price! * (1 + product.discountPercentage! / 100)).toStringAsFixed(2)}',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Color(AppColor.font.value),
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.w),
                  child: Row(
                    children: [
                      Text(
                        'Review (${product.rating})',
                        style: TextStyle(
                          fontSize: 15.sp,
                          color: Color(AppColor.font.value),
                        ),
                      ),
                      SizedBox(width: 1.w),
                      Icon(
                        Icons.star,
                        size: 18.sp,
                        color: Colors.yellow,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 1.h),
              ],
            ),
          ),
          Positioned(
            bottom: -0.6.h,
            right: 1.w,
            child: IconButton(
              icon: Icon(
                Icons.add_circle,
                color: Color(AppColor.primary.value),
                size: 3.h,
              ),
              onPressed: () {
                // Add your onPressed logic here
              },
            ),
          ),
        ],
      ),
    );
  }
}
