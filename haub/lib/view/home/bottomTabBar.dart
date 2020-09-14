import 'package:flutter/material.dart';
import 'package:haub/models/colorPalette.dart';

class BottomTabBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(40.0);
  Widget build(Object context) {
    return TabBar(
      tabs: [
        Container(
            width: 70,
            height: 50,
            alignment: Alignment.center,
            child: Text("DÚVIDAS")),
        Container(
            width: 75,
            height: 50,
            alignment: Alignment.center,
            child: Text("MENTORIA")),
        // Tab(
        //   text: "Mentoria",
        // ),
      ],
      indicatorColor: ColorPalette.secondaryColor,
      indicatorPadding: EdgeInsets.fromLTRB(17, 8, 16, 0),
      labelColor: ColorPalette.backgroundColor,
      // labelPadding: EdgeInsets.symmetric(horizontal: 16.0),
    );
  }
}
