import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? name;
  final String? userName;
  final String? email;
  final String? bio;
  final String? profilePicUrl;
  final int? followers;
  final int? following;
  final List<String>? followersList;
  final List<String>? followingList;

  UserModel({
    this.name,
    this.userName,
    this.email,
    this.bio,
    this.profilePicUrl,
    this.followers,
    this.following,
    this.followersList,
    this.followingList,
  });

  factory UserModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return UserModel(
      name: data?['name'],
      userName: data?['userName'],
      email: data?['email'],
      profilePicUrl: data?['profilePicUrl'],
      bio: data?['bio'],
      followers: data?['followers'],
      following: data?['following'],
      followersList: data?['followersList'] is Iterable ? List.from(data?['followersList']) : null,
      followingList: data?['followingList'] is Iterable ? List.from(data?['followingList']) : null,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (name != null) "name": name,
      if (userName != null) "userName": userName,
      if (email != null) "email": email,
      if (profilePicUrl != null) "profilePicUrl": profilePicUrl,
      if (bio != null) "bio": bio,
      if (followers != null) "followers": followers,
      if (following != null) "following": following,
      if (followersList != null) "followersList": followersList,
      if (followingList != null) "followingList": followingList,
    };
  }
}
