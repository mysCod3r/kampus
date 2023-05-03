import 'package:flutter/material.dart';
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
        body: Center(
          child: Text(ModalRoute.of(context)!.settings.name!),
        ),
      ),
    );
  }
}
