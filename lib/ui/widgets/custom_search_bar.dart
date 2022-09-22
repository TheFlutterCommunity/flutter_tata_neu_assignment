import 'package:flutter/material.dart';
import 'package:flutter_tata_neu_assignment/core/constants/app_colors.dart';
import 'package:flutter_tata_neu_assignment/core/constants/constants.dart';
import 'package:flutter_tata_neu_assignment/core/constants/font_family_constants.dart';
import 'package:flutter_tata_neu_assignment/core/localization/app_localizations.dart';
import 'package:flutter_tata_neu_assignment/ui/widgets/custom_text.dart';
import 'package:flutter_tata_neu_assignment/ui/widgets/responsive_ui.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
}
