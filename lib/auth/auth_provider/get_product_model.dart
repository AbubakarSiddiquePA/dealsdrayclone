// To parse this JSON data, do
//
//     final getProductsModel = getProductsModelFromJson(jsonString);

import 'dart:convert';

GetProductsModel getProductsModelFromJson(String str) =>
    GetProductsModel.fromJson(json.decode(str));

String getProductsModelToJson(GetProductsModel data) =>
    json.encode(data.toJson());

class GetProductsModel {
  int? status;
  Data? data;

  GetProductsModel({
    this.status,
    this.data,
  });

  factory GetProductsModel.fromJson(Map<String, dynamic> json) =>
      GetProductsModel(
        status: json["status"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data?.toJson(),
      };
}

class Data {
  List<Banner>? bannerOne;
  List<Category>? category;
  List<Product>? products;
  List<Banner>? bannerTwo;
  List<BrandListing>? newArrivals;
  List<Banner>? bannerThree;
  List<BrandListing>? categoriesListing;
  List<TopBrand>? topBrands;
  List<BrandListing>? brandListing;
  List<Category>? topSellingProducts;
  List<BrandListing>? featuredLaptop;
  List<TopBrand>? upcomingLaptops;
  List<BrandListing>? unboxedDeals;
  List<BrandListing>? myBrowsingHistory;

