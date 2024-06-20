import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart'; // Per la gestione delle date

class LocaleNew extends StatefulWidget {
  @override
  _LocaleNewState createState() => _LocaleNewState();
}

class _LocaleNewState extends State<LocaleNew> {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _descrizioneController = TextEditingController();
  final TextEditingController _latitudineController = TextEditingController();
  final TextEditingController _longitudineController = TextEditingController();
  final TextEditingController _dataController = TextEditingController();
  final TextEditingController _oraInizioController = TextEditingController();
  final TextEditingController _oraFineController = TextEditingController();
  final TextEditingController _prezzoController = TextEditingController();

  String? _selectedTipo;
  String nomeLocale = 'Nome del Locale';
  String numeroTelefono = 'Numero di Telefono';

  final List<String> _tipiEvento = [
    'Concerto',
    'Teatro',
    'Mostra',
    'Altro'
  ];

  void _clearFields() {
    _nomeController.clear();
    _descrizioneController.clear();
    _latitudineController.clear();
    _longitudineController.clear();
    _dataController.clear();
    _oraInizioController.clear();
    _oraFineController.clear();
    _prezzoController.clear();
    setState(() {
      _selectedTipo = null;
    });
  }

  Future<void> _saveEvent() async {
    if (_nomeController.text.isEmpty ||
        _descrizioneController.text.isEmpty ||
        _selectedTipo == null ||
        _latitudineController.text.isEmpty ||
        _longitudineController.text.isEmpty ||
        _dataController.text.isEmpty ||
        _oraInizioController.text.isEmpty ||
        _oraFineController.text.isEmpty ||
        _prezzoController.text.isEmpty) {
      // Mostra un avviso se uno qualsiasi dei campi è vuoto
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Errore'),
          content: Text('Per favore, completa tutti i campi.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        ),
      );
      return;
    }

    try {
      GeoPoint luogo = GeoPoint(
        double.parse(_latitudineController.text),
        double.parse(_longitudineController.text),
      );
      DateTime data = DateFormat('yyyy-MM-dd').parse(_dataController.text);
      DateTime oraInizio = DateFormat('HH:mm').parse(_oraInizioController.text);
      DateTime oraFine = DateFormat('HH:mm').parse(_oraFineController.text);

      await FirebaseFirestore.instance.collection('eventos').add({
        'nome': _nomeController.text,
        'descrizione': _descrizioneController.text,
        'tipo': _selectedTipo,
        'luogo': luogo,
        'data': data,
        'oraInizio': oraInizio,
        'oraFine': oraFine,
        'prezzo': double.parse(_prezzoController.text),
        'nomeLocale': nomeLocale,
        'numeroTelefono': numeroTelefono,
      });

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Successo'),
          content: Text('Evento salvato con successo.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        ),
      );

      _clearFields();
    } catch (e) {
      print('Errore durante il salvataggio: $e');
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Errore'),
          content: Text('Si è verificato un errore durante il salvataggio.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Colore di sfondo dell'intera schermata
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _nomeController,
                decoration: InputDecoration(
                  labelText: 'Nome',
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              SizedBox(height: 8),
              TextField(
                controller: _descrizioneController,
                decoration: InputDecoration(
                  labelText: 'Descrizione',
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              SizedBox(height: 8),
              DropdownButtonFormField<String>(
                value: _selectedTipo,
                items: _tipiEvento.map((tipo) {
                  return DropdownMenuItem<String>(
                    value: tipo,
                    child: Text(tipo),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    _selectedTipo = newValue;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Tipo',
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              SizedBox(height: 8),
              TextField(
                controller: _latitudineController,
                decoration: InputDecoration(
                  labelText: 'Latitudine',
                  filled: true,
                  fillColor: Colors.white,
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 8),
              TextField(
                controller: _longitudineController,
                decoration: InputDecoration(
                  labelText: 'Longitudine',
                  filled: true,
                  fillColor: Colors.white,
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 8),
              TextField(
                controller: _dataController,
                decoration: InputDecoration(
                  labelText: 'Data (yyyy-mm-dd)',
                  filled: true,
                  fillColor: Colors.white,
                ),
                keyboardType: TextInputType.datetime,
              ),
              SizedBox(height: 8),
              TextField(
                controller: _oraInizioController,
                decoration: InputDecoration(
                  labelText: 'Ora Inizio (HH:mm)',
                  filled: true,
                  fillColor: Colors.white,
                ),
                keyboardType: TextInputType.datetime,
              ),
              SizedBox(height: 8),
              TextField(
                controller: _oraFineController,
                decoration: InputDecoration(
                  labelText: 'Ora Fine (HH:mm)',
                  filled: true,
                  fillColor: Colors.white,
                ),
                keyboardType: TextInputType.datetime,
              ),
              SizedBox(height: 8),
              TextField(
                controller: _prezzoController,
                decoration: InputDecoration(
                  labelText: 'Prezzo',
                  filled: true,
                  fillColor: Colors.white,
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16),
              Text(
                nomeLocale,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                numeroTelefono,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: _clearFields,
                    child: Text('Svuota Tutto'),
                  ),
                  ElevatedButton(
                    onPressed: _saveEvent,
                    child: Text('Salva'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
