class UserModel {
  final String name;
  final String? userName;
  final String email;
  final String? bio;
  final String? profilePic;
  final int? followers;
  final int? following;
  final List? followersList;
  final List? followingsList;
  final String createdAt = DateTime(1950, DateTime.now().month, DateTime.now().day + 3).toString();

  UserModel({
    required this.name,
    this.userName,
    required this.email,
    this.bio,
    this.profilePic,
    this.followers,
    this.following,
    this.followersList,
    this.followingsList,
  });
}
