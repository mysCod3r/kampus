// ignore_for_file: constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kampus/product/models/post/post_model.dart';

import '../../../product/models/user/user_model.dart';
import '../auth/auth_service.dart';

class FirestoreService {
  static final FirestoreService _instace = FirestoreService._init();
  static FirestoreService get instance => _instace;

  FirestoreService._init();

  final FirebaseFirestore firestoreService = FirebaseFirestore.instance;
  final AuthService _authService = AuthService.instance;

  CollectionReference<UserModel> userDb() {
    return firestoreService.collection(FirestoreDbNames.users.name).withConverter(
          fromFirestore: (snapshot, _) => UserModel.fromFirestore(snapshot, _),
          toFirestore: (user, _) => user.toFirestore(),
        );
  }

  CollectionReference<PostModel> postsDb() {
    return firestoreService.collection(FirestoreDbNames.posts.name).withConverter(
          fromFirestore: (snapshot, _) => PostModel.fromFirestore(snapshot, _),
          toFirestore: (post, _) => post.toFirestore(),
        );
  }

  Future<UserModel?> getCurrentUserData() async {
    if (_authService.firebaseAuth.currentUser != null) {
      String currentUserUid = _authService.firebaseAuth.currentUser!.uid;
      DocumentSnapshot<UserModel>? currentUserSnap = await userDb().doc(currentUserUid).get();
      UserModel? currentUserData = currentUserSnap.data();
      if (currentUserData != null) return currentUserData;
    }
    return null;
  }
}

enum FirestoreDbNames {
  users,
  chat_room,
  posts,
}
