import 'package:flutter/material.dart';
import 'utente_filtro.dart';

class UtenteHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Colore di sfondo dell'intera schermata
      body: Stack(
        children: [
          Center(
            child: Text(
              'Home Screen',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => UtenteFiltro()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                ),
                child: Text('SCEGLI TIPO EVENTO'),
              ),
            ),
          ),
        ],
      ),

    );
  }
}
