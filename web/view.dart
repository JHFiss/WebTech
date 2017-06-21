import 'spielModel.dart';
import 'dart:html';
import 'raumschiff.dart';
import 'koordinaten.dart';
import 'gegnerRaumschiff.dart';

///Die Klasse View die Genutzt wird um die Tabelle darzustellen
class View {
  SpielModel _spielModel;
  ///Konstruktor der View
  //TODO Implementieren, verstehen
  View(SpielModel this._spielModel) {
    final validator = new NodeValidatorBuilder.common();
    validator.allowElement('td', attributes: ['row', 'col']);
    querySelector('#gameTable').setInnerHtml(this._spielModel.toHtml(), validator: validator);
  }


  ///Updatet die Tabelle
  //TODO Implementieren
  void updateView(String richtung) {
    if(richtung == "") {
      initialisiere();
      return;
    }
      removeOldData();
      _spielModel.updatePos();
      _spielModel.updateSpielerPos(richtung);
      insertNewData();
  }

  void initialisiere() {
    _spielModel.iniTESTData();

    //Inizialisiert das spieler rs auf den bildschirm///////////////////////////
    Raumschiff spielerRs = this._spielModel.getSpielerRS;
    Koordinaten spielerRSKN = spielerRs.getPos;
    //Inizialisiert die start position des SpielerRaumschiffes
    TableCellElement  e = querySelector('#gameTable td[col="'
        '${spielerRSKN.getX}"][row="${spielerRSKN.getY}"]');
    e.style.backgroundColor = spielerRs.getFarbe;

    //Inizialisiert den rest des spielerraumschiffes
    List<Koordinaten> spielerRsForm = spielerRs.getForm;

    spielerRsForm.forEach((i) {
      TableCellElement  e = querySelector('#gameTable td[col="'
          '${spielerRSKN.getX + i.getX}"][row="${spielerRSKN.getY + i.getY}"]');
      e.style.backgroundColor = spielerRs.getFarbe;
    });

    //Inizialisiere die gegner Raumschiffe//////////////////////////////////////
    List<GegnerRaumschiff> gegnerRs = this._spielModel.getGegnerRS;

    gegnerRs.forEach((rs) {
      Koordinaten gegnerRSKN = rs.getPos;
      //Inizialisiert die start position des SpielerRaumschiffes
      TableCellElement  e2 = querySelector('#gameTable td[col="'
          '${gegnerRSKN.getX}"][row="${gegnerRSKN.getY}"]');
      e2.style.backgroundColor = rs.getFarbe;

      List<Koordinaten> gegnerRsForm = rs.getForm;

      gegnerRsForm.forEach((i) {
        TableCellElement e = querySelector('#gameTable td[col="'
            '${gegnerRSKN.getX + i.getX}"][row="${gegnerRSKN.getY + i.getY}"]');
        e.style.backgroundColor = rs.getFarbe;
      });
    });
      ////////////////////////////////////////////////////////////////////////////
  }

  void removeOldData() {
    //Entfernt alles von dem spieler raumschiff////////////////////////////////
    Raumschiff spielerRs = this._spielModel.getSpielerRS;
    List<Koordinaten> spielerRsForm = spielerRs.getForm;
    Koordinaten spielerRSKN = spielerRs.getPos;

    TableCellElement  e = querySelector('#gameTable td[col="'
        '${spielerRSKN.getX}"][row="${spielerRSKN.getY}"]');
    e.style.backgroundColor = "#d3d3d3";

    spielerRsForm.forEach((i) {
      TableCellElement  e = querySelector('#gameTable td[col="'
          '${spielerRSKN.getX + i.getX}"][row="${spielerRSKN.getY + i.getY}"]');
      e.style.backgroundColor = "#d3d3d3";
    });

    //Entfernt alles von den gegner raumschiffen////////////////////////////////
    List<GegnerRaumschiff> gegnerRs = this._spielModel.getGegnerRS;

    gegnerRs.forEach((rs) {
      List<Koordinaten> gegnerRsForm = rs.getForm;
      Koordinaten gegnerRSKN = rs.getPos;
      //Entfernt die startposition
      TableCellElement  e = querySelector('#gameTable td[col="'
          '${gegnerRSKN.getX}"][row="${gegnerRSKN.getY}"]');
      e.style.backgroundColor = "#d3d3d3";

      //Entfernt alles offsets
      gegnerRsForm.forEach((i) {
        TableCellElement  e = querySelector('#gameTable td[col="'
            '${gegnerRSKN.getX + i.getX}"][row="${gegnerRSKN.getY + i.getY}"]');
        e.style.backgroundColor = "#d3d3d3";
      });
    });
  }

  void insertNewData() {
    insertPlayerRs();
    insertEnemyRs();
  }

  void insertPlayerRs() {
    Raumschiff spielerRs = this._spielModel.getSpielerRS;
    Koordinaten spielerRSKN = spielerRs.getPos;
    //Inizialisiert die start position des SpielerRaumschiffes
    TableCellElement  e = querySelector('#gameTable td[col="'
        '${spielerRSKN.getX}"][row="${spielerRSKN.getY}"]');
    e.style.backgroundColor = spielerRs.getFarbe;

    //Inizialisiert den rest des spielerraumschiffes
    List<Koordinaten> spielerRsForm = spielerRs.getForm;

    spielerRsForm.forEach((i) {
      TableCellElement  e = querySelector('#gameTable td[col="'
          '${spielerRSKN.getX + i.getX}"][row="${spielerRSKN.getY + i.getY}"]');
          e.style.backgroundColor = spielerRs.getFarbe;
    });
  }

  void insertEnemyRs() {
    List<GegnerRaumschiff> gegnerRs = this._spielModel.getGegnerRS;
    Koordinaten gegnerRSKN;

    /*gegnerRs.forEach((rs) {
      this._spielModel.collisionDetection(rs);
    });*/
    gegnerRs.forEach((rs) {
      gegnerRSKN = rs.getPos;
      //Inizialisiert die start position des gegnerRaumschiffes
      TableCellElement  e = querySelector('#gameTable td[col="'
          '${gegnerRSKN.getX}"][row="${gegnerRSKN.getY}"]');
      e.style.backgroundColor = rs.getFarbe;

      //Inizialisiert den rest des gegnerraumschiffes
      List<Koordinaten> gegnerRsForm = rs.getForm;

      gegnerRsForm.forEach((i) {
        TableCellElement  e = querySelector('#gameTable td[col="'
            '${gegnerRSKN.getX + i.getX}"][row="${gegnerRSKN.getY + i.getY}"]');
        e.style.backgroundColor = rs.getFarbe;
      });
    });
  }
}