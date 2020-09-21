import 'package:flutter/material.dart';
import 'package:haub/models/appBar.dart';
import 'package:haub/models/colorPalette.dart';
import 'package:haub/models/dropDownButtonElement.dart';

class MyProfileScreen extends StatefulWidget {
  MyProfileScreen({Key key}) : super(key: key);

  @override
  _MyProfileScreenState createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  String selecionadoEscolaridade;
  String selecionadoAreadeDominio;
  String selecionadoNiveldeDominio;

  String escolaridade;
  String areadeDominio;
  String niveldeDominio;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CircularAppBar('Configuração', 120, true, 25),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(20),
                child: Icon(
                  Icons.photo,
                  size: 80,
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                height: 70,
                width: 350,
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    hintText: "Seu nome",
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    labelStyle: TextStyle(color: ColorPalette.textColor),
                    filled: true,
                    fillColor: Colors.grey[300],
                  ),
                ),
              ),
              Text(
                "Escolaridade",
                style: TextStyle(fontSize: 15),
              ),

              DropDownButtomOnly([
                  "Ensino médio",
                  "Ensino Superior",
                  "Mestrado",
                  "Doutorado"
                ], escolaridade, (String selecao) => selecao = selecionadoEscolaridade),
     
              Text(
                "Área de domínio",
                style: TextStyle(fontSize: 15),
              ),

              DropDownButtomOnly(
                    ["Fisica", "Matematica", "ingles", "Historia"],
                    areadeDominio,
                    (String selecao) => selecao = selecionadoAreadeDominio),


               DropDownButtomOnly([
                  "Ensino médio",
                  "Ensino Superior",
                  "Mestrado",
                  "Doutorado"
                ], niveldeDominio, (String selecao) => selecao = selecionadoNiveldeDominio),

            ],
          ),
        ),
      ),
    );
  }
}
