class ProductDetailModel {
  final int id;
  final String prodName;
  final String img;
  final Map<String, List<String>> imgMap;
  final String category;
  final String productDetails;
  final String price;
  final List<String> features;
  final Map<String, String> specifications;
  final String rating;
  bool isOffer = false;
  int discountPercent = 0;
  String priceAfterDis;
  String? subCategory;

  ProductDetailModel({
    required this.id,
    required this.prodName,
    required this.img,
    required this.imgMap,
    required this.category,
    required this.productDetails,
    required this.price,
    required this.features,
    required this.specifications,
    required this.rating,
    required this.priceAfterDis,
    required this.isOffer,
    required this.discountPercent,
    this.subCategory,
  });

  @override
  String toString() {
    return 'ProductDetailModel('
        '  id: $id,'
        '  prodName: $prodName,'
        '  img: $img,'
        '  imgMap: $imgMap,'
        '  category: $category,'
        '  productDetails: $productDetails,'
        '  price: $price,'
        '  features: $features,'
        '  specifications: $specifications,'
        '  rating: $rating,'
        '  isOffer: $isOffer,'
        '  discountPercent: $discountPercent,'
        '  priceAfterDis: $priceAfterDis'
        ')';
  }
}

final List<ProductDetailModel> products = [
  ProductDetailModel(
    subCategory: "Chimney",
    isOffer: false,

    id: 1,
    prodName: "Deck Mount Kitchen Sink Faucets",
    img: "faucets_white.png",
    imgMap: {
      "white": ["faucets_white.png", "faucets_white.webp"],
      "yellow": [
        "faucets_yellow.webp",
        "faucets_yellow2.webp",
        "faucets_yellow3.webp",
      ],
      "black": ["faucets_black.webp"],
    },
    category: "Faucets",
    productDetails:
        "High-quality deck-mount kitchen faucet with satin finish and dual handles for precise temperature control. Built with corrosion-resistant brass and ceramic cartridges to prevent leaks and ensure lifelong performance.",
    price: "100",
    discountPercent: 0,
    priceAfterDis: "100",
    features: [
      "Satin finish",
      "Dual-handle",
      "Brass body",
      "Ceramic cartridges",
    ],
    specifications: {
      "Material": "Solid brass",
      "Installation Type": "Deck mount",
      "Hole Size": "1.25–1.5 in diameter",
      "Supply Line": "3/8 in compression, 20 in length",
      "Spout Height": "10 in",
    },
    rating: "4.5",
  ),
  ProductDetailModel(
    subCategory: "Oven",
    id: 2,
    prodName: "Round Handshowers",
    img: "shower_white.png",
    imgMap: {
      "white": [
        "shower_white.png",
        "shower_white.webp",
        "shower_white2.webp",
        "shower_white3.webp",
        "shower_white4.webp",
      ],
      "black": [
        "shower_black.webp",
        "shower_black2.webp",
        "shower_black3.webp",
        "shower_black4.webp",
      ],
    },
    category: "Shower",
    productDetails:
        "Ergonomic round hand shower offering three spray modes—massage, rain, and mist—plus anti-clog silicone nozzles and universal fittings for easy installation in any bathroom.",
    price: "60",
    isOffer: false,
    priceAfterDis: "60",
    discountPercent: 0,
    features: ["3 spray modes", "Silicone nozzles", "Ergonomic grip"],
    specifications: {
      "Material": "ABS plastic",
      "Connection": "1/2\" NPT",
      "Hose Length": "60 in",
      "Water Pressure": "20–80 psi",
    },
    rating: "4.3",
  ),

  ProductDetailModel(
    subCategory: "Dishwashers",
    id: 3,
    prodName: "Single Bowl Farmhouse Kitchen Sinks",
    img: "sink_white.png",
    imgMap: {
      "white": [
        "sink_white.png",
        "sink_white2.webp",
        "sink_white3.webp",
        "sink_white4.webp",
      ],
      "green": ["sink_green.webp", "sink_green2.webp", "sink_green3.webp"],
      "black": ["sink_black.webp", "sink_black2.webp", "sink_black3.webp"],
    },

    category: "Sinks",
    productDetails:
        "Durable single-bowl farmhouse sink crafted from 18‑gauge stainless steel, featuring sound‑dampening pads, undermount design, and generous capacity for large pots and pans.",
    price: "250",
    isOffer: false,
    priceAfterDis: "250",
    discountPercent: 0,
    features: ["18‑gauge steel", "Noise insulation", "Rust-resistant"],
    specifications: {
      "Material": "18‑gauge stainless steel",
      "Mount Type": "Under-mount",
      "Bowl Depth": "10 in",
      "Dimensions": "33 x 22 in",
    },
    rating: "4.0",
  ),
  ProductDetailModel(
    subCategory: "Tower Rails",
    id: 4,
    prodName: "Under Mount Kitchen Sinks",
    img: "kitchen_item.png",
    imgMap: {
      "white": ["kitchen_item.png"],
    },
    category: "Sinks",
    productDetails:
        "Under-mount sink with polished interior and reinforced rim. Generous basin depth lets you clean oversized pots efficiently, while its smooth edges simplify countertop integration.",
    price: "220",
    priceAfterDis: "220",
    isOffer: false,
    discountPercent: 0,
    features: ["Reinforced rim", "Polished interior", "Deep basin"],
    specifications: {
      "Material": "Stainless steel",
      "Mount Type": "Under-mount",
      "Bowl Depth": "9 in",
      "Dimensions": "30 x 18 in",
    },
    rating: "3.9",
  ),
  ProductDetailModel(
    subCategory: "Ceiling Lights",
    id: 5,
    prodName: "Stainless Steel Water Tap",
    img: "tap.png",
    imgMap: {
      "white": ["tap.png"],
    },
    category: "Taps",
    productDetails:
        "Contemporary stainless steel water tap featuring a single-lever ball valve for drip-free control and a 360° swivel spout for convenience and flexibility.",
    price: "40",
    priceAfterDis: "40",
    discountPercent: 0,
    isOffer: false,
    features: ["Single-lever", "Swivel spout", "Ball valve"],
    specifications: {
      "Material": "304 stainless steel",
      "Spout Reach": "8 in",
      "Valve Type": "Ball valve",
      "Mount Type": "Single-hole",
    },
    rating: "4.7",
  ),
  ProductDetailModel(
    subCategory: "Sofas",
    id: 6,
    prodName: "Medium Size Trash Cans",
    img: "trashcan_white.png",
    imgMap: {
      "white": ["trashcan_white.png", "trashcan_white.webp"],
      "grey": ["trashcan_grey.webp"],
      "black": ["trashcan_black.webp"],
    },

    category: "Trash Cans",
    productDetails:
        "Medium-capacity trash can with secure snap-on lid, smooth finishes for easy cleaning, and heavy-duty plastic body designed for everyday kitchen use.",
    price: "30",
    priceAfterDis: "30",
    discountPercent: 0,
    isOffer: false,
    features: ["Snap-on lid", "Easy-clean finish", "Durable plastic"],
    specifications: {
      "Material": "Polyethylene",
      "Capacity": "35 gal",
      "Dimensions": "16 x 16 x 24 in",
      "Use": "Indoor/outdoor",
    },
    rating: "4.1",
  ),
  ProductDetailModel(
    subCategory: "Bed Frames",
    id: 7,
    prodName: "Flush Mount Lighting Larges",
    img: "light1.png",
    imgMap: {
      "white": ["light1.png", "light2.png"],
    },
    category: "Lighting",
    productDetails:
        "Energy-efficient LED ceiling fixture with acrylic diffused cover and low-profile design—ideal for large living spaces seeking uniform, eye-friendly lighting.",
    price: "80",
    priceAfterDis: "80",
    discountPercent: 0,
    isOffer: false,
    features: ["LED panel", "Diffused light", "Low-profile"],
    specifications: {
      "Power": "18 W",
      "Lumens": "1500 lm",
      "Color Temp": "4000K",
      "Diameter": "14 in",
    },
    rating: "3.7",
  ),
  ProductDetailModel(
    subCategory: "Planters",
    id: 8,
    prodName: "Small Size Sink Flangers",
    img: "flanger_white.png",
    imgMap: {
      "white": ["flanger_white.png", "flanger_white.webp"],
      "yellow": ["flanger_yellow.webp"],
    },
    category: "Flangers",
    productDetails:
        "Compact sink flange fitting made from corrosion-resistant metal with standard threading, quick snap-on installation, and secure sealing to prevent leaks.",
    price: "15",
    priceAfterDis: "15",
    discountPercent: 0,
    isOffer: false,
    features: ["Corrosion-resistant", "Standard threading", "Leak seal"],
    specifications: {
      "Material": "Zinc alloy",
      "Thread Size": "1 1/2 in",
      "Use": "Kitchen sink flange",
      "Seal Type": "Rubber gasket",
    },
    rating: "3.5",
  ),
  // ProductDetailModel(
  //   id: 9,
  //   prodName: "Sofa",
  //   img: "sofa_grey.webp",
  //   imgMap: {
  //     "grey": [
  //       "sofa_grey.webp",
  //       "sofa_grey2.webp",
  //       "sofa_grey3.webp",
  //       "sofa_grey4.webp",
  //     ],
  //   },
  //   category: "Furniture",
  //   productDetails:
  //       "Modern grey upholstered sofa with high-density foam cushions and wooden legs.",
  //   price: "450",
  //   features: ["4-seat", "High-density foam", "Wooden legs"],
  //   specifications: {
  //     "Upholstery": "Fabric",
  //     "Seats": "4",
  //     "Assembly": "Required",
  //   },
  //   rating: "4.4",
  // ),
  // ProductDetailModel(
  //   id: 10,
  //   prodName: "Table",
  //   img: "table_white.webp",
  //   imgMap: {
  //     "white": ["table_white.webp", "table_white2.webp"],
  //   },
  //   category: "Furniture",
  //   productDetails:
  //       "Sleek modern white dining table with durable laminate top and steel legs.",
  //   price: "200",
  //   features: ["Laminate top", "Steel legs"],
  //   specifications: {"Material": "Laminate", "Length": "150 cm", "Seats": "4"},
  //   rating: "4.2",
  // ),
  // ProductDetailModel(
  //   id: 11,
  //   prodName: "White Bedframe",
  //   img: "bedframe_white.webp",
  //   imgMap: {
  //     "white": [
  //       "bedframe_white.webp",
  //       "bedframe_white2.webp",
  //       "bedframe_white3.webp",
  //     ],
  //   },
  //   category: "Furniture",
  //   productDetails:
  //       "White wooden bedframe with headboard paneling, fits queen size mattress.",
  //   price: "350",
  //   features: ["Wooden frame", "Headboard"],
  //   specifications: {
  //     "Material": "Wood",
  //     "Size": "Queen",
  //     "Assembly": "Required",
  //   },
  //   rating: "4.3",
  // ),
  // ProductDetailModel(
  //   id: 12,
  //   prodName: "White Bedside Table",
  //   img: "beside_table_white.webp",
  //   imgMap: {
  //     "white": ["beside_table_white.webp"],
  //   },
  //   category: "Furniture",
  //   productDetails:
  //       "Compact white bedside table with drawer and storage shelf.",
  //   price: "80",
  //   features: ["Drawer", "Open shelf"],
  //   specifications: {"Material": "MDF", "Drawers": "1", "Height": "60 cm"},
  //   rating: "4.1",
  // ),
  // ProductDetailModel(
  //   id: 13,
  //   prodName: "White Cleaner",
  //   img: "cleaner_white.webp",
  //   imgMap: {
  //     "white": ["cleaner_white.webp"],
  //   },
  //   category: "Home Appliances",
  //   productDetails:
  //       "Portable white vacuum cleaner with HEPA filter and long-reach hose.",
  //   price: "120",
  //   features: ["HEPA filter", "Portable"],
  //   specifications: {"Power": "1200 W", "Weight": "3 kg"},
  //   rating: "4.0",
  // ),
  // ProductDetailModel(
  //   id: 14,
  //   prodName: "Black Mirror",
  //   img: "mirror_black.webp",
  //   imgMap: {
  //     "black": [
  //       "mirror_black.webp",
  //       "mirror_black2.webp",
  //       "mirror_black3.webp",
  //       "mirror_black4.webp",
  //     ],
  //   },
  //   category: "Decor",
  //   productDetails: "Large framed black wall mirror in sleek metal design.",
  //   price: "150",
  //   features: ["Framed", "Wall mount"],
  //   specifications: {"Frame": "Metal", "Diameter": "80 cm"},
  //   rating: "4.5",
  // ),
  // ProductDetailModel(
  //   id: 15,
  //   prodName: "White Mirror",
  //   img: "mirror_white.webp",
  //   imgMap: {
  //     "white": [
  //       "mirror_white.webp",
  //       "mirror_white2.webp",
  //       "mirror_white3.webp",
  //     ],
  //   },
  //   category: "Decor",
  //   productDetails: "Elegant white round wall mirror with minimalist frame.",
  //   price: "140",
  //   features: ["Round", "Wall mount"],
  //   specifications: {"Frame": "Wood", "Diameter": "80 cm"},
  //   rating: "4.4",
  // ),
  // ProductDetailModel(
  //   id: 16,
  //   prodName: "White Pillow",
  //   img: "pillow_white.webp",
  //   imgMap: {
  //     "white": [
  //       "pillow_white.webp",
  //       "pillow_white2.webp",
  //       "pillow_white3.webp",
  //     ],
  //   },
  //   category: "Home Textiles",
  //   productDetails: "Plush white decorative pillow with soft cotton cover.",
  //   price: "30",
  //   features: ["Cotton cover", "Plush"],
  //   specifications: {"Material": "Cotton", "Size": "45×45 cm"},
  //   rating: "4.3",
  // ),
];

