local localization = {
    --- Main Window Label ---
    WINDOW_TITLE = "Abzeichenfilter",
    WINDOW_NO_BADGES = "Keine Abzeichen gefunden",

    --- Main Menu Items ---
    MENU_REFRESH_BADGES = "Abzeichen aktualisieren",
    MENU_SCANNED_BADGES = "Gefundene Abzeichen anzeigen",
    MENU_DEFINED_BADGES = "Definierte Abzeichen anzeigen",
    MENU_HIDE_MEMBERCOUNT = "Mitgliederzahl verstecken",
    MENU_SHOW_MEMBERCOUNT = "Mitgliederzahl anzeigen",
    MENU_LOCK_WINDOW = "Fenster sperren",
    MENU_UNLOCK_WINDOW = "Fenster entsperren",
    MENU_RESET_WINDOW = "Fenster zurücksetzen",
    MENU_HIDE_WINDOW = "Fenster verstecken",

    --- Member Badge Editor Menu ---
    MEMBER_EDITOR_INCREMENT = "Erhöhen",
    MEMBER_EDITOR_DECREMENT = "Verniedrigen",
    MEMBER_EDITOR_UPDATE_COLOR = "Farbe aktualisieren",
    MEMBER_EDITOR_REMOVE = "Entfernen",

    --- Tooltips ---
    TOOLTIP_MAIN_ICON = "Aetherius Badge Filter Fenster umschalten",
}
ZO_ShallowTableCopy(localization, AetheriusBadgeFilter.internal.Localization)
