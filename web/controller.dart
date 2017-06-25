import 'spielModel.dart';
import 'dart:html';
import 'view.dart';
import 'dart:async';

///Der Controller der die Komunikation zwischen dem SpielModel und der
///View Steuert hi
//TODO Implementieren
class Controller {

  SpielModel _spielModel;
  View _view;
  Controller(View this._view);
  String event = "";
  String ret = "";
  void start() {
    Element target;
    //Sorgt dafür das alle tabellen elemente auf Maus hover reagieren
    querySelectorAll('#gameTable td').onTouchStart.listen((ev) {
      ev.preventDefault();
      target = ev.target;
    });
      //Aktualisiert alle .. milisekunden das spiel
      new Timer.periodic(new Duration(milliseconds: 1000), (t) {
        if(target != null) {
          querySelector('#start').text = 'row =${target.getAttribute('row')}'
              ' || col =${target.getAttribute('col')}';
        }
      });

    this._view.updateView(ret);
  }
}