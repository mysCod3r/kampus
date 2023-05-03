import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kampus/core/base/base_view_model.dart';
import 'package:kampus/product/init/notifier/navigation_notifier.dart';
import 'package:kampus/product/models/user/user_model.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

import '../../../../product/models/post/post_model.dart';

part 'home_view_model.g.dart';

class HomeViewModel = HomeViewModelBase with _$HomeViewModel;

abstract class HomeViewModelBase with Store, BaseViewModel {
  late GlobalKey<NavigatorState> currentKey;
  late final Stream<QuerySnapshot<PostModel>> stream;

  @override
  void setContext(BuildContext context) => contextt = context;

  @override
  void init() {
    currentKey = contextt!.read<NavigationNotifier>().currentKey;
    stream = firestoreService.postsDb().snapshots();
  }

  Future<PostModel> fetchPost({required int index}) async {
    QuerySnapshot<PostModel> allPost = await firestoreService.postsDb().get();
    PostModel postModel = allPost.docs[index].data();

    // DocumentSnapshot<UserModel>? userModelRef = await postModel.postedBy
    //     ?.withConverter<UserModel>(
    //       fromFirestore: (snapshot, _) => UserModel.fromFirestore(snapshot, _),
    //       toFirestore: (user, _) => user.toFirestore(),
    //     )
    //     .get();
    // UserModel? userModel = userModelRef?.data();

    // print(userModel?.email);
    return postModel;
  }

  Future<UserModel?> fetchUser({postModel}) async {
    DocumentSnapshot<UserModel>? userModelRef = await postModel.postedBy
        ?.withConverter<UserModel>(
          fromFirestore: (snapshot, _) => UserModel.fromFirestore(snapshot, _),
          toFirestore: (user, _) => user.toFirestore(),
        )
        .get();
    UserModel? userModel = userModelRef?.data();
    return userModel;
  }

  void navigateTo(String path) {
    navigation.navigateToPage(navigatorKey: currentKey, path: path);
  }
}
