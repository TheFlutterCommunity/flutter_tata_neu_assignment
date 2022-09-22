import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_tata_neu_assignment/core/constants/app_colors.dart';
import 'package:flutter_tata_neu_assignment/core/constants/font_family_constants.dart';
import 'package:flutter_tata_neu_assignment/core/constants/icon_constants.dart';
import 'package:flutter_tata_neu_assignment/core/enums/view_state.dart';
import 'package:flutter_tata_neu_assignment/core/localization/app_localizations.dart';
import 'package:flutter_tata_neu_assignment/core/models/dashboard_details.dart';
import 'package:flutter_tata_neu_assignment/core/view_models/dashboard/dashboard_view_model.dart';
import 'package:flutter_tata_neu_assignment/ui/views/base/base_view.dart';
import 'package:flutter_tata_neu_assignment/ui/widgets/custom_app_bar.dart';
import 'package:flutter_tata_neu_assignment/ui/widgets/custom_carousel_slider.dart';
import 'package:flutter_tata_neu_assignment/ui/widgets/custom_search_bar.dart';
import 'package:flutter_tata_neu_assignment/ui/widgets/helper_widgets.dart';
import 'package:flutter_tata_neu_assignment/ui/widgets/responsive_ui.dart';
import 'package:flutter_tata_neu_assignment/ui/widgets/custom_text.dart';
import 'dart:math' as math;

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return BaseView<DashboardViewModel>(
        onModelReady: (model) {},
        builder: (context, model, child) {
          if (model.state == ViewState.idle) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomAppBar(),
                  const CustomSearchBar(),
                  CustomCarouselSlider(model: model),
                  Container(
                    padding: const EdgeInsets.only(left: 18, right: 18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildPaymentOptionsSections(),
                        _buildNeuCoinsCardSection(model),
                        _buildExploreTitleSection(),
                        _buildExploreGridCardSection(model),
                        _buildTopGroceryTitleSection(model),
                        _buildTopGroceryGridCardSection(model),
                        _buildEntertainmentStoreTitleSection(model),
                        _buildEntertainmentStoreGridCardSection(model),
                        _buildOurSpecialityStoresTitleSection(model),
                        _buildOurSpecialityStoresGridCardSection(model),
                      ],
                    ),
                  ),
                  _buildBottomTataNeuLogoSection()
                ],
              ),
            );
          } else if (model.state == ViewState.busy) {
            return HelperWidgets.buildLoaderWidget();
          } else if (model.state == ViewState.error) {
            return HelperWidgets.buildErrorWidget(model.error!);
          }
          return Container();
        });
  }

  Widget _buildPaymentOptionsSections() {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(top: 40, bottom: 10),
      child: Row(
        children: [
          _buildPaymentItems(IconConstants.scanPayIcon,
              AppLocalizations.of(context).translate('scan_pay')),
          const Spacer(),
          _buildPaymentItems(IconConstants.sendMoneyIcon,
              AppLocalizations.of(context).translate('send_money')),
          const Spacer(),
          _buildPaymentItems(IconConstants.payBillsIcon,
              AppLocalizations.of(context).translate('pay_bills')),
          const Spacer(),
          _buildPaymentItems(IconConstants.financeIcon,
              AppLocalizations.of(context).translate('finance')),
        ],
      ),
    );
  }

  Widget _buildPaymentItems(String icon, String label) {
    return Column(
      children: [
        Image.asset(
          icon,
          color: AppColor.white,
          width: 40,
          height: 40,
        ),
        const SizedBox(height: 4),
        CustomText(
          text: label,
          color: AppColor.white,
          fontSize: 12,
        )
      ],
    );
  }

  Widget _buildNeuCoinsCardSection(DashboardViewModel model) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      height: ResponsiveWidget.neuCoinsCardHeight(),
      decoration: BoxDecoration(
          border: Border.all(
            color: AppColor.white,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(15))),
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: Container(
              padding: const EdgeInsets.only(
                left: 15,
              ),
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                  color: AppColor.purple_18,
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w900,
                            fontFamily: FontFamilyConstants.interMedium),
                        children: [
                          TextSpan(
                            text: model.dashboardDetails != null &&
                                    model.dashboardDetails!.neuCoins != null &&
                                    model.dashboardDetails!.neuCoins!.value !=
                                        null
                                ? model.dashboardDetails!.neuCoins!.title!
                                    .split('#')[0]
                                : '',
                          ),
                          TextSpan(
                              text: model.dashboardDetails != null &&
                                      model.dashboardDetails!.neuCoins !=
                                          null &&
                                      model.dashboardDetails!.neuCoins!.value !=
                                          null
                                  ? model.dashboardDetails!.neuCoins!.title!
                                      .split('#')[1]
                                  : '',
                              style: const TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold)),
                        ]),
                  ),
                  const SizedBox(height: 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 15,
                        width: 15,
                        alignment: Alignment.centerLeft,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColor.white,
                        ),
                        child: Container(
                          padding: const EdgeInsets.all(3),
                          child: Image.asset(
                            IconConstants.tataLogoIcon,
                          ),
                        ),
                      ),
                      const SizedBox(width: 4),
                      CustomText(
                        text: model.dashboardDetails != null &&
                                model.dashboardDetails!.neuCoins != null &&
                                model.dashboardDetails!.neuCoins!.value != null
                            ? '${model.dashboardDetails!.neuCoins!.value!}'
                            : '0',
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: FontFamilyConstants.interMedium,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 11,
            child: Container(
              decoration: const BoxDecoration(
                  color: AppColor.pink_1,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15),
                      bottomRight: Radius.circular(15))),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(15),
                    bottomRight: Radius.circular(15)),
                child: Image.network(
                  model.dashboardDetails != null &&
                          model.dashboardDetails!.neuCoins != null &&
                          model.dashboardDetails!.neuCoins!.bannerUrl != null
                      ? model.dashboardDetails!.neuCoins!.bannerUrl!
                      : '',
                  fit: BoxFit.contain,
                  height: ResponsiveWidget.neuCoinsCardHeight(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExploreTitleSection() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: CustomText(
        text: AppLocalizations.of(context).translate('explore'),
        color: AppColor.white,
        fontWeight: FontWeight.w400,
        fontSize: 19,
      ),
    );
  }

  Widget _buildExploreGridCardSection(DashboardViewModel model) {
    return Container(
      padding: const EdgeInsets.only(top: 10, bottom: 40),
      child: GridView.count(
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        crossAxisCount: 3,
        childAspectRatio: 4.10 / 3.0,
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        children: List.generate(
          model.dashboardDetails != null &&
                  model.dashboardDetails!.explore != null
              ? model.dashboardDetails!.explore!.length
              : 0,
          (index) {
            return _buildExploreItem(
                index, model.dashboardDetails!.explore![index]);
          },
        ),
      ),
    );
  }

  Widget _buildExploreItem(index, Explore explore) {
    return Container(
      margin: const EdgeInsets.only(left: 6, right: 6, bottom: 12),
      padding: const EdgeInsets.only(top: 12, left: 6, right: 6, bottom: 6),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          image: DecorationImage(
              image: NetworkImage(
                explore.bannerUrl!,
              ),
              fit: BoxFit.cover)),
      child: CustomText(
        text: explore.title ?? '',
        color: AppColor.white,
        fontWeight: FontWeight.w600,
        fontFamily: FontFamilyConstants.interMedium,
        fontSize: 13,
      ),
    );
  }

  Widget _buildTopGroceryTitleSection(DashboardViewModel model) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              text: model.dashboardDetails != null &&
                      model.dashboardDetails!.groceryTopOffers != null &&
                      model.dashboardDetails!.groceryTopOffers!.title != null
                  ? model.dashboardDetails!.groceryTopOffers!.title
                  : '',
              color: AppColor.white,
              fontWeight: FontWeight.w400,
              fontSize: 19,
            ),
            Container(
              padding: const EdgeInsets.only(top: 5),
              child: Column(
                children: [
                  CustomText(
                    text: AppLocalizations.of(context).translate('view_more'),
                    color: AppColor.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                  Container(
                    height: 2,
                    width: 60,
                    color: AppColor.white,
                  )
                ],
              ),
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.only(top: 5),
          child: CustomText(
            text: model.dashboardDetails != null &&
                    model.dashboardDetails!.groceryTopOffers != null &&
                    model.dashboardDetails!.groceryTopOffers!.description !=
                        null
                ? model.dashboardDetails!.groceryTopOffers!.description
                : '',
            color: AppColor.white.withOpacity(0.7),
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
        ),
      ],
    );
  }

  Widget _buildTopGroceryGridCardSection(DashboardViewModel model) {
    return Container(
      padding: const EdgeInsets.only(top: 10, bottom: 40),
      child: GridView.count(
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        crossAxisCount: 2,
        childAspectRatio: 1.60 / 2.0,
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        children: List.generate(
          model.dashboardDetails != null &&
                  model.dashboardDetails!.groceryTopOffers != null &&
                  model.dashboardDetails!.groceryTopOffers!.items != null
              ? model.dashboardDetails!.groceryTopOffers!.items!.length
              : 0,
          (index) {
            return _buildTopOfferItem(
                index, model.dashboardDetails!.groceryTopOffers!.items![index]);
          },
        ),
      ),
    );
  }

  Widget _buildTopOfferItem(int index, ProductItem item) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      decoration: const BoxDecoration(
        color: AppColor.orange_2,
        borderRadius: BorderRadius.all(Radius.circular(8)),
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp,
          colors: [
            AppColor.lightRed,
            AppColor.darkRed,
          ],
        ),
      ),
      child: Stack(
        children: [
          Container(
            height: 110,
            decoration: const BoxDecoration(
                color: AppColor.orange_2,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50))),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20),
            child: Image.network(
              item.logoUrl!,
              fit: BoxFit.cover,
              height: 260,
              width: 260,
            ),
          ),
          Positioned(
            left: 20,
            right: 20,
            top: Platform.isIOS ? 150 : 140,
            bottom: 0,
            child: Column(
              children: [
                CustomText(
                  text: item.offer ?? '',
                  color: AppColor.white,
                  fontSize: Platform.isIOS ? 18 : 24,
                  fontFamily: FontFamilyConstants.interMedium,
                  fontWeight: FontWeight.w600,
                ),
                Container(
                  alignment: Alignment.center,
                  height: 2,
                  width: 38,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColor.white,
                  ),
                  margin: const EdgeInsets.only(top: 4, bottom: 4),
                ),
                item.title != null && item.title!.contains('#')
                    ? RichText(
                        text: TextSpan(
                            style: const TextStyle(fontSize: 12),
                            children: [
                              TextSpan(
                                  text: item.title!.split('#')[0],
                                  style: const TextStyle(
                                      color: AppColor.orange_1,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600)),
                              TextSpan(
                                text: item.title!.split('#')[1],
                              ),
                            ]),
                        textAlign: TextAlign.center,
                      )
                    : CustomText(
                        text: item.title ?? '',
                        testAlignment: TextAlign.center,
                        color: AppColor.white,
                        fontWeight: FontWeight.w500,
                        fontFamily: FontFamilyConstants.interMedium,
                        fontSize: 14,
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEntertainmentStoreTitleSection(DashboardViewModel model) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 9,
          child: CustomText(
            text: model.dashboardDetails != null &&
                    model.dashboardDetails!.entertainmentStores != null &&
                    model.dashboardDetails!.entertainmentStores!.title != null
                ? model.dashboardDetails!.entertainmentStores!.title
                : '',
            color: AppColor.white,
            fontWeight: FontWeight.w400,
            fontSize: 19,
          ),
        ),
        const Expanded(
          flex: 1,
          child: Icon(
            Icons.arrow_forward_ios,
            color: AppColor.white,
            size: 18,
          ),
        )
      ],
    );
  }

  Widget _buildEntertainmentStoreGridCardSection(DashboardViewModel model) {
    return Container(
      padding: const EdgeInsets.only(top: 10, bottom: 40),
      child: GridView.count(
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        crossAxisCount: 2,
        childAspectRatio: 1.50 / 2.0,
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        children: List.generate(
          model.dashboardDetails != null &&
                  model.dashboardDetails!.entertainmentStores != null &&
                  model.dashboardDetails!.entertainmentStores!.items != null
              ? model.dashboardDetails!.entertainmentStores!.items!.length
              : 0,
          (index) {
            return _buildEntertainmentStoreItems(index,
                model.dashboardDetails!.entertainmentStores!.items![index]);
          },
        ),
      ),
    );
  }

  Widget _buildEntertainmentStoreItems(int index, ProductItem item) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Column(
        children: [
          Expanded(
              flex: 6,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: item.color != null && item.color!.isNotEmpty
                          ? Color(int.parse(item.color!))
                          : Colors.redAccent,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8)),
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      child: Image.network(
                        item.logoUrl!,
                        height: 100,
                        width: 120,
                      ),
                    ),
                  ),
                  Positioned(
                    right: -6,
                    child: Container(
                      height: 48,
                      width: 72,
                      decoration: BoxDecoration(
                          color: item.color != null && item.color!.isNotEmpty
                              ? Color(int.parse(item.color!)).withGreen(160)
                              : Colors.white,
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(60),
                              bottomRight: Radius.circular(55))),
                      child: Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(bottom: 10),
                        child: RichText(
                            text: TextSpan(
                                style: const TextStyle(
                                    color: AppColor.bgColor3, fontSize: 9),
                                children: [
                              TextSpan(
                                text: '${item.offer!.split('%')[0]}%',
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w800),
                              ),
                              TextSpan(
                                text: item.offer!.split('%')[1],
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600),
                              ),
                            ])),
                      ),
                    ),
                  )
                ],
              )),
          Expanded(
            flex: 2,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: AppColor.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8)),
              ),
              child: CustomText(
                text: item.title ?? '',
                fontSize: Platform.isIOS ? 12 : 14,
                color: AppColor.blackColor.withOpacity(0.9),
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOurSpecialityStoresTitleSection(DashboardViewModel model) {
    return CustomText(
      text: model.dashboardDetails != null &&
              model.dashboardDetails!.specialityStores != null &&
              model.dashboardDetails!.specialityStores!.title != null
          ? model.dashboardDetails!.specialityStores!.title
          : '',
      color: AppColor.white,
      fontWeight: FontWeight.w400,
      fontSize: 19,
    );
  }

  Widget _buildOurSpecialityStoresGridCardSection(DashboardViewModel model) {
    if (model.dashboardDetails == null ||
        model.dashboardDetails!.specialityStores == null ||
        model.dashboardDetails!.specialityStores!.items == null) {
      return Container();
    }

    return Container(
      padding: const EdgeInsets.only(top: 20, bottom: 40),
      child: GridView.count(
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        crossAxisCount: 2,
        childAspectRatio:
            ResponsiveWidget.ourSpecialityStoresAspectRatioSize() / 2.0,
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        children: List.generate(
          model.dashboardDetails!.specialityStores!.items!.length,
          (index) {
            return _buildOurSpecialityStoresGridItemsSection(
                index, model.dashboardDetails!.specialityStores!.items![index]);
          },
        ),
      ),
    );
  }

  Widget _buildOurSpecialityStoresGridItemsSection(
      int index, ProductItem item) {
    return Stack(
      children: [
        Container(
          margin:
              const EdgeInsets.only(top: 70, left: 10, right: 10, bottom: 10),
          decoration: BoxDecoration(
            color: item.color != null && item.color!.isNotEmpty
                ? Color(int.parse(item.color!))
                : Colors.redAccent,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(80),
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8)),
          ),
          child: Container(
            alignment: Alignment.bottomCenter,
            padding: const EdgeInsets.only(left: 20, bottom: 12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                item.title!.isNotEmpty
                    ? CustomText(
                        text: item.title,
                        color: AppColor.white,
                        testAlignment: TextAlign.start,
                        fontFamily: FontFamilyConstants.interMedium,
                        fontWeight: FontWeight.w700,
                        fontSize: Platform.isIOS ? 16 : 20,
                      )
                    : Container(),
                item.subtitle!.isNotEmpty
                    ? CustomText(
                        text: item.subtitle,
                        color: AppColor.white,
                        testAlignment: TextAlign.start,
                        fontFamily: FontFamilyConstants.interMedium,
                        fontWeight: FontWeight.w700,
                        fontSize: Platform.isIOS ? 20 : 24,
                      )
                    : Container(),
                item.offer!.isNotEmpty
                    ? CustomText(
                        text: item.offer,
                        color: AppColor.white,
                        testAlignment: TextAlign.start,
                        fontFamily: FontFamilyConstants.interMedium,
                        fontWeight: FontWeight.w500,
                        fontSize: Platform.isIOS ? 16 : 22,
                      )
                    : Container()
              ],
            ),
          ),
        ),
        Container(
          width: 230,
          margin: const EdgeInsets.only(left: 5, right: 5, bottom: 10),
          child: Stack(
            children: <Widget>[
              Positioned(
                bottom: 75,
                right: 10,
                left: 0,
                child: Container(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Transform.rotate(
                    angle: -math.pi / 100,
                    child: Image(
                      width: 210,
                      height: 130,
                      image: NetworkImage(item.logoUrl!),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildBottomTataNeuLogoSection() {
    return Container(
      height: 250,
      color: AppColor.darkPurple,
      padding: const EdgeInsets.only(bottom: 30),
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            IconConstants.tataNeuBottomIcon,
            height: 120,
            width: 180,
          ),
          CustomText(
            text: AppLocalizations.of(context).translate('live_the_neu'),
            color: AppColor.lightPurple,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          )
        ],
      )),
    );
  }
}
