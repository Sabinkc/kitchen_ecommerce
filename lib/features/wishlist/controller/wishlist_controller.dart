import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kitchen_ecommerce/features/wishlist/model/wishlist_model.dart';

final wishListController = ChangeNotifierProvider<WishlistModel>((ref) {
  return WishlistModel();
});
