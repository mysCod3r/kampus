import 'package:cloud_firestore/cloud_firestore.dart';

class PostModel {
  final DocumentReference? postedBy;
  final int? likeCount;
  final int? commentCount;
  final String? content;
  final String? photo;

  PostModel({
    this.postedBy,
    this.likeCount,
    this.commentCount,
    this.content,
    this.photo,
  });

  factory PostModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return PostModel(
      postedBy: data?['posted_by'],
      commentCount: data?['comment_count'],
      content: data?['content'],
      likeCount: data?['like_count'],
      photo: data?['photo_url'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (postedBy != null) "posted_by": postedBy,
      if (commentCount != null) "comment_count": commentCount,
      if (content != null) "content": content,
      if (likeCount != null) "like_count": likeCount,
      if (photo != null) "photo_url": photo,
    };
  }
}
