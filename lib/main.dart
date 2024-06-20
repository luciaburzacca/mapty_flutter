import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mapty_flutter/locali_activity.dart';
import 'package:mapty_flutter/utente_activity.dart';
import 'package:mapty_flutter/registrazione_utente.dart';
import 'package:mapty_flutter/utente_filtro.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  FirebaseAuth.instance.authStateChanges().listen((User? user) {
    if (user == null) {
      print('Utente non loggato');
    } else {
      print('Utente loggato: ${user.uid}');
    }
  });

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black, colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue).copyWith(background: Colors.black),
      ),
      // Rotte
      routes: {
        '/': (context) => MyHomePage(),
        '/registrazione_utente': (context) => RegistrazioneUtente(),
        '/utente_activity': (context) => UtenteActivity(),
        '/locali_activity': (context) => LocaliActivity(),
        '/utente_filtro': (context) => UtenteFiltro(),
        //'/utente_lista': (context) => UtenteLista(),
      },
      initialRoute: '/',
    );
  }
}



class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Benvenuto',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 40.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/utente_activity');
              },
              style: ElevatedButton.styleFrom(
              ),
              child: Text('Utente'),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/locali_activity');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
              ),
              child: Text('Locale'),
            ),
          ],
        ),
      ),
    );
  }
}

