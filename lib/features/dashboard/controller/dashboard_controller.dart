import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kitchen_ecommerce/features/dashboard/model/landing_screen_model.dart';

final lanController = ChangeNotifierProvider<LandingScreenModel>((ref) {
  return LandingScreenModel();
});
