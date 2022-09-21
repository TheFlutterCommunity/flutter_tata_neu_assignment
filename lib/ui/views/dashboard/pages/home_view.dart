import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tata_neu_assignment/core/constants/app_colors.dart';
import 'package:flutter_tata_neu_assignment/core/constants/constants.dart';
import 'package:flutter_tata_neu_assignment/core/constants/font_family_constants.dart';
import 'package:flutter_tata_neu_assignment/core/constants/icon_constants.dart';
import 'package:flutter_tata_neu_assignment/core/di/locator.dart';
import 'package:flutter_tata_neu_assignment/core/enums/view_state.dart';
import 'package:flutter_tata_neu_assignment/core/localization/app_localizations.dart';
import 'package:flutter_tata_neu_assignment/core/models/dashboard_details.dart';
import 'package:flutter_tata_neu_assignment/core/view_models/dashboard/dashboard_view_model.dart';
import 'package:flutter_tata_neu_assignment/ui/views/base/base_view.dart';
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
      builder: (context, model, child) => model.state == ViewState.idle
          ? SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildAppBarSection(),
                  _buildSearchBarSection(),
                  _buildSliderCarouselIndicatorSection(model),
                  _buildPaymentOptionsSections(),
                  _buildNeuCoinsCardSection(),
                  _buildExploreTitleSection(),
                  _buildExploreGridCardSection(model),
                  _buildTopGroceryTitleSection(),
                  _buildTopGroceryGridCardSection(model),
                  _buildEnterTainmentStoreTitleSection(),
                  _buildEnterTainmentStoreGridCardSection(model),
                  _buildOurSpecialityStoresTitleSection(),
                  _buildOurSpecialityStoresGridCardSection(model),
                  _buildBottomTataNeuLogoSection()
                ],
              ),
            )
          : Container(),
    );
  }

  Widget _buildAppBarSection() {
    return Card(
      color: AppColor.black_1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
      elevation: 8,
      margin: EdgeInsets.only(
          top: ResponsiveWidget.paddingTop!, right: 0, left: 0, bottom: 2),
      child: Container(
        height: ResponsiveWidget.appBarHeight(),
        margin: const EdgeInsets.only(right: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: ResponsiveWidget.logoContainerHeight(),
              width: ResponsiveWidget.logoContainerHeight(),
              margin: EdgeInsets.only(
                left: ResponsiveWidget.logoContainerMarginLeft(),
              ),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColor.black,
              ),
              child: Container(
                padding: const EdgeInsets.all(11),
                child: Image.asset(
                  IconConstants.tataLogoIcon,
                ),
              ),
            ),
            SizedBox(width: ResponsiveWidget.payItemsSpace()),
            CustomText(
              text: appTitle,
              color: Colors.white.withOpacity(0.8),
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            const Spacer(),
            const Icon(
              Icons.notifications_active_sharp,
              size: 22,
              color: AppColor.white,
            ),
            SizedBox(width: ResponsiveWidget.bellIconSpace()),
            const Icon(Icons.menu_sharp, color: AppColor.white),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBarSection() {
    return Container(
      padding: const EdgeInsets.only(left: 12, right: 6),
      height: ResponsiveWidget.searchBarHeight(),
      width: MediaQuery.of(context).size.width,
      color: AppColor.black_1,
      child: Row(
        children: [
          Container(
            width: ResponsiveWidget.searchBarWidth(),
            padding: const EdgeInsets.only(
                left:10,
                bottom: 7,
                top: 7,
                right: 10),
            decoration: const BoxDecoration(
              color: AppColor.black,
              borderRadius: BorderRadius.all(
                Radius.circular(100.0),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.search,
                  color: AppColor.grey,
                  size: ResponsiveWidget.searchIconSize(),
                ),
                const SizedBox(width: 2),
                CustomText(
                  text: AppLocalizations.of(context).translate('search'),
                  color: Colors.grey,
                  fontSize: 16,
                  fontFamily: FontFamilyConstants.interRegular,
                  fontWeight: FontWeight.w400,
                ),
              ],
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                Icons.location_on_outlined,
                color: AppColor.grey,
                size: ResponsiveWidget.searchIconSize(),
              ),
              const SizedBox(width: 2),
              const CustomText(
                text: pinCode,
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: AppColor.white,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSliderCarouselIndicatorSection(DashboardViewModel model) {
    if (model.dashboardDetails == null ||
        model.dashboardDetails!.topBanner == null) {
      return Container(
        height: ResponsiveWidget.carouselCardHeight(),
        width: ResponsiveWidget.width,
        margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(10)),
      );
    }
    return Column(
      children: [
        Container(
          height: ResponsiveWidget.carouselCardHeight(),
          width: ResponsiveWidget.width,
          margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: PageView.builder(
              itemBuilder: (context, index) {
                return _buildPageItemSection(model.dashboardDetails!.topBanner![index]);
              },
              onPageChanged: (index) {
                locator<DashboardViewModel>().topBannerIndex = index;
              },
              itemCount: model.dashboardDetails!.topBanner!.length,
            ),
          ),
        ),
        CarouselIndicator(
          width: 30,
          height: 2,
          count: 10,
          activeColor: AppColor.white.withOpacity(0.6),
          index: locator<DashboardViewModel>().topBannerIndex,
          animationDuration: model.dashboardDetails != null &&
                  model.dashboardDetails!.topBanner != null
              ? model.dashboardDetails!.topBanner!.length
              : 0,
        ),
      ],
    );
  }

  Widget _buildPageItemSection(TopBanner banner) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: SizedBox(
          height: ResponsiveWidget.carouselCardHeight(),
          child: Image.network(
            banner.bannerUrl!,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _buildPaymentOptionsSections() {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 10),
      child: Row(
        children: [
          _buildPaymentItems(Icons.qr_code_scanner,
              AppLocalizations.of(context).translate('scan_pay')),
          const Spacer(),
          _buildPaymentItems(Icons.calculate_outlined,
              AppLocalizations.of(context).translate('send_money')),
          const Spacer(),
          _buildPaymentItems(Icons.account_tree_outlined,
              AppLocalizations.of(context).translate('pay_bills')),
          const Spacer(),
          _buildPaymentItems(
              Icons.balance, AppLocalizations.of(context).translate('finance')),
        ],
      ),
    );
  }

  Widget _buildNeuCoinsCardSection() {
    return Container(
      margin: const EdgeInsets.only(top: 10, left: 16, right: 16),
      height: ResponsiveWidget.neuCoinsCardHeight(),
      decoration: BoxDecoration(
          border: Border.all(
            color: AppColor.white,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(15))),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              padding: EdgeInsets.only(left: 15, top: 20),
              decoration: BoxDecoration(
                  color: AppColor.purple_18,
                  borderRadius: const BorderRadius.all(Radius.circular(15))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(style: TextStyle(fontSize: 12), children: [
                      TextSpan(text: "Neu"),
                      TextSpan(
                          text: "Coins",
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.bold)),
                      //TextSpan(text: "to add")
                    ]),
                  ),
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
                      CustomText(
                        text: ' O',
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 8,
            child: Container(
              decoration: BoxDecoration(
                  color: AppColor.pink_fe,
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(15),
                      bottomRight: Radius.circular(15))),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    bottomRight: Radius.circular(15)),
                child: Image.asset(
                  IconConstants.coinsIcon,
                  fit: BoxFit.fill,
                ),
                //https://d2xamzlzrdbdbn.cloudfront.net/BlogImages/072a2ddf-d4de-4364-8786-79b886de292f.jpg
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExploreTitleSection() {
    return Container(
      margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: CustomText(
        text: AppLocalizations.of(context).translate('explore'),
        color: Colors.white,
        fontSize: 16,
      ),
    );
  }

  Widget _buildExploreGridCardSection(DashboardViewModel model) {
    if (model.dashboardDetails == null ||
        model.dashboardDetails!.topBanner == null) {
      return Container(
        // height: ResponsiveWidget.carouselCardHeight(),
        // width: ResponsiveWidget.width,
        margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(10)),
      );
    }
    return Container(
      padding: const EdgeInsets.only(top: 10, left: 18, right: 18, bottom: 40),
      child: GridView.count(
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        crossAxisCount: 3,
        childAspectRatio: 4.10 / 3.0,
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        children: List.generate(model.dashboardDetails!.explore!.length, (index) {
            return _buildExploreItem(index,model.dashboardDetails!.explore!);
          },
        ),
      ),
    );
  }

  Widget _buildExploreItem(index, List<Explore> explore,) {
    return Card(
      elevation: 5,
      color: AppColor.green,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(top: 15, left: 10, bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: CustomText(
                    text:explore[index].title,
                    color: AppColor.white,
                    fontSize: 14,
                  ),
                ),
                Spacer(),
                Container(
                  height: 15,
                  width: 15,
                  alignment: Alignment.bottomLeft,
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
              ],
            ),
          ),
          Container(
            alignment: Alignment.bottomRight,
            child: Image.network(explore[index].bannerUrl!,
              height: 60,
              width: 60,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildPaymentItems(IconData icon, String label) {
    return Column(
      children: [
        Icon(
          icon,
          size: 40,
          color: AppColor.white,
        ),
        CustomText(
          text: label,
          color: AppColor.white,
        )
      ],
    );
  }

  Widget _buildTopGroceryTitleSection() {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                text: 'Top Offers on grocery',
                color: AppColor.white,
                fontSize: 16,
              ),
              Container(
                padding: EdgeInsets.only(top: 5),
                child: Column(
                  children: [
                    CustomText(
                      text: 'View more',
                      color: AppColor.white,
                      fontSize: 16,
                    ),
                    Container(
                      height: 2,
                      width: 70,
                      color: AppColor.white,
                    )
                  ],
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(top: 5),
            child: CustomText(
              text: '+Assured 5% NeuCoins | Free delivery',
              color: AppColor.grey,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopGroceryGridCardSection(DashboardViewModel model) {
    return Container(
      padding: const EdgeInsets.only(top: 10, left: 18, right: 18, bottom: 40),
      child: GridView.count(
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        crossAxisCount: 2,
        childAspectRatio: 1.60 / 2.0,
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        children: List.generate(
            model.dashboardDetails!.groceryTopOffers!.items!.length,
          (index) {
            return _buildTopOfferItem(index,model.dashboardDetails!.groceryTopOffers!.items!);
          },
        ),
      ),
    );
  }

  Widget _buildTopOfferItem(int index, List<ProductItem> list,) {
    return Container(
        child: Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      decoration: BoxDecoration(
        color: AppColor.orange_fb,
        borderRadius: BorderRadius.all(Radius.circular(8)),
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp,
          colors: [
            AppColor.light_red,
            AppColor.dark_red,
          ],
        ),
      ),
      child: Stack(
        children: [
          Container(
            height: 120,
            decoration: BoxDecoration(
                color: AppColor.orange_fb,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50))),
          ),
          Container(
              margin: EdgeInsets.only(top: 20),
              child: Image.network(list[index].logoUrl!)),
          Positioned(
            left: 20,
            right: 20,
            top: 140,
            bottom: 0,
            child: CustomText(
              text: list[index].title,
              color: AppColor.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Positioned(
            top: 160,
            left: 50,
            child: Container(
              alignment: Alignment.center,
              height: 2,
              width: 50,
              color: AppColor.white,
            ),
          ),
          Positioned(
            left: 20,
            right: 0,
            top: 195,
            bottom: 0,
            child: CustomText(
              text: list[index].subtitle,
              color: AppColor.white,
              fontSize: 18,
            ),
          )
        ],
      ),
    ));
  }

  Widget _buildEnterTainmentStoreTitleSection() {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: CustomText(
              text: 'Entertainment store - TV & Audio device',
              color: AppColor.white,
              fontSize: ResponsiveWidget.entertainmentTitleFontSize(),
            ),
          ),
          //SizedBox(width: 50,),
          Icon(
            Icons.arrow_forward_ios,
            color: AppColor.white,
          )
        ],
      ),
    );
  }

  Widget _buildEnterTainmentStoreGridCardSection(DashboardViewModel model) {
    return Container(
      padding: const EdgeInsets.only(top: 10, left: 18, right: 18, bottom: 40),
      child: GridView.count(
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        crossAxisCount: 2,
        childAspectRatio: 1.50 / 2.0,
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        children: List.generate(
          model.dashboardDetails!.entertainmentStores!.items!.length,
          (index) {
            return _buildEnterTainmentStoreItems(index,model.dashboardDetails!.entertainmentStores!.items!);
          },
        ),
      ),
    );
  }

  Widget _buildEnterTainmentStoreItems(int index, List<ProductItem> list,) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Column(
        children: [
          Expanded(
              flex: 6,
              child: Stack(
                children: [
                  Container(
                    //color: AppColor.blueVariant,
                    decoration: BoxDecoration(
                      color: AppColor.blueVariant,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(8),
                      topRight:Radius.circular(8)),
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      child: Image.network(
                        list[index].logoUrl!,
                        height: 100,
                        width: 100,
                      ),
                    ),
                  ),
                  Positioned(
                    //left: 0,
                    right: 0,
                    child: Container(
                      alignment: Alignment.topRight,
                      height: 60,
                      width: 80,
                      decoration: BoxDecoration(
                          color: AppColor.white,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(60),
                              bottomRight: Radius.circular(55))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          /*Container(
                            padding: EdgeInsets.only(left: 15, top: 10),
                            // alignment: Alignment.center,
                            child: CustomText(
                              text: '+5%',
                              fontSize: 22,
                              color: AppColor.dark_red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),*/
                          Container(
                            alignment: Alignment.center,
                            child: CustomText(
                              text: list[index].offer,
                              fontSize: ResponsiveWidget.entertainmentCardOfferTitleFontSize(),
                              color: AppColor.dark_red,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              )),
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColor.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8)),
              ),
              child: Container(
                //  alignment: Alignment.center,
                child: CustomText(
                  text: list[index].title,
                  fontSize: ResponsiveWidget.entertainmentCardTitleFontSize(),
                  color: AppColor.dark_red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOurSpecialityStoresTitleSection() {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: CustomText(
        text: 'Our speciality stores',
        color: AppColor.white,
        fontSize: 18,
      ),
    );
  }

  Widget _buildOurSpecialityStoresGridCardSection(DashboardViewModel model) {
    return Container(
      padding: const EdgeInsets.only(top: 40, left: 18, right: 18, bottom: 40),
      //margin: const EdgeInsets.only(top: 40,),
      child: GridView.count(
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        crossAxisCount: 2,
        childAspectRatio: ResponsiveWidget.ourSpecialityStoresAspectRatioSize()/ 2.0,
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        children: List.generate(
          model.dashboardDetails!.specialityStores!.items!.length,
          (index) {
            return _buildOurSpecialityStoresGridItemsSection(index,model.dashboardDetails!.specialityStores!.items!);
          },
        ),
      ),
    );
  }

  Widget _buildOurSpecialityStoresGridItemsSection(int index, List<ProductItem> list) {
    return
        /*Container(
      width: 230,

      //margin: EdgeInsets.only(right: 16),
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      color: AppColor.white,
      child: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 25),
            child: _buildBackground(index, 230),
          ),
          Positioned(
            bottom: 80,
            right: 10,
            //top: 10,
            left: 0,
            child: Container(
             // tag: "${IconConstants.earbudsIcon}",
              //tag: "hero${shoeList[index].imgPath}",
              child: Transform.rotate(
                angle: -math.pi / 7,
                child: Image(
                  width: 220,
                  image: AssetImage(IconConstants.earbudsIcon),
                ),
              ),
            ),
          ),
        ],
      ),
    );*/
        Stack(
          children: [
            Container(
              //height:250 ,
              margin: EdgeInsets.only(top: 60, left: 10, right: 10, bottom: 10),
              //padding: EdgeInsets.only(top: 40),
              decoration: BoxDecoration(
                //color: AppColor.lightPink,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(80),
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8)),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  // stops: [0.0, 1.0],
                  // tileMode: TileMode.clamp,
                  colors: [
                    AppColor.light_blue,
                    AppColor.green_02,
                  ],
                ),
              ),
              child: Container(
                alignment: Alignment.bottomCenter,
               // padding: EdgeInsets.only(bottom: 20),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomText(
                        text:list[index].title,
                        color: AppColor.white,
                        fontSize: 16),
                    CustomText(
                      text: list[index].offer,
                      color: AppColor.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    )
                  ],
                ),
              ),
            ),
            Container(
              width: 230,

              //margin: EdgeInsets.only(right: 16),
              margin: EdgeInsets.only(left: 5, right: 5, bottom: 10),
              //color: AppColor.white,
              child: Stack(
                children: <Widget>[
                  // Padding(
                  //   padding: EdgeInsets.only(top: 25),
                  //   child: _buildBackground(index, 230),
                  // ),
                  Positioned(
                    bottom: 80,
                    right: 10,
                    //top: 10,
                    left: 0,
                    child: Container(
                      padding: EdgeInsets.only(bottom: 10),
                      // tag: "${IconConstants.earbudsIcon}",
                      //tag: "hero${shoeList[index].imgPath}",
                      child: Transform.rotate(
                        angle: -math.pi / 100,
                        child: Image(
                          width: 220,
                          image: AssetImage(IconConstants.earbudsIcon),
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

  Widget _buildBackground(int index, double width) {
    return ClipPath(
      // clipper: AppClipper(cornerSize: 25, diagonalHeight: 100),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        width: width,
        decoration: BoxDecoration(
          color: AppColor.orange_fb,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(80),
              bottomLeft: Radius.circular(8),
              bottomRight: Radius.circular(8)),
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp,
            colors: [
              AppColor.light_red,
              AppColor.dark_red,
            ],
          ),
        ),
        child: Stack(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(child: SizedBox()),
                  Container(
                    width: 125,
                    child: Text(
                      "SmartPhones\n Under",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "₹ 19,999",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomTataNeuLogoSection() {
    return Container(
      height: 250,
      color: AppColor.dark_purple,
      padding: EdgeInsets.only(bottom: 30),
      child: Center(
          child: Column(
        // crossAxisAlignment:CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            //color: AppColor.white,
            child: Image.asset(
              IconConstants.tataNeuBottomIcon,
              height: 120,
              width: 180,
            ),
          ),
          CustomText(
            text: 'Live The New',
            color: AppColor.light_purple,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          )
        ],
      )),
    );
  }
}
