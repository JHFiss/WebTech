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
  List<GegnerRaumschiff> _gegnerRS = [];5
  List<Level> _level = [];
  List<Laser> _laser = [];
  int _x = 0; //Wird gebraucht um eine x wert zwischen zu speichern
  int _y = 0; //Wird gebraucht um eine y wert zwischen zu speichern
  Koordinaten _dummy; //Wird gebraucht um eine Koordinate zwischen zu speichern
  List<List<List<int>>> _spielfeld;
  //TODO Fuer Beta Implementieren
  XMLLoader loader = null;

  ///Konstruktor des SpielModels
  //TODO Implementierung vollständig?
  SpielModel(int grX, int grY) {
    _spielfeldX = grX;
    _spielfeldY = grY;

    _spielfeld = new List(grX);
    for (int i = 0; i <  grX; i++) {

      _spielfeld[i] = new List(grY);

      for (int a = 0; a < grY; a++) {

        _spielfeld[i][a] = new List();
      }
    }
  }

  //TODO ungetester RawCode, Code für Spielerraumschiff fehlt
  void updateSpielfeld() {
    _laser.forEach((r) {
      //TODO drunk, fix later; jk koerperform anpassen
      r.updatePos();
    });

    collisionDetection();

    _gegnerRS.forEach((rs) {
      rs.updatePos();
    });

    collisionDetection();
  }

  //Updatet die die Position für die spieler raumschiffe
  void updateSpielerPos(String richtung) {
    switch(richtung) {
      case("Links"):
        this._x = -1;
        this._y = 0;
        break;
      case("Oben"):
        this._x = 0;
        this._y = -1;
        break;
      case("Rechts"):
        this._x = 1;
        this._y = 0;
        break;
      case("Unten"):
        this._x = 0;
        this._y = 1;
        break;
    }
    //Updatet die koordinate an der sich das raumschiff befindet
    this._spielerRS.forEach((r) {
      _dummy = r.getPos;
        r.updatePos(new Koordinaten((_dummy.getX + _x), (_dummy.getY + _y)));
    });
  }

  //TODO Funktion an neue Funktionalität der Klasse anpassen
  String toHtml() {
    String content = "";
    for(var row = 0; row < this._spielfeldY; row++) {
      content += "<tr>";
      for(var col = 0; col < this._spielfeldX; col++) {
        content += "<td row = '${row}' col = '${col}'></td>";
      }
      content += "</tr>";
    }
    return content;
  }

  //TODO Implementieren
  void collisionDetection() {
    for (int x = 0; x < _spielfeldX; x++) {

    }
  }

  //Getter
  int get getSpielfeldX => this._spielfeldX;

  int get getSpielfeldY => this._spielfeldY;

  Raumschiff get getSpielerRS => this._spielerRS[0];

  List<GegnerRaumschiff> get getGegnerRS => this._gegnerRS;

  //Initialisiert für die alpha die spielerraumschiffe, gegnerraumschiffe
  void iniTESTData() {

    //Inizialisiert die spieler raumschiffe////////////////////////////////////
    Raumschiff sR = new Raumschiff("#8A2BE2", new Koordinaten(10, 10), 1, 1, 1,
        [new Koordinaten(0, 1), new Koordinaten(0, -1)], 1, 61);

    this._spielerRS.add(sR);

    //Inizialisiert die gegner raumschiffe/////////////////////////////////////
    List<bool> schussMuster = [false, false, true, false, true, false,
      true,false, false, false, false, false, false, false, false, false, true];

    GegnerRaumschiff gR1 = new GegnerRaumschiff("#00FF00",
        new Koordinaten(30, 4), 1, 1, 31, [new Koordinaten(1, 1),
        new Koordinaten(1, -1)], 1, 61, null, schussMuster);

    GegnerRaumschiff gR2 = new GegnerRaumschiff("#0101DF",
        new Koordinaten(30, 12), 1, 1, 32, [new Koordinaten(1, 1),
        new Koordinaten(1, -1)], 1, 61, null, schussMuster);
    this._gegnerRS.add(gR1);
    this._gegnerRS.add(gR2);
  }

  void removeGegnerLife(GegnerRaumschiff raumschiff) {
    bool notAlive = this._gegnerRS.firstWhere((GegnerRaumschiff) => GegnerRaumschiff == raumschiff)
                          .updateLife(true);
    if(notAlive)this._gegnerRS.remove(raumschiff);
  }

  //////////////////////////////////////////////////////////////////////////////


}