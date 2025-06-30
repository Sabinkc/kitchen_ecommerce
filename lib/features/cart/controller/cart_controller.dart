import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kitchen_ecommerce/features/cart/model/cart_model_provider.dart';

final cartController = ChangeNotifierProvider<CartModelProvider>((ref) {
  return CartModelProvider();
});
