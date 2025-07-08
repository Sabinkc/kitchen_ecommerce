import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kitchen_ecommerce/features/cart/model/address_model.dart';

final addressController = ChangeNotifierProvider<AddressModel>((ref) {
  return AddressModel();
});
