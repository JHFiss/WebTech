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
    Element target2;
    querySelectorAll('#gameTable td').onMouseOver.forEach((ev) {
      ev.preventDefault();
      target2 = ev.target;
      querySelector('#start').text = 'row =${target2.getAttribute('row')}'
          ' || col =${target2.getAttribute('col')}';
          });
    this._view.updateView(ret);
  }
}