import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tata_neu_assignment/core/constants/app_colors.dart';
import 'package:flutter_tata_neu_assignment/core/di/locator.dart';
import 'package:flutter_tata_neu_assignment/core/models/dashboard_details.dart';
import 'package:flutter_tata_neu_assignment/core/view_models/dashboard/dashboard_view_model.dart';
import 'package:flutter_tata_neu_assignment/ui/widgets/responsive_ui.dart';

class CustomCarouselSlider extends StatelessWidget {
  final DashboardViewModel? model;

  const CustomCarouselSlider({this.model, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (model!.dashboardDetails == null ||
        model!.dashboardDetails!.topBanner == null) {
      return _buildEmptyBannerForCarousel();
    }
    return Column(
      children: [
        Container(
          height: ResponsiveWidget.carouselCardHeight(),
          width: ResponsiveWidget.width,
          margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: CarouselSlider.builder(
              itemBuilder: (context, index, idx) {
                return _buildPageItemSection(
                    model!.dashboardDetails!.topBanner![index]);
              },
              options: CarouselOptions(
                viewportFraction: 1,
                autoPlay: true,
              ),
              itemCount: model!.dashboardDetails!.topBanner!.length,
            ),
          ),
        ),
        _buildCarouselIndicator(),
      ],
    );
  }

  Widget _buildEmptyBannerForCarousel() {
    return Container(
      height: ResponsiveWidget.carouselCardHeight(),
      width: ResponsiveWidget.width,
      margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.2),
          borderRadius: BorderRadius.circular(10)),
    );
  }

  Widget _buildPageItemSection(TopBanner banner) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: SizedBox(
          height: ResponsiveWidget.carouselCardHeight(),
          child: Image.network(
            banner.bannerUrl!,
            fit: BoxFit.fill,
            height: ResponsiveWidget.carouselCardHeight(),
          ),
        ),
      ),
    );
  }

  Widget _buildCarouselIndicator() {
    return CarouselIndicator(
      width: 30,
      height: 2,
      count: model!.dashboardDetails!.topBanner!.length,
      activeColor: AppColor.white.withOpacity(0.6),
      index: locator<DashboardViewModel>().topBannerIndex,
      animationDuration: 10,
    );
  }
}
