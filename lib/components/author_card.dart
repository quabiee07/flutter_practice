import 'package:flutter/material.dart';
import 'package:practice2/theme.dart';
import 'package:practice2/components/circle_image.dart';

class AuthorCard extends StatefulWidget {
  const AuthorCard({
    Key? key,
    required this.authorName,
    required this.title,
    required this.imageProvider,
  }) : super(key: key);

  final String authorName;
  final String title;
  final ImageProvider imageProvider;

  @override
  _AuthorCardState createState() => _AuthorCardState();
}

class _AuthorCardState extends State<AuthorCard> {
  bool _isFavCLicked = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Row(
        children: [
          CircleImage(imageProvider: widget.imageProvider, imageRadius: 28),
          SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.authorName,
                style: AppTheme.darkTextTheme.headline2,
              ),
              Text(
                widget.title,
                style: AppTheme.darkTextTheme.headline3,
              ),
            ],
          ),
          IconButton(
              onPressed: (){
                setState(() {
                  _isFavCLicked =! _isFavCLicked;
                });
              },
              icon: Icon(_isFavCLicked? Icons.favorite :Icons.favorite_border),
            iconSize: 30,
            color: Colors.red[400],
          )
        ],
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
      ),
    );
  }
}
