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
  int _spielfeldX = 18;
  int _spielfeldY = 32;
  int _highscoreGlobal = 0;
  List<Raumschiff> _spielerRS = [];
  List<GegnerRaumschiff> _gegnerRS = [];
  List<Level> _level = [];
  List<Laser> _laser = [];
  int _x = 0; //Wird gebraucht um eine x wert zwischen zu speichern
  int _y = 0; //Wird gebraucht um eine y wert zwischen zu speichern
  Koordinaten _dummy; //Wird gebraucht um eine Koordinate zwischen zu speichern
  var collisionData = new List.generate(18, (i) => new List.filled(32,0));
  //TODO Fuer Beta Implementieren
  XMLLoader loader = null;

  ///Konstruktor des SpielModels
  //TODO Implementiren
  SpielModel();


  void updatePos() {
    _gegnerRS.forEach((rs) {
      Koordinaten gegDummy = rs.getPos;
      //Koordinaten nextPos = rs.getNextBewegung;
     rs.updatePos(new Koordinaten(gegDummy.getX -1,
          gegDummy.getY));
    });
  }

  //Ubdatet die die Position für die spieler raumschiffe
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

  String toHtml() {
    String content = "";
    for(var row = 0; row < this._spielfeldX; row++) {
      content += "<tr>";
      for(var col = 0; col < this._spielfeldY; col++) {
        content += "<td row = '${row}' col = '${col}'></td>";
      }
      content += "</tr>";
    }
    return content;
  }

  int get getSpielfeldX => this._spielfeldX;

  int get getSpielfeldY => this._spielfeldY;

  Raumschiff get getSpielerRS => this._spielerRS[0];

  List<GegnerRaumschiff> get getGegnerRS => this._gegnerRS;

  //Inizialisiert für die alpha die spielerraumschiffe, gegnerraumschiffe
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

  //TODO Implementieren
  void collisionDetection(Raumschiff obj) {
    List<GegnerRaumschiff> _dummy;
    bool damagetaken = false;
    this._gegnerRS.forEach((r) {

      if(r != obj){
        if((obj.getPos.getX - r.getPos.getX <= 6 && obj.getPos.getX - r.getPos.getX >= -6) && (obj.getPos.getY - r.getPos.getY <= 6 && obj.getPos.getY - r.getPos.getY >= -6)) {
          _dummy.add(r);
        }
      }

    });

    _dummy.forEach((t) {
      damagetaken = false;
      t.getForm.forEach((f) {
        if (damagetaken == false) {
          obj.getForm.forEach((s) {
            if(f.getY + t.getPos.getY == s.getY + obj.getPos.getY && f.getX + t.getPos.getX == s.getX + obj.getPos.getX) {
              t.updateLife(true);
              obj.updateLife(true);
              damagetaken = true;
            }
          });
        }
      });
    });

  }
}