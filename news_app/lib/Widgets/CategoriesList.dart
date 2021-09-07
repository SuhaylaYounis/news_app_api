import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/Const.dart';

class CategoriesList extends StatelessWidget {
  String? textCategories;
  String ?categories;
  Color? colorButton;

  CategoriesList({ this.textCategories, this.categories, this.colorButton });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: RaisedButton(
       shape: RoundedRectangleBorder(
         borderRadius: BorderRadius.circular(25.0)
       ),
        onPressed: () {
          print("$categories");
        },
        child: Text("$textCategories",
            style: TextStyle(color: Colors.white, fontSize: fontSubtitle)
        ),
        color: colorButton,
      ),
    );
  }
}
