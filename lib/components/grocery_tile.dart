import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../models/models.dart';

class GroceryTile extends StatelessWidget {
  final GroceryItem item;
  final Function(bool?)? onComplete;
  final TextDecoration textDecoration;
  GroceryTile({
    Key? key,
    required this.item,
    this.onComplete}) :
        textDecoration = item.isComplete ? TextDecoration.lineThrough :
            TextDecoration.none,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //TODO: Add row to group name, date, importance
          Row(
            children: [
              Container(width: 5.0, color: item.color),
              SizedBox(width: 16.0),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      item.name,
                      style: GoogleFonts.lato(
                      decoration: textDecoration,
                      fontSize: 21.0,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 4.0),
                  buildDate(),
                  SizedBox(height: 4.0),
                  buildImportance(),
                ],
              )
            ],
          ),
          //TODO: Add row to group quantity, checkbox
          Row(
            children: [
              Text(
                item.quantity.toString(),
                style: GoogleFonts.lato(
                  decoration: textDecoration,
                  fontSize: 21.0,
                ),
              ),
              buildCheck()
            ],
          ),
        ],
      ),
    );
  }
  Widget buildImportance(){
    if(item.importance ==Importance.low){
      return Text(
        'Low',
        style: GoogleFonts.lato(decoration:  textDecoration),
      );
    } else if(item.importance == Importance.medium){
       return Text(
         'Medium',
         style: GoogleFonts.lato(
           fontWeight: FontWeight.w800,
           decoration: textDecoration
         ),
       );
    } else if(item.importance == Importance.high){
      return Text(
        'High',
        style: GoogleFonts.lato(
          color: Colors.red,
          fontWeight: FontWeight.w900,
          decoration:textDecoration,
        ),
      );
    } else{
      throw Exception('This importance does not exist');
    }
  }

  Widget buildDate(){
    final dateFormatter = DateFormat('MMMM dd h:mm a');
    final dateString = dateFormatter.format(item.date);
    return Text(
      dateString,
      style: TextStyle( decoration: textDecoration),
    );
  }

  Widget buildCheck(){
    return Checkbox(value: item.isComplete, onChanged: onComplete);
  }
}
