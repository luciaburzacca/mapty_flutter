import 'package:flutter/material.dart';
import 'package:mapty_flutter/utente_lista.dart';

class UtenteFiltro extends StatelessWidget {
  final List<String> eventImages = [
    'assets/images/all.png',
    'assets/images/bar.png',
    'assets/images/beach.png',
    'assets/images/disco.png',
    'assets/images/film.png',
    'assets/images/karaoke.png',
    'assets/images/live.png',
    'assets/images/local.png',
    'assets/images/reggaeton.png',
    'assets/images/slay.png',
    'assets/images/techno.png',
    'assets/images/thematic.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scegli Tipo Evento'),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemCount: eventImages.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              /*Navigator.push(
                context,
                //MaterialPageRoute(builder: (context) => UtenteLista()),
              );*/
            },
            child: Image.asset(
              eventImages[index],
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}

