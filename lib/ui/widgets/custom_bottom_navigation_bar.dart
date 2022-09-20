import 'package:flutter/material.dart';
import 'package:flutter_tata_neu_assignment/core/constants/app_colors.dart';
import 'package:flutter_tata_neu_assignment/core/constants/font_family_constants.dart';
import 'package:flutter_tata_neu_assignment/core/localization/app_localizations.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int? currentIndex;
  final Function? onItemChange;

  const CustomBottomNavigationBar(
      {@required this.currentIndex, @required this.onItemChange, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: const EdgeInsets.only(bottom: 5),
      child: BottomNavigationBar(
        currentIndex: currentIndex!,
        onTap: (index) => onItemChange!(index),
        selectedLabelStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            fontFamily: FontFamilyConstants.interRegular,
            color: AppColor.grey_70),
        unselectedLabelStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            fontFamily: FontFamilyConstants.interRegular,
            color: AppColor.grey_70),
        backgroundColor: AppColor.blackColor,
        type: BottomNavigationBarType.fixed,
        items: [
          _buildBottomNavigationBarItem(
              label: AppLocalizations.of(context).translate('home'),
              iconData: Icons.home_outlined),
          _buildBottomNavigationBarItem(
              label: AppLocalizations.of(context).translate('tata_pay'),
              iconData: Icons.payments_outlined),
          _buildBottomNavigationBarItem(
              label: AppLocalizations.of(context).translate('neu_pass'),
              iconData: Icons.add),
          _buildBottomNavigationBarItem(
              label: AppLocalizations.of(context).translate('offers'),
              iconData: Icons.local_offer_outlined),
          _buildBottomNavigationBarItem(
              label: AppLocalizations.of(context).translate('stories'),
              iconData: Icons.amp_stories_rounded),
        ],
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.purple,
        showUnselectedLabels: true,
      ),
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem(
      {@required String? label, @required IconData? iconData}) {
    return BottomNavigationBarItem(
      icon: Container(
        padding: const EdgeInsets.only(bottom: 5),
        child: Icon(iconData),
      ),
      //activeIcon:Icon(Icons.home_outlined),
      label: label,
    );
  }
}
