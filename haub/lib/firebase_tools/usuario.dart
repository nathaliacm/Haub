import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Usuario {
  static User _usuario;
  static String nome;
  static String email;
  static Map<String, dynamic> interesses;
  static String id() => _usuario.uid;

  static bool estaConectado() {
    return (FirebaseAuth.instance.currentUser != null);
  }

  static Future<bool> jaCadastrado() {
      return FirebaseFirestore.instance.collection('users').doc(id()).get().then(
        (usuario) => usuario.exists
      );
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
    
    if (await jaCadastrado()) {
      await _fetchUserMetaData();
    }

    return _usuario != null;
  }

  static Future<void> _fetchUserMetaData() async {
    print('user is connected from fetchmetadata: ${_usuario!=null}');
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

  static Future<void> _pushUserMetaData() async {
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

  static Future<bool> fazerLogin() async {
    print('user is connected from fetchmetadata: ${estaConectado()}');
    if(!estaConectado()) {
      return _fazerLoginGoogle();
    } else {
      return false;
    }
  }

  static Future<bool> fazerLogout() async {
    print('user is connected from fetchmetadata: ${estaConectado()}');
    if(estaConectado()) {
      await FirebaseAuth.instance.signOut();
      await GoogleSignIn().signOut();
      return true;
    } else {return false;}
  }

  static Future<bool> cadastrar() async {
    if (!estaConectado() | await jaCadastrado()) {
      return false;
    }
    _pushUserMetaData();
    return true;
  }
}