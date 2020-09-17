import 'package:flutter/material.dart';
import 'package:haub/firebase_tools/usuario.dart';
import 'package:haub/models/colorPalette.dart';
import 'package:haub/view/onboard/cadastro.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class MyLoginPage extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<MyLoginPage> {
  final _formKey = GlobalKey<FormState>();
  //final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _formKey,
      appBar: AppBar(
        backgroundColor: ColorPalette.primaryColor,
        centerTitle: true,
        toolbarHeight: 300, 
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/logo-teste.png',
              width: 120,
              height: 120,
            ),
          ],
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30))),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 80),
            ),
            Form(
              child: Padding(
                padding: EdgeInsets.only(left: 15, right: 15, top: 10),
                child: Column(children: [
                  /*
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
                  ),*/
                  Container(
                      width: (MediaQuery.of(context).size.width),
                      height: 100,
                      child: SignInButton(
                        Buttons.Google,
                        text: "Sign in with Google",
                        onPressed: () async {
                          await Usuario.fazerLogin();
                          if (!await Usuario.jaCadastrado()) {
                            await Usuario
                                .cadastrar(); //Apenas para teste. REMOVER
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyRegisterPage()));
                          } else {
                            Navigator.pushReplacementNamed(context, '/home');
                          }
                        },
                      )),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