final List<ProductDetailModel> offerProducts = [
  ProductDetailModel(
    isOffer: true,
    discountPercent: 20,
    priceAfterDis: "12",
    id: 9,
    prodName: "Small Size Sink Flangers",
    img: "flanger_white.png",
    imgMap: {
      "white": ["flanger_white.png", "flanger_white.webp"],
      "yellow": ["flanger_yellow.webp"],
    },
    category: "Flangers",
    productDetails:
        "Compact sink flange fitting made from corrosion-resistant metal with standard threading, quick snap-on installation, and secure sealing to prevent leaks.",
    price: "15",
    features: ["Corrosion-resistant", "Standard threading", "Leak seal"],
    specifications: {
      "Material": "Zinc alloy",
      "Thread Size": "1 1/2 in",
      "Use": "Kitchen sink flange",
      "Seal Type": "Rubber gasket",
    },
    rating: "3.5",
  ),

  ProductDetailModel(
    isOffer: true,
    discountPercent: 30,
    priceAfterDis: "21",
    id: 10,
    prodName: "Medium Size Trash Cans",
    img: "trashcan_white.png",
    imgMap: {
      "white": ["trashcan_white.png", "trashcan_white.webp"],
      "grey": ["trashcan_grey.webp"],
      "black": ["trashcan_black.webp"],
    },

    category: "Trash Cans",
    productDetails:
        "Medium-capacity trash can with secure snap-on lid, smooth finishes for easy cleaning, and heavy-duty plastic body designed for everyday kitchen use.",
    price: "30",
    features: ["Snap-on lid", "Easy-clean finish", "Durable plastic"],
    specifications: {
      "Material": "Polyethylene",
      "Capacity": "35 gal",
      "Dimensions": "16 x 16 x 24 in",
      "Use": "Indoor/outdoor",
    },
    rating: "4.1",
  ),
];

