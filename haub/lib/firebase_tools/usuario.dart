import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Usuario {
  User _usuario;
  String nome;
  String email;
  Map<String, dynamic> interesses;
  String id() => _usuario.uid;

  bool estaConectado() {
    return (FirebaseAuth.instance.currentUser != null);
  }

  Future<bool> jaCadastrado() {
      return FirebaseFirestore.instance.collection('users').doc(id()).get().then(
        (usuario) => usuario.exists
      );
  }

  Future<bool> _fazerLoginGoogle() async {
    // Trigger the Google Authentication flow.
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();
    // Obtain the auth details from the request.
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    // Create a new credential.
    final GoogleAuthCredential googleCredential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    // Sign in to Firebase with the Google [UserCredential].
    final UserCredential googleUserCredential =
      await FirebaseAuth.instance.signInWithCredential(googleCredential);
    
    _usuario = googleUserCredential.user;
    
    await _fetchUserMetaData();

    return _usuario != null;
  }

  Future<void> _fetchUserMetaData() async {
    if (_usuario != null) {
      FirebaseFirestore.instance.collection('users').doc(id()).get().then(
        (DocumentSnapshot userData) {
          email = userData.data()['email'];
          nome = userData.data()['nome'];
          interesses = userData.data()['interesses'];
        }
      );
    }
  }

  Future<void> _pushUserMetaData() async {
    if (_usuario != null) {
      await FirebaseFirestore.instance.collection('users').doc(id()).set(
        {
          'id':id(),
          'email':email,
          'nome':nome,
          'interesses':interesses
        }
      );
      return true;
    } else {
      return false;
    }
  }

  Future<bool> fazerLogin() async {
    print(estaConectado());

    //if(!estaConectado()) {
      return _fazerLoginGoogle();
    /*} else {
      return false;
    }*/
  }

  Future<bool> fazerLogout() async {
    print(estaConectado());

    if(estaConectado()) {
      await FirebaseAuth.instance.signOut();
      await GoogleSignIn().signOut();
      return true;
    } else {return false;}
  }

  Future<bool> cadastrar() async {
    if (!estaConectado() | await jaCadastrado()) {
      return false;
    }
    _pushUserMetaData();
    return true;
  }
}