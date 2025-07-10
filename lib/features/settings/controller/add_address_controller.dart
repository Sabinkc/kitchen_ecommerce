import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kitchen_ecommerce/features/settings/model/add_address_model.dart';

final addAddressController = ChangeNotifierProvider<AddAddressModel>((ref) {
  return AddAddressModel();
});
