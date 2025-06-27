class ProductDetailModel {
  final String prodName;
  final String img;
  final Map<String, List<String>> imgMap;
  final String category;
  final String productDetails;
  final String price;
  final List<String> features;
  final Map<String, String> specifications;
  final String rating;

  ProductDetailModel({
    required this.prodName,
    required this.img,
    required this.imgMap,
    required this.category,
    required this.productDetails,
    required this.price,
    required this.features,
    required this.specifications,
    required this.rating,
  });
}

final List<ProductDetailModel> products = [
  ProductDetailModel(
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
    prodName: "Under Mount Kitchen Sinks",
    img: "kitchen_item.png",
    imgMap: {
      "white": ["kitchen_item.png"],
    },
    category: "Sinks",
    productDetails:
        "Under-mount sink with polished interior and reinforced rim. Generous basin depth lets you clean oversized pots efficiently, while its smooth edges simplify countertop integration.",
    price: "220",
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
    prodName: "Stainless Steel Water Tap",
    img: "tap.png",
    imgMap: {
      "white": ["tap.png"],
    },
    category: "Taps",
    productDetails:
        "Contemporary stainless steel water tap featuring a single-lever ball valve for drip-free control and a 360° swivel spout for convenience and flexibility.",
    price: "40",
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
  ProductDetailModel(
    prodName: "Flush Mount Lighting Larges",
    img: "light1.png",
    imgMap: {
      "white": ["light1.png", "light2.png"],
    },
    category: "Lighting",
    productDetails:
        "Energy-efficient LED ceiling fixture with acrylic diffused cover and low-profile design—ideal for large living spaces seeking uniform, eye-friendly lighting.",
    price: "80",
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
];
