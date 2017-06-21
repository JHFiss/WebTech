import 'spielModel.dart';
import 'dart:html';
import 'view.dart';
import 'dart:async';

///Der Controller der die Komunikation zwischen dem SpielModel und der
///View Steuert
//TODO Implementieren
class Controller {

  SpielModel _spielModel;
  View _view;
  int _frames = 0;
  Stopwatch _stopwatch = new Stopwatch();
  int _dummycount = 0;
  Controller(View this._view);
  String event = "";
  String ret = "";
  void start() {
    /*querySelector('#start').onClick.listen((ev) {
      Timer timer = new Timer.periodic(new Duration(milliseconds: 1000), (t) {
        this._dummycount = this._dummycount + 1;
        querySelector('#start').text = "${this._dummycount}";
      });
    });*/
  window.onKeyDown.listen((KeyboardEvent e) {
    event = e.which.toString();
    switch(event){
      case("37"):
        ret = "Links";
        break;
      case("38"):
        ret = "Oben";
        break;
      case("39"):
        ret = "Rechts";
        break;
      case("40"):
        ret = "Unten";
        break;
    }

    querySelector('#start').text = ret;
    this._view.updateView(ret);
  });
  }
}