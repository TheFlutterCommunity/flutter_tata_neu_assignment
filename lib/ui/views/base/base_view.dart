import 'package:flutter/material.dart';
import 'package:flutter_tata_neu_assignment/core/di/locator.dart';
import 'package:flutter_tata_neu_assignment/core/view_models/base/base_model.dart';
import 'package:provider/provider.dart';

class BaseView<T extends BaseModel> extends StatefulWidget {
  final Widget Function(
    BuildContext context,
    T model,
    Widget? child,
  ) builder;
  final Function(T)? onModelReady;
  final Function(T)? onModelDispose;

  const BaseView(
      {Key? key, required this.builder, this.onModelReady, this.onModelDispose})
      : super(key: key);

  @override
  State<BaseView<T>> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends BaseModel> extends State<BaseView<T>> {
  T model = locator<T>();

  @override
  void initState() {
    if (widget.onModelReady != null) {
      widget.onModelReady!(model);
    }
    super.initState();
  }

  @override
  void dispose() {
    if (widget.onModelDispose != null) {
      widget.onModelDispose!(model);
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>.value(
      //builder: (context) => model,
      value: model,
      child: Consumer<T>(builder: widget.builder),
    );

    /*return ChangeNotifierProvider<T>(
      builder: (context) => model,
      child: Consumer<T>(builder: widget.builder),
    );

    return ChangeNotifierProvider<T>(
        create: (context) => model,
        child: Consumer<T>(builder: widget.builder));
    */
  }
}
