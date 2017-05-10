AetheriusBadgeFilter:RegisterGuild(AetheriusBadgeFilter.SERVER_EU, "Just Traders", {
    {
        name = "Social",
        badges = {       
            {
                name = "Elder",
                description = "Is since min. 200 days member of the guild.",
            },  
            {
                name = "Veteran",
                description = "Is since min. 100 days member of the guild.",
            }, 
            {
                name = "Set-Provider",
                description = "Has following Crafting-Stations in his house accessible for everyone in this guild.",
            },
            {
                name = "Donator",
                description = "Donated over 100k.",
            },
            {
                name = "Generous Donator",
                description = "Donated over 250k.",
            },
            {
                name = "Patron",
                description = "Donated over 500k.",
            },  
            {
                name = "Generous Patron",
                description = "Donated over 1kk.",
            },
        }
    },
    {
        name = "Trading",
        badges = {
            {
                name = "Aspirant",
                description = "Reached 500k sales/week. Can be awarded multiple times.",
                limit = false,
            },
            {
                name = "Glorious",
                description = "Reached 1kk sales/week. Can be awarded multiple times.",
                limit = 10,
                turnsInto = "Premium Trader"
            },
            {
                name = "Premium Trader",
                description = "Reached 1kk sales/week 10 times.",
                limit = false,
            },
            {
                name = "Master Trader",
                description = "Has been Top-Trader in one trading week. Can be awarded multiple times.",
                limit = 10,
                turnsInto = "Trading Monster"
            },
            {
                name = "Trading Monster",
                description = "Has been 10 times Top-Trader. Can be awarded multiple times.",
                limit = false,
            },
        }
    },
})
