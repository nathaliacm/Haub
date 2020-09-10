import 'package:flutter/material.dart';
import 'package:haub/models/colorPalette.dart';
import 'package:haub/view/perfil/profile.dart';
import '../../main.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: ColorPalette.primaryColor,
            ), 
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: Material(
                        color: ColorPalette.primaryColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),),
                        child: Image.asset('images/logo-teste.png', width: 70, height: 70,),
                      ),
                    ),
                  ],
                ),
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                   Text(
                  '<Nome>',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    ),
                  ),
                  ],
                ),
                Row(
                  children: [
                  Text(
                  '<áreaProficiencia>',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    ),
                  ),
                  ],
                ),
              ],
            )
          ),
          CustomListTile(Icons.account_circle, 'Perfil', (){
              Navigator.push(context, MaterialPageRoute(
              builder: (BuildContext context) =>  MyProfileScreen()));
          }),
          CustomListTile(Icons.message, 'Mensagens arquivadas', (){}),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
               Padding(
                padding: EdgeInsets.only(top: 300),
                child: RaisedButton(
                  splashColor: ColorPalette.primaryColor,
                  color: ColorPalette.secondaryColor,
                  child: Text("Sair"),
                  onPressed: (){},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  IconData icon;
  String text;
  Function onTap;

  CustomListTile(this.icon, this.text, this.onTap);

  @override
  Widget build(BuildContext context) {
    return (
      InkWell(
      splashColor: ColorPalette.primaryColor,
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 8),
                child: Icon(icon),
              ),
              Padding(
                padding: EdgeInsets.all(18),
                child: Text(
                  text,
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
          Icon(Icons.arrow_right),
        ],
      ),
    ));
  }
}
