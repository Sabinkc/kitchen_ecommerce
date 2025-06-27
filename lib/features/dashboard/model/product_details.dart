final List<ProductDetailModel> products = [
  ProductDetailModel(
    prodName: "Deck Mount Kitchen Sink Faucets",
    img: "faucets_white.png",
    imgList: ["faucets_white.png", "faucets_yellow.webp", "faucets_black.webp"],
    category: "Faucets",
    productDetails: "Deck mounting kitchen faucet with sleek finish.",
    price: "100",
  ),
  ProductDetailModel(
    prodName: "Round Handshowers",
    img: "shower_white.png",
    imgList: ["shower_white.png", "shower_black.webp"],
    category: "Shower",
    productDetails: "Round hand-shower ideal for modern bathrooms.",
    price: "60",
  ),
  ProductDetailModel(
    prodName: "Single Bowl Farmhouse Kitchen Sinks",
    img: "sink_white.png",
    imgList: ["sink_white.png", "sink_black.webp", "sink_green.webp"],
    category: "Sinks",
    productDetails: "Single bowl farmhouse kitchen sink, sturdy and stylish.",
    price: "250",
  ),
  ProductDetailModel(
    prodName: "Under Mount Kitchen Sinks",
    img: "kitchen_item.png",
    imgList: ["kitchen_item.png"],
    category: "Sinks",
    productDetails: "Under-mount kitchen sink for a seamless countertop look.",
    price: "220",
  ),
  ProductDetailModel(
    prodName: "Stainless Steel Water Tap",
    img: "tap.png",
    imgList: ["tap.png"],
    category: "Taps",
    productDetails: "Durable stainless steel water tap with modern design.",
    price: "40",
  ),
  ProductDetailModel(
    prodName: "Medium Size Trash Cans",
    img: "trashcan_white.png",
    imgList: [
      "trashcan_white.png",
      "trashcan_grey.webp",
      "trashcan_black.webp",
    ],
    category: "Trash Cans",
    productDetails: "Medium size trash can with lid, easy to clean.",
    price: "30",
  ),
  ProductDetailModel(
    prodName: "Flush Mount Lighting Larges",
    img: "light1.png",
    imgList: ["light1.png"],
    category: "Lighting",
    productDetails: "Flush-mount ceiling light for large rooms.",
    price: "80",
  ),
  ProductDetailModel(
    prodName: "Small Size Sink Flangers",
    img: "flanger_white.png",
    imgList: ["flanger_white.png", "flanger_yellow.webp", "flanger_black.webp"],
    category: "Flangers",
    productDetails: "Small sink flange connector fitting, robust build.",
    price: "15",
  ),
];

class ProductDetailModel {
  final String prodName;
  final String img;
  final List<String> imgList;
  final String category;
  final String productDetails;
  final String price;

  ProductDetailModel({
    required this.prodName,
    required this.img,
    required this.imgList,
    required this.category,
    required this.productDetails,
    required this.price,
  });
}
