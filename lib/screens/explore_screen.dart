import 'package:flutter/material.dart';
import 'package:practice2/api/mock_drip_service.dart';
import '../components/components.dart';

class ExploreScreen extends StatelessWidget {
  final mockService = MockDripService();
  ExploreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: mockService.getExploreData(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if(snapshot.connectionState == ConnectionState.done){
          return ListView(
            scrollDirection: Axis.vertical,
            children: [
              TodayRecipeListView(recipes: snapshot.data?.todayRecipes??[]),

              SizedBox(height: 16),

              FriendPostListView(friendsPost: snapshot.data?.friendPosts??[]),
            ],
          );
        } else {
          return Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            )
          );
        }
      },
    );
  }
}
