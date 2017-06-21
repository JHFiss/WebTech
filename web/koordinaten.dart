///Datentyp um einfach koordinaten zu uebergaeben oder zu bekommen
class Koordinaten {
  int _x, _y = 0;

  ///Konstruktor für die Koordinaten
  Koordinaten(int x, int y) {
    this._x = x;
    this._y = y;
  }

  ///Retuned die X Koordinate
  int get getX => this._x;

  ///Returned die Y Koordinate
  int get getY => this._y;

  //Nutzt keinen smart setter da wir immer x und y uebergaben wollen
  ///Setzt die x und y Koordinaten
  int setKoordinaten(int x, int y) {
      this._x = x;
      this._y = y;
  }
}