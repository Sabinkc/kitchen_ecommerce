class CartItemModel {
  final int id;
  final String prodName;
  final String img;
  final String category;
  final String price;
  final int quantity;
  final bool? isOffer;
  final int? discountPercent;
  final String? priceAfterDis;

  CartItemModel({
    required this.id,
    required this.prodName,
    required this.img,
    required this.category,
    required this.price,
    required this.quantity,
    this.priceAfterDis,
    this.isOffer,
    this.discountPercent,
  });

  @override
  String toString() {
    return 'CartItemModel('
        'id: $id, '
        'name: "$prodName", '
        'category: "$category", '
        'price: $price, '
        'quantity: $quantity, '
        'isOffer: ${isOffer ?? false}, '
        'discountPercent: ${discountPercent ?? 0}, '
        'priceAfterDis: ${priceAfterDis ?? "N/A"}'
        ')';
  }
}
