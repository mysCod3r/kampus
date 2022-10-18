import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../product/models/product_models/user_model.dart';
import '../auth/auth_service.dart';

class FirestoreService {
  static final FirestoreService _instace = FirestoreService._init();
  static FirestoreService get instance => _instace;

  FirestoreService._init();

  final FirebaseFirestore firestoreService = FirebaseFirestore.instance;
  final AuthService _authService = AuthService.instance;
  DocumentReference<UserModel>? currentUser;

  CollectionReference<Map<String, dynamic>> userDb() {
    return firestoreService.collection(FirestoreDbNames.users.name);
  }

  Future<UserModel?> getCurrentUserData() async {
    if (_authService.firebaseAuth.currentUser != null) {
      String currentUserUid = _authService.firebaseAuth.currentUser!.uid;
      CollectionReference<Map<String, dynamic>> usersDb = userDb();

      currentUser = usersDb.doc(currentUserUid).withConverter<UserModel>(
            fromFirestore: (snapshot, _) => UserModel.fromFirestore(snapshot, _),
            toFirestore: (user, _) => user.toFirestore(),
          );
      DocumentSnapshot<UserModel> currentUserSnap = await currentUser!.get();
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
