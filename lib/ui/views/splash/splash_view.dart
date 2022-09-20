import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tata_neu_assignment/core/constants/app_colors.dart';
import 'package:flutter_tata_neu_assignment/core/constants/font_family_constants.dart';
import 'package:flutter_tata_neu_assignment/core/constants/icon_constants.dart';
import 'package:flutter_tata_neu_assignment/core/localization/app_localizations.dart';
import 'package:flutter_tata_neu_assignment/core/routing/routes.dart';
import 'package:flutter_tata_neu_assignment/ui/widgets/custom_text.dart';
import 'package:flutter_tata_neu_assignment/ui/widgets/responsive_ui.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  bool? _isLoaded = false;

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      // Init Responsive Widget Utility
      ResponsiveWidget.init(context);
      if (kDebugMode) {
        print('Height: ${ResponsiveWidget.height}');
        print('Width: ${ResponsiveWidget.width}');
        print('Pixel Ratio: ${ResponsiveWidget.pixelRatio}');
        print('isLarge: ${ResponsiveWidget.isScreenLarge}');
        print('isMedium: ${ResponsiveWidget.isScreenMedium}');
        print('isSmall: ${ResponsiveWidget.isScreenSmall}');
      }
    });

    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _isLoaded = true;
      });
    });

    Future.delayed(const Duration(seconds: 2), () {
      _navigateToDashboardView();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.black_17,
      body: _isLoaded ?? false ? _buildBody() : _buildLoader(),
    );
  }

  Widget _buildBody() {
    return Container(
      constraints: BoxConstraints(
        minHeight: MediaQuery.of(context).size.height,
      ),
      child: IntrinsicHeight(
        child: Column(
          children: [
            Expanded(flex: 4, child: _buildAppLogoSection()),
            Expanded(flex: 7, child: _buildMiddleTitleBar()),
            Expanded(flex: 6, child: _buildFooterSection())
          ],
        ),
      ),
    );
  }

  Widget _buildLoader() {
    return const Center(child: CircularProgressIndicator());
  }

  _navigateToDashboardView() {
    Navigator.pushReplacementNamed(
      context,
      Routes.dashboardRoute,
    );
  }

  Widget _buildAppLogoSection() {
    return Container(
      margin: EdgeInsets.only(top: ResponsiveWidget.splashTitlePaddingTop()),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      alignment: Alignment.topCenter,
      child: Image.asset(
        IconConstants.tataLogoIcon,
        width: 100,
        height: 100,
      ),
    );
  }

  Widget _buildMiddleTitleBar() {
    return Column(
      children: [
        CustomText(
            text: AppLocalizations.of(context).translate("app_title"),
            fontSize: 20,
            color: AppColor.orange_1,
            fontFamily: FontFamilyConstants.interRegular,
            fontWeight: FontWeight.w800),
        const SizedBox(
          height: 13,
        ),
        CustomText(
            text: AppLocalizations.of(context).translate("app_title"),
            fontSize: 18,
            color: AppColor.green,
            fontFamily: FontFamilyConstants.interRegular,
            fontWeight: FontWeight.w700),
      ],
    );
  }

  Widget _buildFooterSection() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Image.asset(
        IconConstants.logoIcon,
        height: 48,
        width: 48,
      ),
    );
  }
}
