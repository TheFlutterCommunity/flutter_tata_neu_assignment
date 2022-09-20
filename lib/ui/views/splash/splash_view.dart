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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildMiddleTitleBar(),
            _buildFooterSection()
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


  Widget _buildMiddleTitleBar() {
    return Expanded(
      child: Center(
        child: Container(
          alignment: Alignment.center,
          child: Image.asset(IconConstants.tataNeuLogo1,
          height: 250,
          width: 250,)
        ),
      ),
    );
  }

  Widget _buildFooterSection() {
    return
      Container(
        alignment: Alignment.bottomCenter,
        padding: EdgeInsets.only(bottom: 20),
        child: CustomText(
            text: AppLocalizations.of(context).translate("copyrights"),
            fontSize: 14,
            color: AppColor.grey_2,
            fontFamily: FontFamilyConstants.interRegular,
        ),
      );
  }
}
