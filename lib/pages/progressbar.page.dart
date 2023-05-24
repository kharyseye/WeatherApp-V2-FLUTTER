import 'dart:async';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:page_transition/page_transition.dart';

class Progressbar extends StatefulWidget {
  const Progressbar({Key? key}) : super(key: key);

  @override
  State<Progressbar> createState() => _ProgressbarState();
}

class _ProgressbarState extends State<Progressbar> {
  bool _loading = false;
  double _progressvalue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Appuyer sur le bouton en bas"),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            //ne s'affiche qu'au chargement si non on n'affiche rien
            _loading ? _linearProgressIndicator() : Container(),
            _getProgress()
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.file_download),
        onPressed: () {
          setState(() {
            //loading change a chaque fois que l'on clic sur ce boutton ;)
            _loading = !_loading;
            _updateProgress();
          });
        },
      ),
    );
  }

//cette fonction nous permet de charger la jauge a 100%
  Widget _getProgress() {
    String progress = '${_progressvalue * 100}';
    return Text(
      '$progress% Chargement',
      style: TextStyle(
        color: Colors.black,
        fontSize: 22,
        fontWeight: FontWeight.bold,
        letterSpacing: 1,
      ),
    );
  }

  void _updateProgress() {
    const oneSec = const Duration(seconds: 1);
    new Timer.periodic(oneSec, (Timer t) {
      setState(() {
        _progressvalue += 0.1;
        //le telechargement s'arrete la
        if (_progressvalue.toStringAsFixed(1) == '1.0') {
          _loading = false;
          t.cancel();
          _progressvalue = 0.0;
          return;
        }
      });
    });
  }

  Widget _linearProgressIndicator() {
    return LinearProgressIndicator(
      value: _progressvalue,
    );
  }
}
