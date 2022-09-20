// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DashboardDetails _$DashboardDetailsFromJson(Map<String, dynamic> json) =>
    DashboardDetails(
      topBanner: (json['top_banner'] as List<dynamic>?)
          ?.map((e) => TopBanner.fromJson(e as Map<String, dynamic>))
          .toList(),
      neuCoins: json['neu_coins'] == null
          ? null
          : NeuCoins.fromJson(json['neu_coins'] as Map<String, dynamic>),
      explore: (json['explore'] as List<dynamic>?)
          ?.map((e) => Explore.fromJson(e as Map<String, dynamic>))
          .toList(),
      groceryTopOffers: json['grocery_top_offers'] == null
          ? null
          : Products.fromJson(
              json['grocery_top_offers'] as Map<String, dynamic>),
      entertainmentStores: json['entertainment_stores'] == null
          ? null
          : Products.fromJson(
              json['entertainment_stores'] as Map<String, dynamic>),
      specialityStores: json['speciality_stores'] == null
          ? null
          : Products.fromJson(
              json['speciality_stores'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DashboardDetailsToJson(DashboardDetails instance) =>
    <String, dynamic>{
      'top_banner': instance.topBanner,
      'neu_coins': instance.neuCoins,
      'explore': instance.explore,
      'grocery_top_offers': instance.groceryTopOffers,
      'entertainment_stores': instance.entertainmentStores,
      'speciality_stores': instance.specialityStores,
    };

TopBanner _$TopBannerFromJson(Map<String, dynamic> json) => TopBanner(
      id: json['id'] as int?,
      bannerUrl: json['banner_url'] as String?,
    );

Map<String, dynamic> _$TopBannerToJson(TopBanner instance) => <String, dynamic>{
      'id': instance.id,
      'banner_url': instance.bannerUrl,
    };

NeuCoins _$NeuCoinsFromJson(Map<String, dynamic> json) => NeuCoins(
      title: json['title'] as String?,
      value: json['value'] as int?,
      bannerUrl: json['banner_url'] as String?,
    );

Map<String, dynamic> _$NeuCoinsToJson(NeuCoins instance) => <String, dynamic>{
      'title': instance.title,
      'value': instance.value,
      'banner_url': instance.bannerUrl,
    };

Explore _$ExploreFromJson(Map<String, dynamic> json) => Explore(
      id: json['id'] as int?,
      title: json['title'] as String?,
      color: json['color'] as String?,
      brandLogoUrls: (json['brand_logo_urls'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      bannerUrl: json['banner_url'] as String?,
    );

Map<String, dynamic> _$ExploreToJson(Explore instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'color': instance.color,
      'brand_logo_urls': instance.brandLogoUrls,
      'banner_url': instance.bannerUrl,
    };

Products _$ProductsFromJson(Map<String, dynamic> json) => Products(
      title: json['title'] as String?,
      description: json['description'] as String?,
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => ProductItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductsToJson(Products instance) => <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'items': instance.items,
    };

ProductItem _$ProductItemFromJson(Map<String, dynamic> json) => ProductItem(
      id: json['id'] as int?,
      title: json['title'] as String?,
      subtitle: json['subtitle'] as String?,
      offer: json['offer'] as String?,
      color: json['color'] as String?,
      logoUrl: json['logo_url'] as String?,
    );

Map<String, dynamic> _$ProductItemToJson(ProductItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'subtitle': instance.subtitle,
      'offer': instance.offer,
      'color': instance.color,
      'logo_url': instance.logoUrl,
    };
