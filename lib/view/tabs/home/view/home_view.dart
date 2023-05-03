import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kampus/product/init/notifier/navigation_notifier.dart';
import 'package:kampus/product/models/post/post_model.dart';
import 'package:kampus/view/tabs/home/viewmodel/home_view_model.dart';
import 'package:provider/provider.dart';
import '../../../../core/base/base_view.dart';
import '../../../../product/widget/card/post_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationNotifier>(
      builder: (context, provider, child) => BaseView<HomeViewModel>(
        viewModel: HomeViewModel(),
        onModelReady: (model) {
          model.setContext(context);
          model.init();
        },
        onPageBuilder: (context, viewModel) => body(context, viewModel),
      ),
    );
  }

  Widget body(BuildContext context, HomeViewModel viewModel) {
    return StreamBuilder(
      stream: viewModel.stream,
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Center(child: Text('Something went wrong'));
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: Text("Loading"));
        }
        return CustomScrollView(
          slivers: [
            SliverAppBar(
              title: Text(ModalRoute.of(context)!.settings.name!),
              pinned: true,
              expandedHeight: 100,
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: snapshot.data!.docs.length,
                (context, index) {
                  QueryDocumentSnapshot<Object?>? postModelSnap = snapshot.data?.docs[index];
                  PostModel? postModel = postModelSnap?.data() as PostModel;

                  return PostWidget(postModel: postModel);
                },
              ),
            )
          ],
        );
      },
    );
  }
}
