import 'package:flutter/material.dart';
import 'package:flutter_tata_neu_assignment/core/constants/app_colors.dart';
import 'package:flutter_tata_neu_assignment/core/constants/icon_constants.dart';
import 'package:flutter_tata_neu_assignment/core/localization/app_localizations.dart';
import 'package:flutter_tata_neu_assignment/ui/widgets/custom_text.dart';
import 'package:flutter_tata_neu_assignment/ui/widgets/helper_widgets.dart';
import 'package:flutter_tata_neu_assignment/ui/widgets/responsive_ui.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            HelperWidgets.buildAppBarIcon(),
            SizedBox(width: ResponsiveWidget.payItemsSpace()),
            CustomText(
              text: AppLocalizations.of(context).translate('app_title'),
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
            Image.network(IconConstants.hamburgerIcon, color: AppColor.white),
          ],
        ),
      ),
    );
  }
}
