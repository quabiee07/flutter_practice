import 'package:flutter/material.dart';
import '../models/models.dart';
import '../components/components.dart';
class FriendsPostTile extends StatelessWidget {
  final Post post;
  const FriendsPostTile({Key? key, required this.post})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CircleImage(
            imageProvider: AssetImage(
              post.profileImageUrl
            ),
          imageRadius: 20,
        ),
        SizedBox(width: 16),
        Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(post.comment),
                Text('${post.timestamp} mins ago',
                  style: TextStyle(fontWeight: FontWeight.w700),
                )
              ],
            ),
        )
      ],
    );
  }
}
