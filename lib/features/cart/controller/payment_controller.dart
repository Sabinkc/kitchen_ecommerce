import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kitchen_ecommerce/features/cart/model/payment_model.dart';

final paymentController = ChangeNotifierProvider<PaymentModel>((ref) {
  return PaymentModel();
});