  Data({
    this.bannerOne,
    this.category,
    this.products,
    this.bannerTwo,
    this.newArrivals,
    this.bannerThree,
    this.categoriesListing,
    this.topBrands,
    this.brandListing,
    this.topSellingProducts,
    this.featuredLaptop,
    this.upcomingLaptops,
    this.unboxedDeals,
    this.myBrowsingHistory,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        bannerOne: json["banner_one"] == null
            ? []
            : List<Banner>.from(
                json["banner_one"]!.map((x) => Banner.fromJson(x))),
        category: json["category"] == null
            ? []
            : List<Category>.from(
                json["category"]!.map((x) => Category.fromJson(x))),
        products: json["products"] == null
            ? []
            : List<Product>.from(
                json["products"]!.map((x) => Product.fromJson(x))),
        bannerTwo: json["banner_two"] == null
            ? []
            : List<Banner>.from(
                json["banner_two"]!.map((x) => Banner.fromJson(x))),
        newArrivals: json["new_arrivals"] == null
            ? []
            : List<BrandListing>.from(
                json["new_arrivals"]!.map((x) => BrandListing.fromJson(x))),
        bannerThree: json["banner_three"] == null
            ? []
            : List<Banner>.from(
                json["banner_three"]!.map((x) => Banner.fromJson(x))),
        categoriesListing: json["categories_listing"] == null
            ? []
            : List<BrandListing>.from(json["categories_listing"]!
                .map((x) => BrandListing.fromJson(x))),
        topBrands: json["top_brands"] == null
            ? []
            : List<TopBrand>.from(
                json["top_brands"]!.map((x) => TopBrand.fromJson(x))),
        brandListing: json["brand_listing"] == null
            ? []
            : List<BrandListing>.from(
                json["brand_listing"]!.map((x) => BrandListing.fromJson(x))),
        topSellingProducts: json["top_selling_products"] == null
            ? []
            : List<Category>.from(
                json["top_selling_products"]!.map((x) => Category.fromJson(x))),
        featuredLaptop: json["featured_laptop"] == null
            ? []
            : List<BrandListing>.from(
                json["featured_laptop"]!.map((x) => BrandListing.fromJson(x))),
        upcomingLaptops: json["upcoming_laptops"] == null
            ? []
            : List<TopBrand>.from(
                json["upcoming_laptops"]!.map((x) => TopBrand.fromJson(x))),
        unboxedDeals: json["unboxed_deals"] == null
            ? []
            : List<BrandListing>.from(
                json["unboxed_deals"]!.map((x) => BrandListing.fromJson(x))),
        myBrowsingHistory: json["my_browsing_history"] == null
            ? []
            : List<BrandListing>.from(json["my_browsing_history"]!
                .map((x) => BrandListing.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "banner_one": bannerOne == null
            ? []
            : List<dynamic>.from(bannerOne!.map((x) => x.toJson())),
        "category": category == null
            ? []
            : List<dynamic>.from(category!.map((x) => x.toJson())),
        "products": products == null
            ? []
            : List<dynamic>.from(products!.map((x) => x.toJson())),
        "banner_two": bannerTwo == null
            ? []
            : List<dynamic>.from(bannerTwo!.map((x) => x.toJson())),
        "new_arrivals": newArrivals == null
            ? []
            : List<dynamic>.from(newArrivals!.map((x) => x.toJson())),
        "banner_three": bannerThree == null
            ? []
            : List<dynamic>.from(bannerThree!.map((x) => x.toJson())),
        "categories_listing": categoriesListing == null
            ? []
            : List<dynamic>.from(categoriesListing!.map((x) => x.toJson())),
        "top_brands": topBrands == null
            ? []
            : List<dynamic>.from(topBrands!.map((x) => x.toJson())),
        "brand_listing": brandListing == null
            ? []
            : List<dynamic>.from(brandListing!.map((x) => x.toJson())),
        "top_selling_products": topSellingProducts == null
            ? []
            : List<dynamic>.from(topSellingProducts!.map((x) => x.toJson())),
        "featured_laptop": featuredLaptop == null
            ? []
            : List<dynamic>.from(featuredLaptop!.map((x) => x.toJson())),
        "upcoming_laptops": upcomingLaptops == null
            ? []
            : List<dynamic>.from(upcomingLaptops!.map((x) => x.toJson())),
        "unboxed_deals": unboxedDeals == null
            ? []
            : List<dynamic>.from(unboxedDeals!.map((x) => x.toJson())),
        "my_browsing_history": myBrowsingHistory == null
            ? []
            : List<dynamic>.from(myBrowsingHistory!.map((x) => x.toJson())),
      };
}

class Banner {
  String? banner;

  Banner({
    this.banner,
  });

  factory Banner.fromJson(Map<String, dynamic> json) => Banner(
        banner: json["banner"],
      );

  Map<String, dynamic> toJson() => {
        "banner": banner,
      };
}

class BrandListing {
  String? icon;
  Offer? offer;
  String? brandIcon;
  String? label;
  String? price;

  BrandListing({
    this.icon,
    this.offer,
    this.brandIcon,
    this.label,
    this.price,
  });

  factory BrandListing.fromJson(Map<String, dynamic> json) => BrandListing(
        icon: json["icon"],
        offer: offerValues.map[json["offer"]]!,
        brandIcon: json["brandIcon"],
        label: json["label"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "icon": icon,
        "offer": offerValues.reverse[offer],
        "brandIcon": brandIcon,
        "label": label,
        "price": price,
      };
}

enum Offer { THE_14, THE_21, THE_32 }

final offerValues =
    EnumValues({"14%": Offer.THE_14, "21%": Offer.THE_21, "32%": Offer.THE_32});

class Category {
  String? label;
  String? icon;

  Category({
    this.label,
    this.icon,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        label: json["label"],
        icon: json["icon"],
      );

  Map<String, dynamic> toJson() => {
        "label": label,
        "icon": icon,
      };
}

class Product {
  String? icon;
  String? offer;
  String? label;
  String? subLabel;
  String? sublabel;

  Product({
    this.icon,
    this.offer,
    this.label,
    this.subLabel,
    this.sublabel,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        icon: json["icon"],
        offer: json["offer"],
        label: json["label"],
        subLabel: json["SubLabel"],
        sublabel: json["Sublabel"],
      );

  Map<String, dynamic> toJson() => {
        "icon": icon,
        "offer": offer,
        "label": label,
        "SubLabel": subLabel,
        "Sublabel": sublabel,
      };
}

class TopBrand {
  String? icon;

  TopBrand({
    this.icon,
  });

  factory TopBrand.fromJson(Map<String, dynamic> json) => TopBrand(
        icon: json["icon"],
      );

  Map<String, dynamic> toJson() => {
        "icon": icon,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
