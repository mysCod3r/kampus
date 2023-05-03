import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kampus/core/extension/context_extension.dart';
import 'package:kampus/core/init/lang/locale_keys.g.dart';
import 'package:kampus/product/models/user/user_model.dart';

class DrawerUserButton extends StatelessWidget {
  final UserModel? userModel;
  final VoidCallback goProfile;
  final VoidCallback goFollowers;
  final VoidCallback goFollowing;

  const DrawerUserButton({
    super.key,
    this.userModel,
    required this.goProfile,
    required this.goFollowers,
    required this.goFollowing,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: goProfile,
          child: Padding(
            padding: context.paddingLowVertical,
            child: CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(userModel?.profilePicUrl ?? ""),
              backgroundColor: Colors.transparent,
            ),
          ),
        ),
        InkWell(
          onTap: goProfile,
          child: Text(
            userModel?.name ?? "",
            style: context.textTheme.bodyLarge,
          ),
        ),
        InkWell(
          onTap: goProfile,
          child: Text(
            userModel?.userName ?? "",
            style: context.textTheme.bodySmall,
          ),
        ),
        Row(
          children: [
            TextButton(
              onPressed: goFollowing,
              child: RichText(
                text: TextSpan(
                  text: "${userModel?.following}  ",
                  style: context.textTheme.bodyLarge,
                  children: [
                    TextSpan(
                      text: LocaleKeys.drawer_following.tr(),
                      style: context.textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: context.paddingLowHorizontal,
              child: TextButton(
                onPressed: goFollowers,
                child: RichText(
                  text: TextSpan(
                    text: "${userModel?.followers}  ",
                    style: context.textTheme.bodyLarge,
                    children: [
                      TextSpan(
                        text: LocaleKeys.drawer_followers.tr(),
                        style: context.textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