final List<ProductDetailModel> newArrivals = [
  ProductDetailModel(
    id: 13,
    prodName: "Single Bowl Farmhouse Kitchen Sinks",
    img: "sink_white.png",
    imgMap: {
      "white": [
        "sink_white.png",
        "sink_white2.webp",
        "sink_white3.webp",
        "sink_white4.webp",
      ],
      "green": ["sink_green.webp", "sink_green2.webp", "sink_green3.webp"],
      "black": ["sink_black.webp", "sink_black2.webp", "sink_black3.webp"],
    },

    category: "Sinks",
    productDetails:
        "Durable single-bowl farmhouse sink crafted from 18‑gauge stainless steel, featuring sound‑dampening pads, undermount design, and generous capacity for large pots and pans.",
    price: "250",
    priceAfterDis: "250",
    discountPercent: 0,
    isOffer: false,
    features: ["18‑gauge steel", "Noise insulation", "Rust-resistant"],
    specifications: {
      "Material": "18‑gauge stainless steel",
      "Mount Type": "Under-mount",
      "Bowl Depth": "10 in",
      "Dimensions": "33 x 22 in",
    },
    rating: "4.0",
  ),
  ProductDetailModel(
    id: 14,
    prodName: "Under Mount Kitchen Sinks",
    img: "kitchen_item.png",
    imgMap: {
      "white": ["kitchen_item.png"],
    },
    category: "Sinks",
    productDetails:
        "Under-mount sink with polished interior and reinforced rim. Generous basin depth lets you clean oversized pots efficiently, while its smooth edges simplify countertop integration.",
    price: "220",
    priceAfterDis: "220",
    discountPercent: 0,
    isOffer: false,
    features: ["Reinforced rim", "Polished interior", "Deep basin"],
    specifications: {
      "Material": "Stainless steel",
      "Mount Type": "Under-mount",
      "Bowl Depth": "9 in",
      "Dimensions": "30 x 18 in",
    },
    rating: "3.9",
  ),
  ProductDetailModel(
    id: 15,
    prodName: "Stainless Steel Water Tap",
    img: "tap.png",
    imgMap: {
      "white": ["tap.png"],
    },
    category: "Taps",
    productDetails:
        "Contemporary stainless steel water tap featuring a single-lever ball valve for drip-free control and a 360° swivel spout for convenience and flexibility.",
    price: "40",
    priceAfterDis: "40",
    discountPercent: 0,
    isOffer: false,
    features: ["Single-lever", "Swivel spout", "Ball valve"],
    specifications: {
      "Material": "304 stainless steel",
      "Spout Reach": "8 in",
      "Valve Type": "Ball valve",
      "Mount Type": "Single-hole",
    },
    rating: "4.7",
  ),
];

