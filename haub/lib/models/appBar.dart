import 'package:flutter/material.dart';
import 'package:haub/models/colorPalette.dart';

class CircularAppBar extends StatelessWidget implements PreferredSizeWidget {
  CircularAppBar(this.titulo, this.height, this.centerTitle, this.fontSize,
      [this.bottomTab]);

  final String titulo;
  final bool centerTitle;
  final double height;
  final double fontSize;
  final Widget bottomTab;

  Size get preferredSize => Size.fromHeight(this.height);
  Widget build(BuildContext context) {
    return AppBar(
      bottom: bottomTab,
      backgroundColor: ColorPalette.primaryColor,
      centerTitle: centerTitle,
      toolbarHeight: height,
      title: Text(
            titulo,
            style: TextStyle(fontSize: fontSize),
      ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30))),
    );
  }
}
