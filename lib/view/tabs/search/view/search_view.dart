import 'package:flutter/material.dart';
import 'package:kampus/product/widget/appbar/custom_app_bar.dart';
import '../../../../core/base/base_view.dart';
import '../viewmodel/search_view_model.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<SearchViewModel>(
      viewModel: SearchViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (context, viewModel) => Scaffold(
        key: viewModel.scaffoldKey,
        drawer: const Drawer(),
        appBar: CustomAppBar(scaffoldKey: viewModel.scaffoldKey),
        body: Center(
          child: Text(ModalRoute.of(context)!.settings.name!),
        ),
      ),
    );
  }
}
