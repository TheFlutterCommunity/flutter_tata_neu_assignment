import 'package:flutter/material.dart';
import 'package:flutter_tata_neu_assignment/core/constants/app_colors.dart';

class StoriesView extends StatefulWidget {
  const StoriesView({Key? key}) : super(key: key);

  @override
  State<StoriesView> createState() => _StoriesViewState();
}

class _StoriesViewState extends State<StoriesView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.cyan,
    );
  }
}
