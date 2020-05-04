AetheriusBadgeFilter:RegisterGuild(AetheriusBadgeFilter.SERVER_EU, "The Noble Merchants", {
    {
        name = "Special Badges",
        badges = {
            {
                name = "Friend",
                description = "Friend to the Guildmaster.",
                color = "4257E0",
            },
            {
                name = "Elder",
                description = "Member for atleast 180 Days.",
                color = "00BFFF",
            },
            {
                name = "Loyalist",
                description = "Member of multiple TTT Guilds.",
                color = "743696",
            },
        }
    },
    {
        name = "Donor Badges",
        badges = {
            {
                name = "Supporter",
                description = "Donated over 10k.",
                color = "FE2EC8",
                limit = 5,
                turnsInto = "Arch-Supporter",
            },
            {
                name = "Arch-Supporter",
                description = "Donated over 50k.",
                color = "FA58AC",
                limit = 2,
                turnsInto = "Patron",
            },
            {
                name = "Patron",
                description = "Donated over 100k.",
                color = "5FB404",
                limit = 5,
                turnsInto = "Arch-Patron",
            },
            {
                name = "Arch-Patron",
                description = "Donated over 500k.",
                color = "38610b",
                limit = 999,
            },
            {
                name = "Noble",
                description = "Lifetime Member! Can only be kicked through inactivity! (300k Donation at once)",
                color = "B40404",
            },
        }
    },
    {
        name = "Trading Badges",
        badges = {
            {
                name = "Elite Trader",
                description = "Has been Top-Trader in one trading week. Can be awarded multiple times.",
                color = "A9E2F3",
                limit = 999,
            },
            {
                name = "Diamond Trader",
                description = "Reached 1 Million sales in one trading week. Can be awarded multiple times.",
                color = "FFFFFF",
                limit = 10,
                turnsInto = "God of Sales",
            },
            {
                name = "God of Sales",
                description = "Has been 10 times Diamond Trader. Can be awarded multiple times.",
                color = "F2F5A9",
                limit = 10,
                turnsInto = "Saint",
            },
            {
                name = "Saint",
                description = "Has been 10 times God of Sales. Can be awarded multiple times.",
                color = "DFDF01",
                limit = 999,
            },
        }
    },
    {
        name = "Supportive Badges",
        badges = {
            {
                name = "Pack Leader",
                description = "Is a Werewolf and is willing to bite another Person.",
                color = "81DAf5",
            },
            {
                name = "Blood-Sucker",
                description = "Is a Vampire and is willing to bite another Person.",
                color = "DF0101",
            },
            {
                name = "Craftsman",
                description = "Can Craft any Item in the Game and is willing to Craft things for another Person for a small Fee.",
                color = "FE2EF7",
            },
        }
    },
    {
        name = "Info Badges",
        badges = {
            {
                name = "Offlinemode",
                description = "Plays in Offlinemode",
                color = "FF0000",
            },
        }
    },
})
