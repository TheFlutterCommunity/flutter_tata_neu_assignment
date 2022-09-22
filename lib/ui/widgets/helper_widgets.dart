import 'package:flutter/material.dart';
import 'package:flutter_tata_neu_assignment/core/constants/app_colors.dart';
import 'package:flutter_tata_neu_assignment/core/constants/icon_constants.dart';
import 'package:flutter_tata_neu_assignment/ui/widgets/custom_text.dart';
import 'package:flutter_tata_neu_assignment/ui/widgets/responsive_ui.dart';

class HelperWidgets {
  static Widget buildAppBarIcon() {
    return Container(
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
    );
  }

  static Widget buildLoaderWidget() {
    return const Center(child: CircularProgressIndicator());
  }

  static Widget buildErrorWidget(String error) {
    return Center(
      child: CustomText(
        text: error,
        color: AppColor.white,
        fontWeight: FontWeight.w400,
        fontSize: 14,
      ),
    );
  }
}