final List<ProductDetailModel> popularProd = [
  ProductDetailModel(
    id: 16,
    prodName: "Stainless Steel Water Tap",
    img: "tap.png",
    imgMap: {
      "white": ["tap.png"],
    },
    category: "Taps",
    productDetails:
        "Contemporary stainless steel water tap featuring a single-lever ball valve for drip-free control and a 360° swivel spout for convenience and flexibility.",
    price: "40",
    priceAfterDis: "40",
    discountPercent: 0,
    isOffer: false,
    features: ["Single-lever", "Swivel spout", "Ball valve"],
    specifications: {
      "Material": "304 stainless steel",
      "Spout Reach": "8 in",
      "Valve Type": "Ball valve",
      "Mount Type": "Single-hole",
    },
    rating: "4.7",
  ),
];

final List<ProductDetailModel> bestSellers = [
  ProductDetailModel(
    id: 17,
    prodName: "Under Mount Kitchen Sinks",
    img: "kitchen_item.png",
    imgMap: {
      "white": ["kitchen_item.png"],
    },
    category: "Sinks",
    productDetails:
        "Under-mount sink with polished interior and reinforced rim. Generous basin depth lets you clean oversized pots efficiently, while its smooth edges simplify countertop integration.",
    price: "220",
    priceAfterDis: "220",
    discountPercent: 0,
    isOffer: false,
    features: ["Reinforced rim", "Polished interior", "Deep basin"],
    specifications: {
      "Material": "Stainless steel",
      "Mount Type": "Under-mount",
      "Bowl Depth": "9 in",
      "Dimensions": "30 x 18 in",
    },
    rating: "3.9",
  ),
  ProductDetailModel(
    id: 18,
    prodName: "Stainless Steel Water Tap",
    img: "tap.png",
    imgMap: {
      "white": ["tap.png"],
    },
    category: "Taps",
    productDetails:
        "Contemporary stainless steel water tap featuring a single-lever ball valve for drip-free control and a 360° swivel spout for convenience and flexibility.",
    price: "40",
    priceAfterDis: "40",
    discountPercent: 0,
    isOffer: false,
    features: ["Single-lever", "Swivel spout", "Ball valve"],
    specifications: {
      "Material": "304 stainless steel",
      "Spout Reach": "8 in",
      "Valve Type": "Ball valve",
      "Mount Type": "Single-hole",
    },
    rating: "4.7",
  ),
];
