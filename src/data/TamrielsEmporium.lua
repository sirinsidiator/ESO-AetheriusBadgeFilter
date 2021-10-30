AetheriusBadgeFilter:RegisterGuild(
    AetheriusBadgeFilter.SERVER_EU,
    "Tamriels Emporium",
    {
        {
            name = "Special",
            badges = {
                {
                    name = "Partisan",
                    description = "Awarded to a very select individual who has been |cB45F04incredibly supportive|r to the guild or has helped the guild in an |cB45F04extraordinary way|r! This is the |cB45F04highest honor|r one can receive in this guild. ",
                    color = "B45F04"
                },
                {
                    name = "Champion",
                    description = "Has currently the |cb8860bhighest sales in one week of any individual ever|r. This badge can only be given to one player at a time. Once the record is broken this badge will be given to the new record holder. ",
                    color = "b8860b"
                },
                {
                    name = "Friend",
                    description = "Friend to the Guildmaster.",
                    color = "4257E0"
                },
                {
                    name = "Eternal",
                    description = "|c268077Lifetime Member|r Can only be kicked through inactivity!",
                    color = "268077"
                },
                {
                    name = "Elder",
                    description = "Member for atleast |c00BFFF180 Days.|r",
                    color = "00BFFF"
                },
                {
                    name = "Loyalist",
                    description = "Member of |c743696multiple Guilds|r under our Leadership.",
                    color = "743696",
                    limit = 4
                }
            }
        },
        {
            name = "Donations",
            badges = {
                {
                    name = "Supporter",
                    description = "Donated over |cFE2EC850k.|r",
                    color = "FE2EC8",
                    limit = 2,
                    turnsInto = "ArchSupporter"
                },
                {
                    name = "ArchSupporter",
                    description = "Donated over |cFA58AC100k.|r",
                    color = "FA58AC",
                    limit = 5,
                    turnsInto = "Patron"
                },
                {
                    name = "Patron",
                    description = "Donated over |c5FB404500k.|r",
                    color = "5FB404",
                    limit = 2,
                    turnsInto = "ArchPatron"
                },
                {
                    name = "ArchPatron",
                    description = "Donated over |c088A081M.|r",
                    color = "088A08",
                    limit = 999
                }
            }
        },
        {
            name = "Trading",
            badges = {
                {
                    name = "Top Trader",
                    description = "Has been one of the |cF5DA813 Top-Traders|r in one trading week. Can be awarded multiple times.",
                    color = "F5DA81",
                    limit = 999
                },
                {
                    name = "Emerald Trader",
                    description = "Reached |c50C8785 Million|r sales in one trading week. After reaching 10 of these badges, will turn into Saint!",
                    color = "50C878",
                    limit = 10,
                    turnsInto = "Saint"
                },
                {
                    name = "Saint",
                    description = "Has been 10 times |c50C878Emerald Trader|r. Can be awarded multiple times.",
                    color = "3B7A57",
                    limit = 999
                },
                {
                    name = "Ruby Trader",
                    description = "Reached |cF6221710 Million|r sales in one trading week. After reaching 10 of these badges, will turn into |c660000Mogul|r! \n\nAdded August 2021",
                    color = "F62217",
                    limit = 10,
                    turnsInto = "Mogul"
                },
                {
                    name = "Mogul",
                    description = "Has been 10 times |cF62217Ruby Trader|r. Can be awarded multiple times.",
                    color = "660000",
                    limit = 999
                }
            }
        } --[[  ,
        {
            name = "Info",
            badges = {
                {
                    name = "Offlinemode",
                    description = "Plays in Offlinemode",
                    color = "FF0000"
                }
            }, ]],
        {
            name = "Deprecated",
            badges = {
                {
                    name = "Diamond Trader",
                    description = "Reached |c3EAED01 Million sales|r in one trading week. After reaching 10 of these badges, will turn into Magnate \n\n|cff0000Deprecated October 2021|r",
                    color = "3EAED0",
                    limit = 10,
                    turnsInto = "Magnate"
                },
                {
                    name = "Magnate",
                    description = "Has been 10 times |c3EAED0Diamond Trader|r. Can be awarded multiple times.",
                    color = "4997D0",
                    limit = 999
                }
            }
        }
    }
)
