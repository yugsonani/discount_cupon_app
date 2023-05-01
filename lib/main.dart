import 'package:discount_cupon_app/views/screens/coupon_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'views/screens/cart_page.dart';
import 'views/screens/home_page.dart';
import 'views/screens/product_page.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      getPages: [
        GetPage(name: "/", page: () => const HomePage()),
        GetPage(name: "/product_page", page: () => const ProductPage()),
        GetPage(name: "/cart_page", page: () => const CartPage()),
        GetPage(name: "/coupon_page", page: () => const CouponPage()),
      ],
    ),
  );
}
