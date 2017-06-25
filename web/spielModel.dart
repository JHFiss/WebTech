/**
 * Author: Julian Parr, Jan H. Fiß
 */

import 'level.dart';
import 'raumschiff.dart';
import 'gegnerRaumschiff.dart';
import 'koordinaten.dart';
import 'laser.dart';
import 'xmlLoader.dart';

///Das SpielModel
//TODO Fehlende funktionalitäten implementieren
class SpielModel {

  int _spielfeldX;  //Die Länge der X Achse des Spielfeldes
  int _spielfeldY;  //Die Länge der Y Achse des Spielfeldes
  List<Raumschiff> _spielerRS = new List(); //Die Spieler Raumschiffen
  List<GegnerRaumschiff> _gegnerRS = [];  //Die Gegner Raumschiffe
  List<Level> _level = new List(); //Die Level
  List<Laser> _laser = [];  //Die Laser

  //Das Spielfeld als "3 dimensionale Liste"
  //1.ebene die x Achse
  //2.ebene die y Achse
  //3. ebene die raumschiffe die sich auf dieser Position befinden
  List<List<List<int>>> spielfeld;

  //TODO XML über loader laden
  XMLLoader loader = new XMLLoader(); //Lädt die XML Daten

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

  //////////////////Ab hier erstellung der Testdaten////////////////////////////
  //Id reichweitern           //
  //Laser             100-199 //
  //GegnerRaumschiffe 200-299 //
  //SpielerRaumschiff 300-399 //
  //*******************Erstellung der Laser***********************************//
  Laser testLaser() {
    Laser ret = new Laser("#FF0000", null, 100, null, 40, 30, 1);
    return ret;
  }
  //*******************Erstellung der Raumschiffes****************************//
  List<Raumschiff> testRaumschiffe() {
    List<Raumschiff> ret = new List();
    List<Koordinaten> r1Form = [new Koordinaten(-2, 1), new Koordinaten(-2, -1),
                                new Koordinaten(-1, 0)];
    Raumschiff r1 = new Raumschiff("#58FAAC", new Koordinaten(4, 9),
        300, r1Form, 80, 100, 3, 100);

    return ret;
  }
  //*******************Erstellung der Gegnerraumschiffe***********************//
  List<GegnerRaumschiff> testGegnerRaumschiffe() {
    List<GegnerRaumschiff> ret = new List();

    List<Koordinaten> gr1Form = [ new Koordinaten(1, 1),
                                  new Koordinaten(1, -1)];

    //HEHEHE das wird lustig alle raumschiffe zu erstellen :)
    List<Koordinaten> bmGr1 = [new Koordinaten(27, 4), new Koordinaten(26, 4),
    new Koordinaten(25, 4), new Koordinaten(24, 4), new Koordinaten(23, 4),
    new Koordinaten(22, 4), new Koordinaten(21, 4), new Koordinaten(20, 4),
    new Koordinaten(20, 3), new Koordinaten(20, 4), new Koordinaten(20, 5),
    new Koordinaten(20, 4), new Koordinaten(19, 4), new Koordinaten(18, 4),
    new Koordinaten(17, 4), new Koordinaten(16, 4), new Koordinaten(15, 4),
    new Koordinaten(14, 4), new Koordinaten(13, 4), new Koordinaten(13, 5),
    new Koordinaten(13, 6), new Koordinaten(13, 7), new Koordinaten(13, 6),
    new Koordinaten(12, 6), new Koordinaten(11, 6), new Koordinaten(10, 6),
    new Koordinaten(9, 6), new Koordinaten(8, 6), new Koordinaten(7, 6),
    new Koordinaten(6, 6), new Koordinaten(5, 6), new Koordinaten(4, 6),
    new Koordinaten(3, 6), new Koordinaten(2, 6), new Koordinaten(1, 6), ];

    List<Koordinaten> bmGr2 = [new Koordinaten(27, 12), new Koordinaten(26, 12),
    new Koordinaten(25, 12), new Koordinaten(24, 12), new Koordinaten(23, 12),
    new Koordinaten(22, 12), new Koordinaten(21, 12), new Koordinaten(20, 12),
    new Koordinaten(20, 11), new Koordinaten(20, 12), new Koordinaten(20, 13),
    new Koordinaten(20, 12), new Koordinaten(19, 12), new Koordinaten(18, 12),
    new Koordinaten(17, 12), new Koordinaten(16, 12), new Koordinaten(15, 12),
    new Koordinaten(14, 12), new Koordinaten(13, 12), new Koordinaten(13, 13),
    new Koordinaten(13, 14), new Koordinaten(13, 15), new Koordinaten(13, 14),
    new Koordinaten(12, 14), new Koordinaten(11, 14), new Koordinaten(10, 14),
    new Koordinaten(9, 14), new Koordinaten(8, 14), new Koordinaten(7, 14),
    new Koordinaten(6, 14), new Koordinaten(5, 14), new Koordinaten(4, 14),
    new Koordinaten(3, 14), new Koordinaten(2, 14), new Koordinaten(1, 14), ];

    List<bool> amGr1 = [false, false, true, false, true, false, true, false,
      false, false, true, false, true, false, true, false, false, false,
      true, false, true, false, false, true, false, true, false, false, true,
      false, false, false, false];

    GegnerRaumschiff gr1 = new GegnerRaumschiff("#8904B1", new Koordinaten(28, 4),
        200, gr1Form, 40, 40, 1,
        100, bmGr1, amGr1);

    GegnerRaumschiff gr2 = new GegnerRaumschiff("#8904B1", new Koordinaten(28, 12),
        200, gr1Form, 40, 40, 1,
        100, bmGr2, amGr1);

    ret.add(gr1);
    ret.add(gr2);

    return ret;
  }
}


