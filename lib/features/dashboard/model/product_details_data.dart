class ProductDetailModel {
  final int id;
  final String prodName;
  final String img;
  final Map<String, List<String>> imgMap;
  final String category;
  final String productDetails;
  final String price;
  final String rating;
  bool isOffer = false;
  int discountPercent = 0;
  String priceAfterDis;
  String? subCategory;
  Map dynamicData;

  ProductDetailModel({
    required this.id,
    required this.prodName,
    required this.img,
    required this.imgMap,
    required this.category,
    required this.productDetails,
    required this.price,
    required this.rating,
    required this.priceAfterDis,
    required this.isOffer,
    required this.discountPercent,
    this.subCategory,
    required this.dynamicData,
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
        '  rating: $rating,'
        '  isOffer: $isOffer,'
        '  discountPercent: $discountPercent,'
        '  priceAfterDis: $priceAfterDis'
        ')';
  }
}

final List<ProductDetailModel> products = [
  ProductDetailModel(
    subCategory: "Faucet",
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

    rating: "4.5",

    /// ✅ New field added
    dynamicData: {
      "Features": [
        "Satin finish",
        "Dual-handle",
        "Brass body",
        "Ceramic cartridges",
      ],
      "Dimensions": {
        "Hole Size": "1.25–1.5 in diameter",
        "Spout Height": "10 in",
        "Supply Line": "3/8 in compression, 20 in length",
      },
      "Specifications": {
        "Material": "Solid brass",
        "Installation Type": "Deck mount",
      },
      "Installation and Service": '''
• Installation Type: Deck mount  
• Requires a standard 1.25–1.5 inch diameter hole  
• Connects via 3/8 in compression supply line  
• Service Note: Comes with ceramic cartridges for long-lasting performance  
''',
    },
  ),

  ProductDetailModel(
    subCategory: "Shower",
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

    rating: "4.3",

    /// ✅ Added dynamicData field
    dynamicData: {
      "Features": ["3 spray modes", "Silicone nozzles", "Ergonomic grip"],
      "Dimensions": {"Hose Length": "60 in", "Water Pressure": "20–80 psi"},
      "Specifications": {"Material": "ABS plastic", "Connection": "1/2\" NPT"},
      "Installation and Service": '''
• Universal 1/2" NPT connection  
• Easily installs without tools  
• Compatible with most standard shower arms  
• Anti-clog silicone nozzles make maintenance simple  
''',
    },
  ),
  ProductDetailModel(
    subCategory: "Sink",
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

    rating: "4.0",

    /// ✅ New field added
    dynamicData: {
      "Features": ["18‑gauge steel", "Noise insulation", "Rust-resistant"],
      "Dimensions": {"Bowl Depth": "10 in", "Overall Size": "33 x 22 in"},
      "Specifications": {
        "Material": "18‑gauge stainless steel",
        "Mount Type": "Under-mount",
      },
      "Installation and Service": '''
• Mount Type: Under-mount  
• Fits standard 33-inch cabinet base  
• Includes mounting clips and cut-out template  
• Service Note: Sound-dampening pads reduce noise during use  
''',
    },
  ),

  ProductDetailModel(
    subCategory: "Sink",
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

    rating: "3.9",

    /// ✅ New field added
    dynamicData: {
      "Features": ["Reinforced rim", "Polished interior", "Deep basin"],
      "Dimensions": {"Bowl Depth": "9 in", "Overall Size": "30 x 18 in"},
      "Specifications": {
        "Material": "Stainless steel",
        "Mount Type": "Under-mount",
      },
      "Installation and Service": '''
• Mount Type: Under-mount  
• Compatible with 30-inch cabinet base  
• Smooth rim allows flush installation  
• Service Note: Designed for durability and minimal noise  
''',
    },
  ),
  ProductDetailModel(
    subCategory: "Faucet",
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

    rating: "4.7",

    /// ✅ New field added
    dynamicData: {
      "Features": ["Single-lever", "Swivel spout", "Ball valve"],
      "Dimensions": {"Spout Reach": "8 in"},
      "Specifications": {
        "Material": "304 stainless steel",
        "Valve Type": "Ball valve",
        "Mount Type": "Single-hole",
      },
      "Installation and Service": '''
• Mount Type: Single-hole  
• Spout rotates 360° for flexible use  
• Single-lever for easy temperature and flow control  
• Service Note: Made from durable 304 stainless steel for corrosion resistance  
''',
    },
  ),

  ProductDetailModel(
    subCategory: "Trash Can",
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

    rating: "4.1",

    /// ✅ New field added
    dynamicData: {
      "Features": ["Snap-on lid", "Easy-clean finish", "Durable plastic"],
      "Dimensions": {"Capacity": "35 gal", "Size": "16 x 16 x 24 in"},
      "Specifications": {"Material": "Polyethylene", "Use": "Indoor/outdoor"},
    },
  ),
  ProductDetailModel(
    subCategory: "Mount Lighting",
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

    rating: "3.7",

    /// ✅ New field added
    dynamicData: {
      "Features": ["LED panel", "Diffused light", "Low-profile"],
      "Dimensions": {"Diameter": "14 in"},
      "Specifications": {
        "Power": "18 W",
        "Lumens": "1500 lm",
        "Color Temp": "4000K",
      },
      "Installation and Service": '''
• Ceiling-mounted fixture  
• Ideal for large living spaces  
• Includes mounting hardware  
• Service Note: Long-life LED panel with low energy consumption  
''',
    },
  ),

  ProductDetailModel(
    subCategory: "Flanger",
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

    rating: "3.5",

    /// ✅ New field added
    dynamicData: {
      "Features": ["Corrosion-resistant", "Standard threading", "Leak seal"],
      "Dimensions": {"Thread Size": "1 1/2 in"},
      "Specifications": {
        "Material": "Zinc alloy",
        "Seal Type": "Rubber gasket",
        "Use": "Kitchen sink flange",
      },
      "Installation and Service": '''
• Quick snap-on installation  
• Fits standard 1 1/2 inch sink thread  
• Includes rubber gasket for secure seal  
• Service Note: Rust-proof zinc body ensures durability  
''',
    },
  ),

  ProductDetailModel(
    id: 9,
    prodName: "Sofa",
    subCategory: "Sofa",
    img: "sofa_grey.webp",
    imgMap: {
      "grey": [
        "sofa_grey.webp",
        "sofa_grey2.webp",
        "sofa_grey3.webp",
        "sofa_grey4.webp",
      ],
    },
    category: "Furniture",
    productDetails:
        "Modern grey upholstered sofa with high-density foam cushions and wooden legs.",
    price: "450",
    priceAfterDis: "450",
    discountPercent: 0,
    isOffer: false,

    rating: "4.4",

    /// ✅ New field added
    dynamicData: {
      "Features": ["4-seat", "High-density foam", "Wooden legs"],
      "Dimensions": {"Seats": "4"},
      "Specifications": {"Upholstery": "Fabric", "Assembly": "Required"},
    },
  ),

  ProductDetailModel(
    id: 10,
    subCategory: "Table",
    prodName: "Table",
    img: "table_white.webp",
    imgMap: {
      "white": ["table_white.webp", "table_white2.webp"],
    },
    category: "Furniture",
    productDetails:
        "Sleek modern white dining table with durable laminate top and steel legs.",
    price: "200",
    priceAfterDis: "200",
    isOffer: false,
    discountPercent: 0,

    rating: "4.2",

    /// ✅ New field added
    dynamicData: {
      "Features": ["Laminate top", "Steel legs"],
      "Dimensions": {"Length": "150 cm", "Seats": "4"},
      "Specifications": {"Material": "Laminate"},
    },
  ),
  ProductDetailModel(
    id: 11,
    subCategory: "Bed Frame",
    prodName: "White Bedframe",
    img: "bedframe_white.webp",
    imgMap: {
      "white": [
        "bedframe_white.webp",
        "bedframe_white2.webp",
        "bedframe_white3.webp",
      ],
    },
    category: "Furniture",
    productDetails:
        "White wooden bedframe with headboard paneling, fits queen size mattress.",
    price: "350",
    priceAfterDis: "350",
    isOffer: false,
    discountPercent: 0,

    rating: "4.3",

    /// ✅ New field added
    dynamicData: {
      "Features": ["Wooden frame", "Headboard"],
      "Dimensions": {"Size": "Queen"},
      "Specifications": {"Material": "Wood", "Assembly": "Required"},
    },
  ),
  ProductDetailModel(
    id: 12,
    subCategory: "Table",
    prodName: "White Bedside Table",
    img: "beside_table_white.webp",
    imgMap: {
      "white": ["beside_table_white.webp"],
    },
    category: "Furniture",
    productDetails:
        "Compact white bedside table with drawer and storage shelf.",
    price: "80",
    priceAfterDis: "80",
    isOffer: false,
    discountPercent: 0,

    rating: "4.1",

    /// ✅ New field added
    dynamicData: {
      "Features": ["Drawer", "Open shelf"],
      "Dimensions": {"Height": "60 cm", "Drawers": "1"},
      "Specifications": {"Material": "MDF"},
    },
  ),

  ProductDetailModel(
    id: 13,
    subCategory: "Cleaner",
    prodName: "White Cleaner",
    img: "cleaner_white.webp",
    imgMap: {
      "white": ["cleaner_white.webp"],
    },
    category: "Home Appliances",
    productDetails:
        "Portable white vacuum cleaner with HEPA filter and long-reach hose.",
    price: "120",
    priceAfterDis: "120",
    isOffer: false,
    discountPercent: 0,

    rating: "4.0",

    /// ✅ New field added
    dynamicData: {
      "Features": ["HEPA filter", "Portable"],
      "Dimensions": {"Weight": "3 kg"},
      "Specifications": {"Power": "1200 W"},
    },
  ),

  ProductDetailModel(
    subCategory: "Mirror",
    id: 14,
    prodName: "Mirror",
    img: "mirror_white.webp",
    imgMap: {
      "black": [
        "mirror_black.webp",
        "mirror_black2.webp",
        "mirror_black3.webp",
        "mirror_black4.webp",
      ],
      "white": [
        "mirror_white.webp",
        "mirror_white2.webp",
        "mirror_white3.webp",
      ],
    },
    category: "Decor",
    productDetails: "Large framed wall mirror in sleek metal design.",
    price: "150",
    priceAfterDis: "150",
    isOffer: false,
    discountPercent: 0,

    rating: "4.5",

    /// ✅ New field added
    dynamicData: {
      "Features": ["Framed", "Wall mount"],
      "Dimensions": {"Diameter": "80 cm"},
      "Specifications": {"Frame": "Metal"},
    },
  ),

  ProductDetailModel(
    subCategory: "Pillow",
    id: 15,
    prodName: "White Pillow",
    img: "pillow_white.webp",
    imgMap: {
      "white": [
        "pillow_white.webp",
        "pillow_white2.webp",
        "pillow_white3.webp",
      ],
    },
    category: "Home Textiles",
    productDetails: "Plush white decorative pillow with soft cotton cover.",
    price: "30",
    priceAfterDis: "30",
    isOffer: false,
    discountPercent: 0,

    rating: "4.3",

    /// ✅ New field added
    dynamicData: {
      "Features": ["Cotton cover", "Plush"],
      "Dimensions": {"Size": "45×45 cm"},
      "Specifications": {"Material": "Cotton"},
    },
  ),
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

    rating: "3.5",

    /// ✅ New field added
    dynamicData: {
      "Features": ["Corrosion-resistant", "Standard threading", "Leak seal"],
      "Dimensions": {"Thread Size": "1 1/2 in"},
      "Specifications": {
        "Material": "Zinc alloy",
        "Use": "Kitchen sink flange",
        "Seal Type": "Rubber gasket",
      },
      "Installation and Service": '''
• Snap-on installation for quick setup  
• Made from corrosion-resistant zinc alloy  
• Secure rubber gasket ensures leak-proof seal  
• Service Note: Inspect gasket periodically for wear and replace if needed  
''',
    },
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

    rating: "4.1",

    /// ✅ New field added
    dynamicData: {
      "Features": ["Snap-on lid", "Easy-clean finish", "Durable plastic"],
      "Dimensions": {"Capacity": "35 gal", "Size": "16 x 16 x 24 in"},
      "Specifications": {"Material": "Polyethylene", "Use": "Indoor/outdoor"},
    },
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

    rating: "4.0",

    /// ✅ New field added
    dynamicData: {
      "Features": ["18‑gauge steel", "Noise insulation", "Rust-resistant"],
      "Dimensions": {"Bowl Depth": "10 in", "Size": "33 x 22 in"},
      "Specifications": {
        "Material": "18‑gauge stainless steel",
        "Mount Type": "Under-mount",
      },
      "Installation and Service": '''
• Mount Type: Under-mount  
• Ideal for large cookware and deep cleaning  
• Includes sound-dampening pads to reduce noise  
• Service Note: Wipe with mild detergent and non-abrasive sponge  
''',
    },
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

    rating: "3.9",

    /// ✅ New field added
    dynamicData: {
      "Features": ["Reinforced rim", "Polished interior", "Deep basin"],
      "Dimensions": {"Bowl Depth": "9 in", "Size": "30 x 18 in"},
      "Specifications": {
        "Material": "Stainless steel",
        "Mount Type": "Under-mount",
      },
      "Installation and Service": '''
• Mount Type: Under-mount  
• Smooth edges support flush countertop integration  
• Deep basin allows easy cleaning of large items  
• Service Note: Polished surface resists stains and discoloration  
''',
    },
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

    rating: "4.7",

    /// ✅ New field added
    dynamicData: {
      "Features": ["Single-lever", "Swivel spout", "Ball valve"],
      "Dimensions": {"Spout Reach": "8 in"},
      "Specifications": {
        "Material": "304 stainless steel",
        "Valve Type": "Ball valve",
        "Mount Type": "Single-hole",
      },
      "Installation and Service": '''
• Mount Type: Single-hole  
• 360° swivel spout for flexible movement  
• Easy-to-use single lever for water control  
• Service Note: Corrosion-resistant finish; clean with soft cloth  
''',
    },
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

    rating: "4.7",

    /// ✅ New field added
    dynamicData: {
      "Features": ["Single-lever", "Swivel spout", "Ball valve"],
      "Dimensions": {"Spout Reach": "8 in"},
      "Specifications": {
        "Material": "304 stainless steel",
        "Valve Type": "Ball valve",
        "Mount Type": "Single-hole",
      },
      "Installation and Service": '''
• Mount Type: Single-hole  
• Easy-to-install with standard kitchen or bathroom setup  
• 360° swivel spout offers full sink coverage  
• Service Note: Ball valve mechanism ensures drip-free performance  
''',
    },
  ),
];

final List<ProductDetailModel> bestSellers = [
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

    rating: "4.7",

    /// ✅ New field added
    dynamicData: {
      "Features": ["Single-lever", "Swivel spout", "Ball valve"],
      "Dimensions": {"Spout Reach": "8 in"},
      "Specifications": {
        "Material": "304 stainless steel",
        "Valve Type": "Ball valve",
        "Mount Type": "Single-hole",
      },
      "Installation and Service": '''
• Mount Type: Single-hole  
• Easy-to-install with standard kitchen or bathroom setup  
• 360° swivel spout offers full sink coverage  
• Service Note: Ball valve mechanism ensures drip-free performance  
''',
    },
  ),
];
