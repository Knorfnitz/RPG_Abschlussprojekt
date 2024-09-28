// Mein Pseudocode
let empty: Int = 0 //Nur um die Seite zu commiten
/*
 
 
 Das Spiel startet...
 
 Einen Starthelden aussuchen aus 6 Helden mit lvl 1
 Bestätigung anfordern
 Hauptmenü (Lager öffnen)
 Im Lager gibt es mehrere Menüpunkte zur Auswahl
 
    Team tauschen
        Der Kampftrupp besteht aus drei Helden (die ersten drei)
        Hier muss es eine Möglichkeit geben, die Position im Array der Helden zu tauschen
 
    Inventar
        Hier gibt es Reiter für Potions, Rüstungen und Waffen
            In den Reitern werden nur Produkte angezeigt, die im Inventar sind
            Jedes Item kann man benutzen/Ausrüsten (Anzahl -1 oder nach Auswahl)
            Jedes Item soll verkauft werden können
            
    Heilen
        Heilt alle Helden im Austausch für Seelen
 
    Levelup
        Levelt einen bestimmten Held zum Preis von x Seelen, wird pro Level teurer
 
    Kampf
        Hier gehen die Ersten drei Teammitglieder im Kampf
        Es werden zufällig, nach Seltenheit ein Team aus bis zu drei Feinden erstellt
        
        Erst sind alle Helden nacheinander am Zug
            Basisangriff
                Auswahl Feind
                    Damage an Feind
 
            Spezialangriff
                Auswahl welchen Spezialangriff
                Auswahl Feind
 
            Beutel
                Potion auswählen
                Held auswählen
 
        Nun sind alle lebenden Feinde dran
            Greifen einen zufälligen, lebenden Held mit einer Standartattack an
 
        Es geht so lange, bis alle Helden oder Feinde tod sind
            Helden tod = Alle werden geheilt, verlieren aber alle Seelen
            Feinde tod = Jeder Feind dropt nach Seltenheit Seelen, Potions und/oder Waffen/Rüstungen
            Nächstes Level wird freigeschaltet
        
    Shop
        Hier kann man Potions kaufen und ins Inventar legen
        Hier kann man die restlichen Helden freischalten
 
 Prinzip:
    Helden mit Seelen leveln, die Gegner fallenlassen.
    Schafft man die höchste möglich Ebene, kann man eine Ebene höher gehen.
    Es können jederzeit starke Gegner erscheinen, stirbt man, verliert man alle Seelen
    Mehr Helden und Potions kann man mit Seelen kaufen
    Am Ende soll der Dämonenkönig besieht werden
 
 */

