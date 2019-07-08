AetheriusBadgeFilter:RegisterGuild(AetheriusBadgeFilter.SERVER_EU, "Eternal Forest Merchantry", {
    {
        name = "Special Badges",
        badges = {
            {
                name = "Friend",
                description = "Friend to the Guildmaster.",
                color = "00FFFF",
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
                name = "Supporter",
                description = "Donated over 10k.",
                color = "FE2EC8",
            },
            {
                name = "Arch-Supporter",
                description = "Donated over 50k.",
                color = "FA58AC",
            },
            {
                name = "Patron",
                description = "Donated over 100k.",
                color = "5FB404",
            },
            {
                name = "Arch-Patron",
                description = "Donated over 500k.",
                color = "38610b",
            },
        }
    },
    {
        name = "Trading Badges",
        badges = {
            {
                name = "Platinum Trader",
                description = "Reached 500k sales/week. Can be awarded multiple times.",
                color = "FFFFFF",
                limit = false,
            },
            {
                name = "Diamond Trader",
                description = "Has been Top-Trader in one trading week. Can be awarded multiple times.",
                limit = 10,
                color = "A9E2F3",
                turnsInto = "Saint",
            },
            {
                name = "Saint",
                description = "Has been 10 times Top-Trader. Can be awarded multiple times.",
                color = "F3F781",
                limit = false,
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
                limit = 10,
                color = "DF0101",
            },
            {
                name = "Craftsman",
                description = "Can Craft any Item in the Game and is willing to Craft things for another Person for a small Fee.",
                color = "FE2EF7",
            },
        }
    },
})
