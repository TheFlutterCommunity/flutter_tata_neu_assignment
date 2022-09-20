import 'package:flutter/material.dart';
import 'package:flutter_tata_neu_assignment/core/constants/app_colors.dart';
import 'package:flutter_tata_neu_assignment/core/di/locator.dart';
import 'package:flutter_tata_neu_assignment/core/view_models/dashboard/dashboard_view_model.dart';
import 'package:flutter_tata_neu_assignment/ui/views/base/base_view.dart';
import 'package:flutter_tata_neu_assignment/ui/views/dashboard/pages/home_view.dart';
import 'package:flutter_tata_neu_assignment/ui/views/dashboard/pages/neu_pass_view.dart';
import 'package:flutter_tata_neu_assignment/ui/views/dashboard/pages/offers_view.dart';
import 'package:flutter_tata_neu_assignment/ui/views/dashboard/pages/stories_view.dart';
import 'package:flutter_tata_neu_assignment/ui/views/dashboard/pages/tata_pay_view.dart';
import 'package:flutter_tata_neu_assignment/ui/widgets/custom_bottom_navigation_bar.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  PageController? _pageController;

  final List<Widget> _dashboardPages = const <Widget>[
    HomeView(),
    TataPayView(),
    NeuPassView(),
    OffersView(),
    StoriesView(),
  ];

  @override
  void initState() {
    _init();
    super.initState();
  }

  void _init() {
    _pageController = PageController(
        initialPage: locator<DashboardViewModel>().currentIndex!);
  }

  @override
  void dispose() {
    _pageController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<DashboardViewModel>(
      onModelReady: (model) {
        model.getDashboardDetails();
      },
      onModelDispose: (model) {},
      builder: (context, model, child) {
        return _buildBody();
      },
    );
  }

  Widget _buildBody() {
    return Scaffold(
      backgroundColor: AppColor.black_17,
      bottomNavigationBar: _buildBottomNavigationBar(),
      body: _buildPageView(),
    );
  }

  Widget _buildPageView() {
    return PageView.builder(
      controller: _pageController,
      onPageChanged: (index) => _onPageChange(index),
      itemBuilder: (BuildContext context, int index) => _dashboardPages[index],
      itemCount: _dashboardPages.length,
    );
  }

  _onPageChange(index) {
    locator<DashboardViewModel>().currentIndex = index;
    _pageController!.jumpToPage(index);
  }

  Widget _buildBottomNavigationBar() {
    return CustomBottomNavigationBar(
      currentIndex: locator<DashboardViewModel>().currentIndex!,
      onItemChange: (index) => _onPageChange(index),
    );
  }
}
