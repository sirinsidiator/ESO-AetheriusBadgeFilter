AetheriusBadgeFilter:RegisterGuild(AetheriusBadgeFilter.SERVER_EU, "Aetherius Trade", {
    {
        name = "Crafting Badges",
        badges = {
            {
                name = "Craft God",
                description = "Has mastered every crafting discipline and can craft every single item in each of them.",
                relations = {"Master Alchemist", "Master Chef", "Master Crafter", "Master Enchanter", "Master Stylist"},
            },
            {
                name = "Master Alchemist",
                description = "Has mastered alchemy and can mix the most powerful potions and poisons.",
            },
            {
                name = "Master Chef",
                description = "Has learned more than 90% of all recipes, can cook the most delicious food and brew the most refreshing drinks.",
            },
            {
                name = "Ultimate Chef",
                description = "Has learned all Ambrosia recipes and can brew it.",
            },
            {
                name = "Master Crafter",
                description = "Has researched all 9 traits for every single item type.",
            },
            {
                name = "Master Enchanter",
                description = "Has knowledge of all rune types and can craft the best glyphs.",
            },
        }
    },
    {
        name = "Social Badges",
        badges = {
            {
                name = "Activist",
                description = "Has participated in a guild event, poll or similar. Can be awarded multiple times.",
            },
            {
                name = "Ancient One",
                description = "Has been in the guild for more than one year.",
            },
            {
                name = "Gold Member",
                description = "Has been in the guild since its foundation.",
            },
            {
                name = "Gold'n'Glory",
                description = "Has donated more than 100k gold to the guild bank.",
            },
            {
                name = "Golden Mark",
                description = "Has donated more than 500k gold to the guild bank.",
            },
            {
                name = "Veteran",
                description = "Has been in the guild for more than 30 weeks.",
            },
            {
                name = "Guild's Pride",
                description = "Has aided the guild or community in a special way. Has a different set of rules applied. You can only get this badge from officers.",
            },
        }
    },
    {
        name = "Trade Badges",
        badges = {
            {
                name = "Perfect Merchant",
                description = "52 trading weeks or more at February 2018 start. * for twice.",
                limit = false,
            },
            {
                name = "Favorite of Zenithar",
                description = "Has been blessed by Zenithar in reward for earnest work and honest profit.\nHas earned 'Blessed by Gold' rank.\nCan be awarded multiple times.",
                limit = false,
            },
            {
                name = "Master Trader",
                description = "Has earned the guild rank 'Master Trader'.\nCan be awarded multiple times.",
                limit = 10,
                turnsInto = "Platinum Trader"
            },
            {
                name = "Platinum Trader",
                description = "Has earned the 'Master Trader' badge 10 times. Can be awarded multiple times.",
            },
        },
    },
    {
        name = "Utility Badges",
        badges = {
            {
                name = "Notification",
                description = "Has broken guild rules. A notification has been sent via mail.",
            },
            {
                name = "Novice",
                description = "New in guild.",
            },
        },
    },
})
