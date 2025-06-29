import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kitchen_ecommerce/features/dashboard/model/dashboard_model.dart';
import 'package:kitchen_ecommerce/features/dashboard/model/home_botproduct_model.dart';
import 'package:kitchen_ecommerce/features/dashboard/model/landing_screen_model.dart';
import 'package:kitchen_ecommerce/features/dashboard/model/product_detail_screen_model.dart';

final lanController = ChangeNotifierProvider<LandingScreenModel>((ref) {
  return LandingScreenModel();
});

final productDetController = ChangeNotifierProvider<ProductDetailScreenModel>((
  ref,
) {
  return ProductDetailScreenModel();
});

final smoothController = ChangeNotifierProvider<DashboardModel>((ref) {
  return DashboardModel();
});

final botmProdController = ChangeNotifierProvider<HomeBotproductModel>((ref) {
  return HomeBotproductModel();
});
