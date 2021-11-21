import 'package:flutter/material.dart';
import '../models/models.dart';
import 'components.dart';

class FriendPostListView extends StatelessWidget {
  final List<Post> friendsPost;
  const FriendPostListView({Key? key, required this.friendsPost}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 10, right: 10, top: 10),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Social Chefs',
          style: Theme.of(context).textTheme.headline1),
          SizedBox(height: 16),

          SizedBox(height: 16),

          ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
              scrollDirection: Axis.vertical,
              primary: false,
              itemBuilder: (context, index){
                final post = friendsPost[index];
                return FriendsPostTile(post: post);
              },
              separatorBuilder: (context, index){
                return SizedBox(height: 16);
              },
              itemCount: friendsPost.length)
        ],
      ),
    );
  }
}
