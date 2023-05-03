import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kampus/core/extension/context_extension.dart';

import '../../models/post/post_model.dart';
import '../../models/user/user_model.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({super.key, required this.postModel});
  final PostModel? postModel;

  Future<UserModel?> user() async {
    DocumentSnapshot<UserModel>? userModelRef = await postModel?.postedBy
        ?.withConverter<UserModel>(
          fromFirestore: (snapshot, _) => UserModel.fromFirestore(snapshot, _),
          toFirestore: (user, _) => user.toFirestore(),
        )
        .get();
    return userModelRef?.data();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: user(),
      builder: (context, user) => Container(
        padding: context.paddingLow,
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 1),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: context.paddingLow,
              child: CircleAvatar(
                radius: 24,
                backgroundImage: NetworkImage(user.data?.profilePicUrl ?? ""),
                backgroundColor: Colors.transparent,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: user.data?.name,
                          style: context.textTheme.bodyMedium,
                          children: [
                            TextSpan(text: user.data?.userName, style: context.textTheme.bodySmall),
                          ],
                        ),
                      ),
                      const Icon(Icons.more_horiz_outlined),
                    ],
                  ),
                  Text((postModel?.content ?? ""), maxLines: 4, overflow: TextOverflow.ellipsis),
                  Padding(
                    padding: context.paddingLowVertical,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      width: 350,
                      child: postModel?.photo != null
                          ? Image.network(
                              postModel!.photo!,
                              fit: BoxFit.fitWidth,
                            )
                          : const SizedBox(),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Icon(Icons.comment_outlined),
                      Icon(Icons.repeat_outlined),
                      Icon(Icons.favorite_border_outlined),
                      Icon(Icons.share_outlined),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
