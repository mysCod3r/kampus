import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

class BaseView<T extends Store> extends StatefulWidget {
  const BaseView({super.key, required this.onPageBuilder, required this.viewModel, required this.onModelReady, this.onDispose});

  final Widget Function(BuildContext context, T value) onPageBuilder;
  final T viewModel;
  final Function(T model) onModelReady;
  final VoidCallback? onDispose;

  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends Store> extends State<BaseView<T>> with AutomaticKeepAliveClientMixin {
  late T model;

  @override
  void initState() {
    model = widget.viewModel;
    widget.onModelReady(model);
    super.initState();
  }

  @override
  void dispose() {
    if (widget.onDispose != null) widget.onDispose!();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.onPageBuilder(context, model);
  }

  @override
  bool get wantKeepAlive => true;
}
