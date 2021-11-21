import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/models.dart';

class EmptyGroceryScreen extends StatelessWidget {
  const EmptyGroceryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(30.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AspectRatio(aspectRatio: 1/1,
            child: Image.asset('assets/food_assets/empty_list.png'),
            ),
            SizedBox(height: 8),
            Text('No Groceries', style: TextStyle(fontSize: 21.0),),
            SizedBox(height: 16),
            Text('Shopping for ingredients?\n'
            'Tap the + button to write them down!',
            textAlign: TextAlign.center,
            ),

            MaterialButton(
              textColor: Colors.white,
                child:  Text('Browse Recipes'),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                color: Colors.green,
                onPressed: (){
              //TODO: Go to recipes tab
                  Provider.of<TabManager>(context, listen: false).goToRecipes();
            }),
          ],
        ),
      ),
    );
  }
}
