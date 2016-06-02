-- Custom Badges for the "Nightingale's Utopia" Guild (NA)
-- Made by @MicaelJM for sirinsidiator's addon "Aetherius Badge Filter" - http://www.esoui.com/downloads/info1354-AetheriusBadgeFilter.html
-- Thanks a lot for all the help and for this awesome addon, sirinsidiator!
-- Used http://www.w3schools.com/colors/colors_picker.asp and http://www.color-hex.com/ for taking the Hex Codes
-- Last edited:
-- 05/28/2016
AetheriusBadgeFilter:RegisterGuild(AetheriusBadgeFilter.SERVER_NA, "Nightingale's Utopia", {
    {
        name = "|cEEC827Info|r (Mouseover)",
        description = "To use our |cb44be1Badges|r, mail |c6400ff@MicaelJM|r with the badges you want, or add them yourself by editing your |cb44be1Member Note|r (rightclick your name, then 'Edit Note') and adding the badge you want using the correct badge name and color\n\nExample:\n||c778899|c778899Badge Name|r||r\nChange '|c778899Badge Name|r' for the badge you want and '778899' for the correct hex color code\nColor codes are included on the description, as 'C:|c778899 778899|r'",
        badges = {
        },
    },
    {
        name = "|c6400ffStaff|r",
        description = "The ones who maintain our |cb44be1Guild|r",
        badges = {
            {
                name = "Main Coordinator",
                description = "|c00ff00Guildmaster|r\nManages our |cf4b400Gold|r, |cb44be1Guild Trader|r and such\n\n     C:|c00ff00 00ff00|r",
                color = "00ff00",
                relations = {"Social Moderator"},
            },
            {
                name = "Social Moderator",
                description = "Does the |cb44be1Raffle|r, |cb44be1Auction|r, promote members, moderates the chat, etc\n\n     C:|cff00ff ff00ff|r",
                color = "ff00ff",
            },
            {
                name = "House Financier",
                description = "Has access to the |c6400ffOfficer Chat|r\nHelped to maintain the |cb44be1Guild|r by donating |cf4b400Gold|r\n\n     C:|ccc66ff cc66ff|r",
                color = "cc66ff",
                relations = {"Donator"},
            },
        },
    },
    {
        name = "|cb44be1Social Ranks|r",
        description = "What you do on our |cb44be1Guild|r",
        badges = {
            {
                name = "PvE",
                description = "Does Pledges, Dungeons in general, World Bosses and such\n\n     C:|c00f0ff 00f0ff|r",
                color = "00f0ff",
            },
            {
                name = "PvP",
                description = "Fight other players at a daily basis\n\n     C:|ccc3300 cc3300|r",
                color = "cc3300",
            },
            {
                name = "AvA",
                description = "Just like PvP, but focused on capturing objectives and such, instead of just fighting\n\n     C:|cff8000 ff8080|r",
                color = "ff8000",
                relations = {"PvP"},
            },
            {
                name = "Donator",
                description = "Helped the |cb44be1Guild|r by donating large amounts of |cf4b400Gold|r or items for the |cb44be1Auction|r\n\n     C:|cff5050 ff5050|r",
                color = "ff5050",
            },
            {
                name = "Moneybag",
                description = "Is allowed to withdraw up to 5 items per day from our |cb44be1Guild Bank|r\nHelped to maintain the |cb44be1Guild|r by donating |cf4b400Gold|r\n\n     C:|ccc00cc cc00cc|r",
                color = "cc00cc",
                relations = {"Donator"},
            },
            {
                name = "Merchant",
                description = "Does a lot of buying and selling on our |cb44be1Guild Store|r\n\n     C:|c9933ff 9933ff|r",
                color = "9933ff",
            },
            {
                name = "Crafter",
                description = "Crafts gear and/or items for you to use on your adventures\n\n     C:|c0066ff 0066ff|r",
                color = "0066ff",
            },
            {
                name = "Away",
                description = "Will be away for some time, but will come back\nUse this to avoid being kicked for inactivity if you're going on vacation or something like that\nPlease, inform for how long you'll be out on your note\n\n     C:|c990000 990000|r",
                color = "990000",
            },
        },
    },
    {
        name = "|cb44be1Role|r",
        description = "Your role on a group",
        badges = {
            {
                name = "Healer",
                description = "Keeps the group alive\n\n     C:|c669900 669900|r",
                color = "669900",
                relations = {"PvE"},
            },
            {
                name = "DPS",
                description = "Deals large amounts of damage\n\n     C:|ccc3300 cc3300|r",
                color = "cc3300",
                relations = {"PvE"},
            },
            {
                name = "Tank",
                description = "Keeps the heat away from the others\n\n     C:|c333399 333399|r",
                color = "333399",
                relations = {"PvE"},
            },
        },
    },
    {
        name = "|cb44be1Bites|r",
        description = "People who can curse you with |cb44be1Noxophilic Sanguivoria|r or |cb44be1Hiricine's Gift|r\n\n     C:|cb44be1 b44be1|r",
        badges = {
            {
                name = "Vampire",
                description = "Can curse you with |cb44be1Noxophilic Sanguivoria|r",
                color = "b44be1",
            },
            {
                name = "Werewolf",
                description = "Can curse you with |cb44be1Hiricine's Gift|r",
                color = "b44be1",
            },
        },
    },
    {
        name = "|c0066ffCrafters|r",
        description = "Crafters who can craft equipments/consumables for you and provide items for research\n\n     C:|c3399ff 3399ff|r",
        badges = {
            {
                name = "Woodworker",
                description = "Crafts |c804000Bows|r, |c804000Staves|r and/or |c804000Shields|r",
                color = "3399ff",
                relations = {"Crafter"},
            },
            {
                name = "Clothier",
                description = "Crafts |c5c5c3dLight Armor|r and/or |c5c5c3dMedium Armor|r",
                color = "3399ff",
                relations = {"Crafter"},
            },
            {
                name = "Blacksmith",
                description = "Crafts |c8585adHeavy Armor|r and/or |c8585adMetal Weapons|r",
                color = "3399ff",
                relations = {"Crafter"},
            },
            {
                name = "Alchemist",
                description = "Crafts |cff4dd2Potions|r and such",
                color = "3399ff",
                relations = {"Crafter"},
            },
            {
                name = "Enchanter",
                description = "Crafts |c4d4dffGlyphs|r to enchant Gear",
                color = "3399ff",
                relations = {"Crafter"},
            },
            {
                name = "Provisioner",
                description = "Crafts |c663300Foods|r and |c4d004dDrinks|r",
                color = "3399ff",
                relations = {"Crafter"},
            },
        },
    },
    {
        name = "|c990033Master Crafters|r",
        description = "Crafters who know all there is to know about their profession\n\n     C:|c990000 990000|r",
        badges = {
            {
                name = "Master Crafter",
                description = "Can craft all equipments and all consumables of any level and knows all traits and recipes",
                color = "990000",
                relations = {"Crafter"},
            },
            {
                name = "Equipments Master",
                description = "Can craft all equipments of any level and knows all traits",
                color = "990000",
                relations = {"Crafter","Master Woodworker","Master Clothier","Master Blacksmith"},
            },
            {
                name = "Consumables Master",
                description = "Can craft all consumables of any level and knows all recipes",
                color = "990000",
                relations = {"Crafter","Master Alchemist","Master Enchanter","Master Provisioner"},
            },
            {
                name = "Master Woodworker",
                description = "Crafts |c804000Bows|r, |c804000Staves|r and |c804000Shields|r of any level and any trait",
                color = "990000",
                relations = {"Crafter"},
            },
            {
                name = "Master Clothier",
                description = "Crafts |c5c5c3dLight Armor|r and |c5c5c3dMedium Armor|r of any level and any trait",
                color = "990000",
                relations = {"Crafter"},
            },
            {
                name = "Master Blacksmith",
                description = "Crafts |c8585adHeavy Armor|r and |c8585adMetal Weapons|r of any level and any trait",
                color = "990000",
                relations = {"Crafter"},
            },
            {
                name = "Master Alchemist",
                description = "Crafts all |cff4dd2Potions|r of any level and such",
                color = "990000",
                relations = {"Crafter"},
            },
            {
                name = "Master Enchanter",
                description = "Crafts all |c4d4dffGlyphs|r of any level to enchant Gear",
                color = "990000",
                relations = {"Crafter"},
            },
            {
                name = "Master Provisioner",
                description = "Crafts all |c663300Foods|r and |c4d004dDrinks|r of any level and knows all recipes",
                color = "990000",
                relations = {"Crafter"},
            },
        },
    },
    {
        name = "|cb44be1Campaign|r",
        description = "Active Alliance War Campaign\n\n     C:|cffffff ffffff|r",
        badges = {
            {
                name = "Azura's Star",
                description = "30 Day Non-Champ",
                color = "ffffff",
                relations = {"PvP","AvA"},
            },
            {
                name = "Trueflame",
                description = "30 Day Standard",
                color = "ffffff",
                relations = {"PvP","AvA"},
            },
            {
                name = "Blackwater Blade",
                description = "Non Veteran",
                color = "ffffff",
                relations = {"PvP","AvA"},
            },
            {
                name = "Haderus",
                description = "7 Day Resources",
                color = "ffffff",
                relations = {"PvP","AvA"},
            },
        },
    },
})
