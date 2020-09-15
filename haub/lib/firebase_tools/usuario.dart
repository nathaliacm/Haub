import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class Usuario {
  static User _usuario;
  static String get id {
    if (_usuario != null){
      return _usuario.uid;
    } else {
      return '';
    }
  }
  static String get email {
    if (_usuario != null){
      return _usuario.email;
    } else {
      return '';
    }
  }
  static String nome;
  static Map<String, dynamic> interesses;

  static Future<void> inicializar() async {
    Firebase.initializeApp();
    FirebaseAuth.instance.authStateChanges().listen((user) {_usuario = user;});
  }

  static bool estaConectado() {
    return (_usuario != null);
  }

  static Future<bool> jaCadastrado() {
      return FirebaseFirestore.instance.collection('users').doc(id).get().then(
        (usuario) => usuario.exists
      );
  }

  static Future<bool> cadastrar() {
    _pushUserMetaData();
    return jaCadastrado();
  }

  static Future<bool> _fazerLoginGoogle() async {
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
    
    if (_usuario != null) {
      if (!await jaCadastrado()) {
        nome = _usuario.displayName;
        interesses = null;
      }
    }
    _fetchUserMetaData();

    return (_usuario != null);
  }

  static Future<void> _fetchUserMetaData() async {
    if ((_usuario != null) & (id != '')) {
      FirebaseFirestore.instance.collection('users').doc(id).get().then(
        (DocumentSnapshot userData) {
          nome = userData.data()['nome'];
          interesses = userData.data()['interesses'];
        }
      );
    } else {
      nome = '';
      interesses = null;
    }
  }

  static Future<void> _pushUserMetaData() async {
    if (id != ''){
      FirebaseFirestore.instance.collection('users').doc(id).set(
        {
          'id':id,
          'email':email,
          'nome':nome,
          'interesses':interesses
        }
      );
    }
  }

  static Future<bool> fazerLogin() async {
    if(!estaConectado()) {
      return _fazerLoginGoogle();
    } else {
      await _fetchUserMetaData();
      return (id != '');
    }
  }

  static Future<bool> fazerLogout() async {
    if(estaConectado()) {
      await FirebaseAuth.instance.signOut();
      await GoogleSignIn().signOut();
    }
    _fetchUserMetaData();
    return (!estaConectado());
  }
}