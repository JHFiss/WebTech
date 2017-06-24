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
    String content = "";
    for(var row = 0; row < this._spielfeldY; row++) {
      content += "<tr>";
      for (var col = 0; col < this._spielfeldX; col++) {
        content += "<td row = '${row}' col = '${col}'></td>";
      }
      content += "</tr>";
    }
    return content;
  }

  String liveToHtml() {
    return "<tr>"
        "<td row = '${0}' col = '${0}'></td>"
        "<td row = '${0}' col = '${1}'></td>"
        "<td row = '${0}' col = '${2}'></td>"
        "</tr>";
  }
  //Id reichweitern
  //Laser             100-199
  //GegnerRaumschiffe 200-299
  //SpielerRaumschiff 300-399
  //////////////////Ab hier erstellung der Testdaten////////////////////////////
  //*******************Erstellung der Laser***********************************//
  Laser testLaser() {
    Laser ret = new Laser("#FF0000", null, 1,
        1, 100, null, 40, 30, 1);
    return ret;
  }
  //*******************Erstellung der Raumschiffes****************************//
  List<Raumschiff> testRaumschiffe() {
    List<Raumschiff> ret = new List();
    List<Koordinaten> r1Form = [new Koordinaten(-2, 1), new Koordinaten(-2, -1),
                                new Koordinaten(-1, 0)];
    Raumschiff r1 = new Raumschiff("#58FAAC", new Koordinaten(4, 9),
        1, 1,
        300, r1Form, 80, 100, 3, 100);

    return ret;
  }
  //*******************Erstellung der Gegnerraumschiffe***********************//
  List<GegnerRaumschiff> testGegnerRaumschiffe() {
    List<GegnerRaumschiff> ret = new List();

    List<Koordinaten> gr1Form = [ new Koordinaten(1, 1),
                                  new Koordinaten(1, -1)];

    List<Koordinaten> bmGr1 = [];
    List<Koordinaten> amGr1 = [];
    GegnerRaumschiff gr1 = new GegnerRaumschiff("#8904B1", new Koordinaten(28, 4),
        1, 1,
        200, gr1Form, 40, 40, 1,
        100, _bewegungsmuster, _angriffsmuster);
  }
}


