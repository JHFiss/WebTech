import 'koerperform.dart';
import 'koordinaten.dart';
import 'spielModel.dart';

///Klasse Raumschiff die Koerperform erweitert
class Raumschiff extends Koerperform {
  int _laserIDref = 0;

  ///Raumschiff Konstruktor von Raumschiff
  ///Ruft den super Konstruktor von koerperform auf
  Raumschiff(String _farbe, Koordinaten _position, int _id, List<Koordinaten> _form,
              int _damageValue, int _lifeValue, SpielModel _model,
              this._laserIDref)
      : super(_farbe, _position, _id, _form, _damageValue, _lifeValue,
              _model);

  ///Returned die Laser ID referenze
  int get getLaserIDref => this._laserIDref;

  //TODO Implementieren
  void _setPosition(Koordinaten koordinaten) {
    int xOffset,yOffset = 0;
    int xNextMove = 0;  //1=Rechts, 0=stehenbleiben, -1 Links
    int yNextMove = 0;  //1=Oben, 0=stehenbleiben, -1Links
    Koordinaten neueKoor;

    xOffset = koordinaten.getX - getPos.getX;
    yOffset = koordinaten.getY - getPos.getY;

    if(xOffset != 0) {
      xNextMove = xOffset > 0 ? 1 : -1;
    }
    if(yOffset != 0) {
      yNextMove = yOffset > 0 ? 1 : -1;
    }

    //Erstellt die neue position der koeperform
    //TODO wieder einfügern
    //neueKoor = new Koordinaten((getPos.getX + xNextMove), (getPos.getY + yNextMove));

    neueKoor = new Koordinaten(5, 5);
    setPosition(neueKoor);  //Ruft das setPosition aus der Koeperform auf
  }

  //TODO zzt Pseudocode, für korrekte Implementierung muessen collisionDetection und setPosition funktionieren
  //TODO Spielergesteuertes Raumschiff, Steuervariablen müssen uebergeben werden
  @override
  void onTick(Koordinaten koordinaten) {
    _setPosition(koordinaten);
    positonToSpielfeld();
  }

  /*void _positonToSpielfeld() {
    //Setzt den startwert der koerperform in das spielfeld
    this.getModel.setSpielfeld(getPos.getX, getPos.getY, getID);

    //Setzt die offsets der koerperform in das spielfeld
    getForm.forEach((koerperOffset) {
      getModel.setSpielfeld(getPos.getX + koerperOffset.getX,
                            getPos.getY + koerperOffset.getY, getID);
    });

  }*/
}