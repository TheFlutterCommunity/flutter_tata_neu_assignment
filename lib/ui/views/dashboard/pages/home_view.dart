import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tata_neu_assignment/core/constants/app_colors.dart';
import 'package:flutter_tata_neu_assignment/core/constants/constants.dart';
import 'package:flutter_tata_neu_assignment/core/constants/font_family_constants.dart';
import 'package:flutter_tata_neu_assignment/core/constants/icon_constants.dart';
import 'package:flutter_tata_neu_assignment/core/di/locator.dart';
import 'package:flutter_tata_neu_assignment/core/localization/app_localizations.dart';
import 'package:flutter_tata_neu_assignment/core/view_models/dashboard/dashboard_view_model.dart';
import 'package:flutter_tata_neu_assignment/ui/widgets/responsive_ui.dart';
import 'package:flutter_tata_neu_assignment/ui/widgets/custom_text.dart';

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
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildAppBarSection(),
          _buildSearchBarSection(),
          _buildSliderCarouselIndicatorSection(),
          _buildPaymentOptionsSections(),
          _buildNeuCoinsCardSection(),
          _buildExploreTitle(),
          _buildExploreGridCard()
        ],
      ),
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
            padding:
                const EdgeInsets.only(left: 10, bottom: 7, top: 7, right: 10),
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

  Widget _buildSliderCarouselIndicatorSection() {
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
                return _buildPageItem(index);
              },
              onPageChanged: (index) {
                locator<DashboardViewModel>().topBannerIndex = index;
              },
              itemCount: 10,
            ),
          ),
        ),
        CarouselIndicator(
          width: 30,
          height: 2,
          count: 10,
          activeColor: AppColor.white.withOpacity(0.6),
          index: locator<DashboardViewModel>().topBannerIndex,
          animationDuration: 10,
        ),
      ],
    );
  }

  Widget _buildPageItem(index) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: SizedBox(
        height: ResponsiveWidget.carouselCardHeight(),
        child: Image.network(
          'https://i.ytimg.com/vi/Z82qj9ObId4/maxresdefault.jpg',
          fit: BoxFit.cover,
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
    );
  }

  Widget _buildExploreTitle() {
    return Container(
      margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: CustomText(
        text: AppLocalizations.of(context).translate('explore'),
        color: Colors.white,
        fontSize: 16,
      ),
    );
  }

  Widget _buildExploreGridCard() {
    return Container(
      padding: const EdgeInsets.only(top: 10, left: 18, right: 18, bottom: 90),
      child: GridView.count(
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        crossAxisCount: 3,
        childAspectRatio: 4.10 / 3.0,
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        children: List.generate(
          9,
          (index) {
            return _buildExploreItem(index);
          },
        ),
      ),
    );
  }

  Widget _buildExploreItem(index) {
    return const Card(
      elevation: 5,
      color: AppColor.black_1C,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8))),
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
}
