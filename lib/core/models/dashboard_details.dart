// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

part 'dashboard_details.g.dart';

@JsonSerializable()
class DashboardDetails {
  @JsonKey(name: 'top_banner')
  List<TopBanner>? topBanner;
  @JsonKey(name: 'neu_coins')
  NeuCoins? neuCoins;
  @JsonKey(name: 'explore')
  List<Explore>? explore;
  @JsonKey(name: 'grocery_top_offers')
  Products? groceryTopOffers;
  @JsonKey(name: 'entertainment_stores')
  Products? entertainmentStores;
  @JsonKey(name: 'speciality_stores')
  Products? specialityStores;

  DashboardDetails(
      {this.topBanner,
      this.neuCoins,
      this.explore,
      this.groceryTopOffers,
      this.entertainmentStores,
      this.specialityStores});

  factory DashboardDetails.fromJson(Map<String, dynamic> json) =>
      _$DashboardDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$DashboardDetailsToJson(this);
}

@JsonSerializable()
class TopBanner {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'banner_url')
  String? bannerUrl;

  TopBanner({this.id, this.bannerUrl});

  factory TopBanner.fromJson(Map<String, dynamic> json) =>
      _$TopBannerFromJson(json);

  Map<String, dynamic> toJson() => _$TopBannerToJson(this);
}

@JsonSerializable()
class NeuCoins {
  @JsonKey(name: 'title')
  String? title;
  @JsonKey(name: 'value')
  int? value;
  @JsonKey(name: 'banner_url')
  String? bannerUrl;

  NeuCoins({this.title, this.value, this.bannerUrl});

  factory NeuCoins.fromJson(Map<String, dynamic> json) =>
      _$NeuCoinsFromJson(json);

  Map<String, dynamic> toJson() => _$NeuCoinsToJson(this);
}

@JsonSerializable()
class Explore {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'title')
  String? title;
  @JsonKey(name: 'color')
  String? color;
  @JsonKey(name: 'brand_logo_urls')
  List<String>? brandLogoUrls;
  @JsonKey(name: 'banner_url')
  String? bannerUrl;

  Explore({this.id, this.title, this.color, this.brandLogoUrls, this.bannerUrl});

  factory Explore.fromJson(Map<String, dynamic> json) =>
      _$ExploreFromJson(json);

  Map<String, dynamic> toJson() => _$ExploreToJson(this);
}

@JsonSerializable()
class Products {
  @JsonKey(name: 'title')
  String? title;
  @JsonKey(name: 'description')
  String? description;
  @JsonKey(name: 'items')
  List<ProductItem>? items;

  Products({this.title, this.description, this.items});

  factory Products.fromJson(Map<String, dynamic> json) =>
      _$ProductsFromJson(json);

  Map<String, dynamic> toJson() => _$ProductsToJson(this);
}

@JsonSerializable()
class ProductItem {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'title')
  String? title;
  @JsonKey(name: 'subtitle')
  String? subtitle;
  @JsonKey(name: 'offer')
  String? offer;
  @JsonKey(name: 'color')
  String? color;
  @JsonKey(name: 'logo_url')
  String? logoUrl;

  ProductItem(
      {this.id,
      this.title,
      this.subtitle,
      this.offer,
      this.color,
      this.logoUrl});

  factory ProductItem.fromJson(Map<String, dynamic> json) =>
      _$ProductItemFromJson(json);

  Map<String, dynamic> toJson() => _$ProductItemToJson(this);
}
