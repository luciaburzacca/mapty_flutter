import 'package:flutter/material.dart';

class UtenteLista extends StatelessWidget {
  final String eventType;

  UtenteLista({required this.eventType});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Elenco Eventi: $eventType'),
      ),
      body: Center(
        child: Text('Elenco degli eventi di tipo $eventType'),
      ),
    );
  }
}


