import 'package:flutter/material.dart';
import 'package:haub/main.dart';
import 'package:haub/models/appBar.dart';
import 'package:haub/models/colorPalette.dart';
import 'package:haub/view/onboard/cadastro.dart';
import 'package:haub/firebase_tools/usuario.dart';

class MyLoginPage extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<MyLoginPage> {
  final _emailController = TextEditingController();
  final _passController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  //final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _formKey,
      appBar: CircularAppBar('Haub', 140, true, 34),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Text(
                    "Login",
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
            Form(
              child: Padding(
                padding: EdgeInsets.only(left: 15, right: 15, top: 10),
                child: Column(children: [
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(hintText: "E-mail"),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  TextField(
                    controller: _passController,
                    decoration: InputDecoration(hintText: "Senha"),
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: FlatButton(
                      onPressed: () async {
                        if (await userFinal.fazerLogin()) {
                          Navigator.push(context, MaterialPageRoute(
                          builder: (BuildContext context) =>  MyRegisterPage()));
                        }
                      },
                      child: Text("Cadastre-se",
                        textAlign: TextAlign.right,
                      ),
                      padding: EdgeInsets.zero,
                    ),
                  ),
                  Container(
                    width: (MediaQuery.of(context).size.width),
                    child: RaisedButton(
                      color: ColorPalette.secondaryColor,
                      onPressed: () async {
                        if (await userFinal.fazerLogin()) {
                          Navigator.push(context, MaterialPageRoute(
                          builder: (BuildContext context) =>  MyRegisterPage()));
                        }
                      },
                      child: Text(
                        "Entrar",
                        style: TextStyle(
                          fontSize: 15,
                          color: ColorPalette.textColor,
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}