AetheriusBadgeFilter:RegisterGuild(AetheriusBadgeFilter.SERVER_EU, "Eternal Forest Merchantry", {
    {
        name = "Special",
        badges = {
            {
                name = "Partisan",
                description = "Awarded to a very select individual who has been incredibly supportive to the guild or has helped the guild in an extraordinary way! This is the highest honor one can receive in this guild. ",
                color = "B45F04",
            },
            {
                name = "Champion",
                description = "Has currently the highest sales in one week of any individual ever. This badge can only be given to one player at a time. Once the record is broken this badge will be given to the new record holder. ",
                color = "b8860b",
            },
            {
                name = "Friend",
                description = "Friend to the Guildmaster.",
                color = "4257E0",
            },
            {
                name = "Eternal",
                description = "Lifetime Member! Can only be kicked through inactivity! (250k Donation at once )",
                color = "268077",
            },
            {
                name = "Founder",
                description = "One of the first 50 Members of this Guild.",
                color = "D7DF01",
            },
            {
                name = "Elder",
                description = "Member for atleast 180 Days.",
                color = "00BFFF",
            },
            {
                name = "Loyalist",
                description = "Member of multiple Guilds under our Leadership.",
                color = "743696",
                limit = 4
            },
        },
    },
    {
        name = "Donations",
        badges = {
            {
                name = "Supporter",
                description = "Donated over 50k.",
                color = "FE2EC8",
                limit = 2,
                turnsInto = "Arch-Supporter",
            },
            {
                name = "Arch-Supporter",
                description = "Donated over 100k.",
                color = "FA58AC",
                limit = 5,
                turnsInto = "Patron",
            },
            {
                name = "Patron",
                description = "Donated over 500k.",
                color = "5FB404",
                limit = 2,
                turnsInto = "Arch-Patron",
            },
            {
                name = "Arch-Patron",
                description = "Donated over 1M.",
                color = "088A08",
                limit = 999,
            },
        }
    },
    {
        name = "Trading",
        badges = {
            {
                name = "Elite Trader",
                description = "Has been one of the 3 Top-Traders in one trading week. Can be awarded multiple times.",
                color = "A9E2F3",
                limit = 999,
            },
            {
                name = "Diamond Trader",
                description = "Reached 1 Million sales in one trading week. After reaching 10 of these badges, will turn into Magnate",
                color = "3EAED0",
                limit = 10,
                turnsInto = "God of Sales",
            },
            {
                name = "God of Sales",
                description = "Has been 10 times Diamond Trader. Can be awarded multiple times.",
                color = "4997D0",
                limit = 999,
            },
            {
                name = "Emerald Trader",
                description = "Reached 5 Million sales in one trading week. After reaching 10 of these badges, will turn into Saint!",
                color = "50C878",
                limit = 10,
                turnsInto = "Saint",
            },
            {
                name = "Saint",
                description = "Has been 10 times Emerald Trader. Can be awarded multiple times.",
                color = "3B7A57",
                limit = 999,
            },
        }
    },
    {
        name = "Support",
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
        name = "Info",
        badges = {
            {
                name = "Offlinemode",
                description = "Plays in Offlinemode",
                color = "FF0000",
            },
        }
    },
})
