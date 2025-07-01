class CartItemModel {
  final int id;
  final String prodName;
  final String img;
  final String category;
  final String price;
  int quantity;
  final String color;
  final bool isOffer;
  final int discountPercent;
  final String priceAfterDis;
  bool isSelected;

  CartItemModel({
    required this.id,
    required this.prodName,
    required this.img,
    required this.category,
    required this.price,
    required this.quantity,
    required this.color,
    required this.priceAfterDis,
    required this.isOffer,
    required this.discountPercent,
    required this.isSelected,
  });

  @override
  String toString() {
    return 'CartItemModel('
        'id: $id, '
        'name: "$prodName", '
        'category: "$category", '
        'price: $price, '
        'quantity: $quantity, '
        'color: $color,'
        'isOffer: $isOffer, '
        'discountPercent: $discountPercent, '
        'priceAfterDis: $priceAfterDis'
        ')';
  }
}
