AetheriusBadgeFilter:RegisterGuild("Nightingale's Utopia", {
    {
        name = "|c6400ffStaff|r",
        description = "The ones who maintain our |cb44be1Guild|r",
        badges = {
            {
                name = "Main Coordinator",
                description = "|c00ff00Guildmaster|r. Manages our |cf4b400Gold|r, |cb44be1Guild Trader|r and such",
                relations = {"Social Moderator"},
            },
            {
                name = "Social Moderator",
                description = "Does the |cb44be1Raffle|r, |cb44be1Auction|r, promote members, moderates the chat, etc",
            },
            {
                name = "House Financier",
                description = "Has access to the |c6400ffOfficer Chat|r. Helped to maintain the |cb44be1Guild|r by donating |cf4b400Gold|r",
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
                description = "Does Pledges, Dungeons in general, World Bosses and such",
            },
            {
                name = "PvP",
                description = "Fight other players at a daily basis",
            },
            {
                name = "AvA",
                description = "Just like PvP, but focused on capturing objectives and such, instead of just fighting",
                relations = {"PvP"},
            },
            {
                name = "Donator",
                description = "Helped the |cb44be1Guild|r by donating large amounts of |cf4b400Gold|r or items for the |cb44be1Auction|r",
            },
            {
                name = "Moneybag",
                description = "Is allowed to withdraw up to 5 items per day from our |cb44be1Guild Bank|r. Helped to maintain the |cb44be1Guild|r by donating |cf4b400Gold|r",
                relations = {"Donator"},
            },
            {
                name = "Merchant",
                description = "Does a lot of buying and selling on our |cb44be1Guild Store|r",
            },
            {
                name = "Crafter",
                description = "Crafts gear and/or items for you to use on your adventures",
            },
            {
                name = "Away",
                description = "Will be away for some time, but will come back. Use this to avoid being kicked for inactivity if you're going on vacation or something like that",
            },
        },
    },
    {
        name = "|cffff00Crafters|r",
        description = "Crafters who can craft gear/items for you and provide gear for research",
        badges = {
            {
                name = "Woodworker",
                description = "Crafts |c804000Bows|r, |c804000Staves|r and/or |c804000Shields|r",
                relations = {"Crafter"},
            },
            {
                name = "Clothier",
                description = "Crafts |c5c5c3dLight Armor|r and/or |c5c5c3dMedium Armor|r",
                relations = {"Crafter"},
            },
            {
                name = "Blacksmith",
                description = "Crafts |c8585adHeavy Armor|r and/or |c8585adMetal Weapons|r",
                relations = {"Crafter"},
            },
            {
                name = "Alchemist",
                description = "Crafts |cff4dd2Potions|r and such",
                relations = {"Crafter"},
            },
            {
                name = "Enchanter",
                description = "Crafts |c4d4dffGlyphs|r to enchant Gear",
                relations = {"Crafter"},
            },
            {
                name = "Provisioner",
                description = "Crafts |c663300Foods|r and |c4d004dDrinks|r",
                relations = {"Crafter"},
            },
        },
    },
    {
        name = "Role",
        description = "Your role on a group",
        badges = {
            {
                name = "Healer",
                description = "Keeps the group alive",
                relations = {"PvE"},
            },
            {
                name = "DPS",
                description = "Deals large amounts of damage",
                relations = {"PvE"},
            },
            {
                name = "Tank",
                description = "Keeps the heat away from the others",
                relations = {"PvE"},
            },
        },
    },
    {
        name = "Campaign",
        description = "Active Alliance War Campaign",
        badges = {
            {
                name = "Azura's Star",
                description = "30 Day Non-Champ",
                relations = {"PvP","AvA"},
            },
            {
                name = "Trueflame",
                description = "30 Day Standard",
                relations = {"PvP","AvA"},
            },
            {
                name = "Blackwater Blade",
                description = "Non Veteran",
                relations = {"PvP","AvA"},
            },
            {
                name = "Haderus",
                description = "7 Day Resources",
                relations = {"PvP","AvA"},
            },
        },
    },
})
