/**
 * Author: Julian Parr, Jan H. Fiß
 */

import 'level.dart';
import 'raumschiff.dart';
import 'gegnerRaumschiff.dart';
import 'koordinaten.dart';
import 'laser.dart';
import 'xmlLoader.dart';
import 'koerperform.dart';

///Das SpielModel
//TODO Fehlende funktionalitäten implementieren
class SpielModel {

  int _spielfeldX;  //Die Länge der X Achse des Spielfeldes
  int _spielfeldY;  //Die Länge der Y Achse des Spielfeldes
  Map<int, Raumschiff> _spielerRS = new Map(); //Die Spieler Raumschiffe
  Map<int, GegnerRaumschiff> _gegnerRS = new Map();  //Die Gegner Raumschiffe
  Map<int, Laser> _laser = new Map();  //Die Laser

  List<Level> _level = new List(); //Die Level
  //Das Spielfeld als "3 dimensionale Liste"
  //1.ebene die x Achse
  //2.ebene die y Achse
  //3. ebene die raumschiffe die sich auf dieser Position befinden
  List<List<List<int>>> _spielfeld = new List(32);

  //TODO XML über loader laden
  XMLLoader loader = new XMLLoader(); //Lädt die XML Daten

  ///Konstruktor des SpielModels
  //TODO Implementierung vollständig?
  SpielModel(int grX, int grY) {
    _spielfeldX = grX;
    _spielfeldY = grY;

    this._spielfeld = new List(grX);
    for (int i = 0; i < grX; i++) {
      this._spielfeld[i] = new List(grY);

      for (int a = 0; a < grY; a++) {
        this._spielfeld[i][a] = new List();
      }
    }
    //TODO Die TestRaumschiffe sollten ins Level ausgelagert werden
    /*this._spielerRS = testRaumschiffe();
    this._gegnerRS = testGegnerRaumschiffe();
    this._laser = testLaser();*/
  }

  //TODO ungetester RawCode, Code für Spielerraumschiff fehlt
  void updateSpielfeld(Koordinaten rsKoordinaten) {
    //Laser zu testzwecken entfernt
    /*_laser.forEach((l) {
      //TODO drunk, fix later; jk koerperform anpassen
      l.onTick(null);
    });*/

    //Gegner raumschiffe zu testzwecken entfernt
    /*_gegnerRS.forEach((grs) {
      grs.onTick(null);
    });*/

    _spielerRS.forEach((i, v) {
      v.onTick(rsKoordinaten);
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
  ///Spawnt neuen Laser
  //TODO Implementierung anpassen
  void spawnLaser(Laser l) {
      this._laser.putIfAbsent(l.getID, () => l);
  }

  ///Spawnt neues Spieler Raumschiff
  void spawnSpielerRaumschiff(Raumschiff rs) {
    this._spielerRS.putIfAbsent(rs.getID, () => rs);
  }

  ///Spawnt neues Gegner Raumschiff
  void spawnGegnerRaumschiff(GegnerRaumschiff rs) {
    this._gegnerRS.putIfAbsent(rs.getID, () => rs);
  }

  ///Entfernt die Koerperform mit der uebergebenen id
  void despawnEntity(int id) {
    if (id < 200) {
      _laser.remove(id);
      return;
    } else if (id < 300) {
      _gegnerRS.remove(id);
      return;
    } else if (id < 400) {
      _spielerRS.remove(id);
      return;
    }
  }

  ///updated das Leben eines Raumschiffes
  void updateLife(int id, int value) {
    if (id < 200) {
      _laser[id].updateLife(value);
    } else if (id < 300) {
      _gegnerRS[id].updateLife(value);
    } else if (id < 400) {
      _spielerRS[id].updateLife(value);
    }
    return;
  }

  ///gibt den Schadenswert einer Koerperform zurück
  int getDamageValue(int id) {
    int ret = 0;
    if (id < 200) {
      ret = _laser[id].getDamageValue;
    } else if (id < 300) {
      ret = _gegnerRS[id].getDamageValue;
    } else if (id < 400) {
      ret = _spielerRS[id].getDamageValue;
    }
    return ret;
  }

  ///Getter fuer das Spielfeld, gibt das Spielfeld zurueck
  List<List<List<int>>> get getSpielfeld {
    return this._spielfeld;
  }

  ///setter fuer das Spielfeld, setzt das Spielfeld auf den uebergebenen Wert
  void set setSpielfeld(List<List<List<int>>> spielfeld) {
    this._spielfeld = spielfeld;
  }

  String getColor(int id) {
    String ret = "";
    if(id <200) {
      ret = this._laser[id].getFarbe;
    }else if(id < 300) {
      ret = this._gegnerRS[id].getFarbe;
    }else if(id < 400) {
      ret = this._spielerRS[id].getFarbe;
    }
    return ret;
  }
  //////////////////Ab hier erstellung der Testdaten////////////////////////////
  //Id reichweitern           //
  //Laser             100-199 //
  //GegnerRaumschiffe 200-299 //
  //SpielerRaumschiff 300-399 //
  //*******************Erstellung der Laser***********************************//
  List<Laser> testLaser() {
    List<Laser> ret = new List();
    Laser l1 = new Laser("#FF0000", null, 100, null, 40, 30, this);
    ret.add(l1);
    return ret;
  }
  //*******************Erstellung der Raumschiffes****************************//
  List<Raumschiff> testRaumschiffe() {
    List<Raumschiff> ret = new List();
    List<Koordinaten> r1Form = [new Koordinaten(-2, 1), new Koordinaten(-2, -1),
                                new Koordinaten(-1, 0)];
    Raumschiff r1 = new Raumschiff("#58FAAC", new Koordinaten(4, 9),
        300, r1Form, 80, 100, this, 100);

    return ret;
  }
  //*******************Erstellung der Gegnerraumschiffe***********************//
  List<GegnerRaumschiff> testGegnerRaumschiffe() {
    List<GegnerRaumschiff> ret = new List();

    List<Koordinaten> gr1Form = [ new Koordinaten(1, 1),
                                  new Koordinaten(1, -1)];

    //HEHEHE das wird lustig alle raumschiffe zu erstellen :)
    List<Koordinaten> bmGr1 = [new Koordinaten(-1, 0), new Koordinaten(-1, 0),
    new Koordinaten(0, -1), new Koordinaten(0, -1), new Koordinaten(-1, 0),
    new Koordinaten(-1, 0), new Koordinaten(0, 1), new Koordinaten(0, 1) ];

    List<Koordinaten> bmGr2 = [new Koordinaten(-1, 0), new Koordinaten(-1, 0),
    new Koordinaten(0, 1), new Koordinaten(0, 1), new Koordinaten(-1, 0),
    new Koordinaten(-1, 0), new Koordinaten(0, -1), new Koordinaten(0, -1) ];

    List<bool> amGr1 = [false, false, true, false, true];

    GegnerRaumschiff gr1 = new GegnerRaumschiff("#8904B1", new Koordinaten(28, 4),
        200, gr1Form, 40, 40, this,
        100, bmGr1, amGr1);

    GegnerRaumschiff gr2 = new GegnerRaumschiff("#8904B1", new Koordinaten(28, 12),
        200, gr1Form, 40, 40, this,
        100, bmGr2, amGr1);

    ret.add(gr1);
    ret.add(gr2);

    return ret;
  }
}


