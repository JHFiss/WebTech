/**
 * Author: Julian Parr, Jan H. Fiß
 */

import 'level.dart';
import 'koerperform.dart';
import 'raumschiff.dart';
import 'gegnerRaumschiff.dart';
import 'koordinaten.dart';
import 'laser.dart';
import 'xmlLoader.dart';

///Das SpielModel
//TODO Fehlende funktionalitäten implementieren
class SpielModel {

  int _spielfeldX;
  int _spielfeldY;
  List<Raumschiff> _spielerRS = [];
  List<GegnerRaumschiff> _gegnerRS = [];
  List<Level> _level = [];
  List<Laser> _laser = [];
  int _x = 0; //Wird gebraucht um eine x wert zwischen zu speichern
  int _y = 0; //Wird gebraucht um eine y wert zwischen zu speichern
  Koordinaten _dummy; //Wird gebraucht um eine Koordinate zwischen zu speichern
  List<List<List<int>>> spielfeld;

  //TODO Fuer Beta Implementieren
  XMLLoader loader = null;

  ///Konstruktor des SpielModels
  //TODO Implementierung vollständig?
  SpielModel(int grX, int grY) {
    _spielfeldX = grX;
    _spielfeldY = grY;

    spielfeld = new List(grX);
    for (int i = 0; i < grX; i++) {
      spielfeld[i] = new List(grY);

      for (int a = 0; a < grY; a++) {
        spielfeld[i][a] = new List();
      }
    }
  }

  //TODO ungetester RawCode, Code für Spielerraumschiff fehlt
  void updateSpielfeld() {
    _laser.forEach((r) {
      //TODO drunk, fix later; jk koerperform anpassen
      r.onTick();
    });

    _gegnerRS.forEach((rs) {
      rs.onTick();
    });
  }


  //TODO Funktion an neue Funktionalität der Klasse anpassen
  String toHtml() {

  }
}


