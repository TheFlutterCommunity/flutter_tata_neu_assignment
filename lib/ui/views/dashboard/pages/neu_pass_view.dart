import 'package:flutter/material.dart';
import 'package:flutter_tata_neu_assignment/core/constants/app_colors.dart';

class NeuPassView extends StatefulWidget {
  const NeuPassView({Key? key}) : super(key: key);

  @override
  State<NeuPassView> createState() => _NeuPassViewState();
}

class _NeuPassViewState extends State<NeuPassView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.red,
    );
  }
}
