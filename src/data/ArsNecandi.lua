AetheriusBadgeFilter:RegisterGuild(AetheriusBadgeFilter.SERVER_EU, "Ars Necandi", {
    {
        name = "PvE-Gruppenspiel",
        description = "Welche Rolle ihr innerhalb einer Gruppe erfüllen könnt. Um eine zu bekommen, bitte Gildenleitung kontaktieren.",
        badges = {
            {
                name = "Tank",
                description = "Übernimmt die Rolle des Beschützers in der Gruppe",
                color = "4592FF",
            },
            {
                name = "Heiler",
                description = "Übernimmt die Rolle des Heilers in der Gruppe",
                color = "47FFC1",
            },
            {
                name = "DD",
                description = "Übernimmt die Rolle des Schadensausteilers in der Gruppe",
                color = "FF8174",
            },
			{
                name = "Stammgruppe",
                description = "Ist Mitglied der PvE-Stammgruppe",
                color = "FF8174",
            },
        }
    },
	{
        name = "Handwerk",
        badges = {
            {
                name = "Handwerksmeister",
                description = "Beherrscht alle Handwerke",
                relations = {"Alchemist", "Meisterkoch", "Schreiner", "Schneider", "Schmied", "Verzauberer"},
				color = "AD8D1B",
            },
            {
                name = "Alchemist",
                description = "Beherrscht alle Zutaten und hat alle Stufen ausgelevelt.",
				color = "349118",
            },
            {
                name = "Meisterkoch",
                description = "Kann mehr als 90% aller Rezepte und kocht dir die verzüglichsten Lebensmittel.",
            },
            {
                name = "Schmied",
                description = "Kann alle 9 Traits der Schmiedekunst und hat das Handwerk ausgelevelt.",
				color = "375F7A",
            },
            {
                name = "Schneider",
                description = "Kann alle 9 Traits der Schneiderei und hat das Handwerk ausgelevelt.",
				color = "A52B5E",
            },
            {
                name = "Schreiner",
                description = "Kann alle 9 Traits der Schreinerei und hat das Handwerk ausgelevelt.",
				color = "AF6438",
            },
            {
                name = "Verzauberer",
                description = "Beherrscht alle Runentypen und hat das Handwerk ausgelevelt.",
				color = "A44DBC",
            },
            {
                name = "Stilsicher",
                description = "Beherrscht alle derzeitigen Stile.",
				color = "3FC6C6",
            },
        }
    },  
})
