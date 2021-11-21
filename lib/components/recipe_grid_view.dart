import 'package:flutter/material.dart';
import 'package:practice2/models/models.dart';
import '../components/components.dart';
class RecipeGridView extends StatelessWidget {
  final List<SimpleRecipe> recipes;
  const RecipeGridView({Key? key, required this.recipes})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 16, right: 16, top: 16),
      child: GridView.builder(
        itemCount: recipes.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
        ),
        itemBuilder: (context, index){
          final simpleRecipe = recipes[index];
          return RecipeThumbnail(recipe: simpleRecipe);
        }
      ),
    );
  }
}
