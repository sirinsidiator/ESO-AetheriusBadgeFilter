-- Custom Badges for the "Black Horse Courier" Guild (PC/EU)
-- Made by @CradonWar for @sirinsidiator's addon "Aetherius Badge Filter" - http://www.esoui.com/downloads/info1354-AetheriusBadgeFilter.html
-- Thanks a lot for all the help and for this awesome addon, @sirinsidiator!
-- Last edited: 19/08/2018
AetheriusBadgeFilter:RegisterGuild(AetheriusBadgeFilter.SERVER_EU, "Black Horse Courier", {
    {
        name = "|cFDFFBFInfo (Mouseover)|r",
        description = "Welcome to Aetherius Badge Filter of the Black Horse Courier!\n\n|cFDFFBFWhat are Badges?|r\nBadges are simply labels with a color format placed in the notes of a guild member. For example |cFF0000My Badge|r is a badge. Unlike ranks, badges are a lot more transient and versatile as they are not limited in their number. There are some non-ranked badges that you can simply ask to any officer to add into your notes. But you need Ranked Badges to improve your guild rank and get promoted.\n\n|cFDFFBFWhat are Ranked Badges?|r\nRanked Badges determines your improvement to get promoted in the guild. E.g. staying loyal, participating into Guild Events, selling items in Guild Store (when we have a Guild Trader), donating golds into Guild Bank, etc.",
        badges = {
        },
    },
    {
        name = "|cFDFFBFGuild Ranks (Mouseover)|r",
        description = "|cFDFFBF[Legendary]|r\nEarn 200 ranked badges to reach this rank.\n\n|cFDFFBF[Master]|r\nEarn 100 ranked badges to reach this rank.\n\n|cFDFFBF[Expert]|r\nEarn 50 ranked badges to reach this rank.\n\n|cFDFFBF[Adept]|r\nEarn 25 ranked badges to reach this rank.\n\n|cFDFFBF[Apprentice]|r\nEarn 5 ranked badges to reach this rank.\n\n|cFDFFBF[Novice]|r\nWelcome to Black Horse Courier!",
        badges = {
        },
    },
    {
        name = "Staff",
        description = "Authorized people who you can contact them if you have questions, suggestions, problems, etc.",
        badges = {
            {
                name = "Guildmaster",
                description = "First Courier(s) of the Black Horse Courier.",
                color = "FFD700",
            },
            {
                name = "Officer",
                description = "An active officer of the Black Horse Courier.",
                color = "FF0000",
            },
            {
                name = "Recruiter",
                description = "An active recruiter of the Black Horse Courier.",
                color = "FF0000",
            },
            {
                name = "PVE Organizer",
                description = "Event Organizer for Trials or group dungeons.",
                color = "FF0000",
            },
            {
                name = "PVP Organizer",
                description = "Event Organizer for AvA, Battlegrounds or dueling.",
                color = "FF0000",
            },
            {
                name = "Community Organizer",
                description = "Event Organizer for social guild events.",
                color = "FF0000",
            },
        }
    },
    {
        name = "Loyalty Badges",
        description = "Badges that are awarded to member for their loyalty in the guild. These badges will be used as a basis for promotions in the guild.",
        badges = {
            {
                name = "VIP",
                description = "Known members of the guild either who has been in the guild since its foundation or aided the guild or community in a special way. Has a different set of rules applied. You can only get this badge from guildmasters.\n\n|cFDFFBFNOTE: These members may immune to be kicked!|r",
                color = "FFD700",
            },
            {
                name = "Ancient",
                description = "Has been in the guild for more than a year.\nCounts as 4 badges.",
                color = "A19CDE",
            },
            {
                name = "Elder",
                description = "Has been in the guild for more than 200 days.\nCounts as 3 badges.",
                color = "A19CDE",
            },
            {
                name = "Veteran",
                description = "Has been in the guild for more than 100 days.\nCounts as 2 badges.",
                color = "A19CDE",
            },
            {
                name = "Associate",
                description = "Has been in the guild for more than 30 days.",
                color = "A19CDE",
            },
            {
                name = "Recruit",
                description = "Welcome to Black Horse Courier!\n\n|cFDFFBFNOTE: This badge is non-ranked.|r",
                color = "C5C29E",
            },
        }
    },
    {
        name = "Event Badges",
        description = "Badges that are awarded to members for their participation in guild events. These badges will be used as a basis for promotions in the guild. Can be awarded multiple times.",
        badges = {
            {
                name = "Auction",
                description = "Join a guild Auction and win a lot that you bid to earn this badge. Can be awarded multiple times in a single auction.",
                color = "C64343",
                limit = false,
            },
            {
                name = "Undaunted",
                description = "Join a PVE guild event and complete at least one major activity to earn this badge.",
                color = "C64343",
                limit = false,
            },
            {
                name = "Gladiator",
                description = "Join a PVP guild event and complete at least one major activity to earn this badge.",
                color = "C64343",
                limit = false,
            },
            {
                name = "Champion",
                description = "Earn a badge from each event in the week.\n\n|cFDFFBFNOTE: You can only earn this badge if there are more than one guild event in the week.|r",
                color = "C64343",
                limit = false,
            },
        }
    },
    {
        name = "Trade Badges",
        description = "Badges that are awarded to members for their economic exploits. These badges will be used as a basis for promotions in the guild. Can be awarded once a week.",
        badges = {
            {
                name = "Vendor",
                description = "Has sold wares for more than 100k gold during a week.",
                color = "55C855",
                limit = 10,
                turnsInto = "Merchant"
            },
            {
                name = "Merchant",
                description = "Has received 10 Vendor badges.\nCounts as 10 badges.",
                color = "55C855",
                limit = 10,
                turnsInto = "Tycoon"
            },
            {
                name = "Top Trader",
                description = "Has been one of the top 5 sellers who sold wares for more than 100k gold during a week.",
                color = "55C855",
                limit = 10,
                turnsInto = "Entrepreneur"
            },
            {
                name = "Entrepreneur",
                description = "Has received 10 Top Trader badges.\nCounts as 10 badges.",
                color = "55C855",
                limit = 10,
                turnsInto = "Tycoon"
            },
            {
                name = "Tycoon",
                description = "Has either received 10 Merchant badges or 10 Entrepreneur badges.\nCounts as 100 badges.",
                color = "55C855",
                limit = false,
            },
        }
    },
    {
        name = "Donation Badges",
        description = "Badges that are awarded to members for their donations to the guild bank. These badges will be used as a basis for promotions in the guild. Can be awarded multiple times.",
        badges = {
            {
                name = "Subscriber",
                description = "Has donated more than 5k gold.",
                color = "97FFBE",
                limit = 10,
                turnsInto = "Supporter"
            },
            {
                name = "Supporter",
                description = "Has donated more than 50k gold.\nCounts as 10 badges.",
                color = "97FFBE",
                limit = 2,
                turnsInto = "Benefactor"
            },
            {
                name = "Benefactor",
                description = "Has donated more than 100k gold.\nCounts as 20 badges.",
                color = "97FFBE",
                limit = 5,
                turnsInto = "Investor"
            },
            {
                name = "Investor",
                description = "Has donated more than 500k gold.\nCounts as 100 badges.",
                color = "97FFBE",
                limit = 2,
                turnsInto = "Sponsor"
            },
            {
                name = "Sponsor",
                description = "Has donated more than 1m gold.\nCounts as 200 badges.",
                color = "97FFBE",
                limit = false,
            },
        }
    },
    {
        name = "Non-Ranked Badges",
        description = "Badges that identify your qualifications. These badges will NOT be used as a basis for promotions in the guild. To get one for yourself, contact an officer.",
        badges = {
            {
                name = "Master Crafter",
                description = "Can craft any equipments or consumables in any category.",
                color = "2DFFF8",
            },
            {
                name = "Trait Master",
                description = "Can provide research materials.",
                color = "2DFFF8",
            },
            {
                name = "Style Master",
                description = "Has discovered all the different crafting styles in the game.",
                color = "2DFFF8",
            },
            {
                name = "Blacksmith",
                description = "Creates weapons or heavy armor.",
                color = "5EB9D7",
            },
            {
                name = "Clothier",
                description = "Creates light or medium armor.",
                color = "5EB9D7",
            },
            {
                name = "Woodworker",
                description = "Creates staves or shields.",
                color = "5EB9D7",
            },
            {
                name = "Jeweler",
                description = "Creates necklaces or rings.",
                color = "5EB9D7",
            },
            {
                name = "Alchemist",
                description = "Brews potions or poisons.",
                color = "5EB9D7",
            },
            {
                name = "Enchanter",
                description = "Enchants glyphs.",
                color = "5EB9D7",
            },
            {
                name = "Provisioner",
                description = "Cooks food or brews drinks.",
                color = "5EB9D7",
            },
            {
                name = "Tank",
                description = "Takes the role of a tank in a dungeon or trial.",
                color = "FD7A1A",
            },
            {
                name = "Healer",
                description = "Takes the role of a healer in a dungeon or trial.",
                color = "FD7A1A",
            },
            {
                name = "Damage Dealer",
                description = "Takes the role of a damage dealer in a dungeon or trial.",
                color = "FD7A1A",
            },
            {
                name = "Vampire",
                description = "Can give you a free Vampire bite.",
                color = "879B7D",
            },
            {
                name = "Werewolf",
                description = "Can give you a free Werewolf bite.",
                color = "879B7D",
            },
        }
    },
    {
        name = "Misc",
        badges = {
            {
                name = "Away",
                description = "Is currently unavailable and will be back at the date specified next to the badge.",
                color = "C5C29E",
            },
            {
                name = "Warning",
                description = "Has broken guild rules and been warned via mail or chat.",
                color = "C5C29E",
                limit = 3,
            },
        },
    },
    {
        name = "|cFDFFBFCredits (Mouseover)|r",
        description = "|cFDFFBFAetherius Badge Filter by|r\n@Arkadius & @sirinsidiator\n\n|cFDFFBFBadges for Black Horse Courier by|r\n@CradonWar\n\nSpecial thanks to @sirinsidiator who helped us to upload data for Black Horse Courier.\n\nThanks for using this addon and being a member of our Guild!\n\n|cFDFFBFBlack Horse Courier - 2018|r",
        badges = {
        },
    },
})
