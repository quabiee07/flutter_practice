import 'package:flutter/material.dart';
import 'package:practice2/api/mock_drip_service.dart';
import 'package:practice2/components/recipe_grid_view.dart';

class RecipeScreen extends StatelessWidget {
  final exploreService = MockDripService();
  RecipeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: exploreService.getRecipes(),
        builder: (BuildContext context, AsyncSnapshot snapshot){
        if(snapshot.connectionState == ConnectionState.done){
          //TODO: Grid View
          return RecipeGridView(recipes: snapshot.data);
        }else {
          return Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          );
        }

        },
    );
  }
}
