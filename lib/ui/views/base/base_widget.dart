import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BaseWidget<T extends ChangeNotifier> extends StatefulWidget {
  final Widget Function(BuildContext context, T model, Widget? child) builder;
  final T? model;
  final Widget? child;
  final Function(T)? onModelReady;
  final Function(T)? onModelDispose;

  const BaseWidget({
    Key? key,
    required this.builder,
    this.model,
    this.child,
    this.onModelReady,
    this.onModelDispose,
  }) : super(key: key);

  @override
  State<BaseWidget<T>> createState() => _BaseWidgetState<T>();
}

class _BaseWidgetState<T extends ChangeNotifier> extends State<BaseWidget<T>> {
  T? model;

  @override
  void initState() {
    model = widget.model;

    if (widget.onModelReady != null) {
      widget.onModelReady!(model!);
    }
    super.initState();
  }

  @override
  void dispose() {
    if (widget.onModelDispose != null) {
      widget.onModelDispose!(model!);
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>.value(
      value: model!,
      child: Consumer<T>(
        builder: widget.builder,
        child: widget.child,
      ),
    );

    /*return ChangeNotifierProvider<T>(
      builder: (context) => model,
      child: Consumer<T>(
        builder: widget.builder,
        child: widget.child,
      ),
    );
    return ChangeNotifierProvider<T>.value(
      //builder: (context) => model,
      child: Consumer<T>(builder: widget.builder), notifier: model,
    );*/
  }
}
