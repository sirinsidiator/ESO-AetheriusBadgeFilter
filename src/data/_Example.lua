AetheriusBadgeFilter:RegisterGuild("Your Guild Name", {
    {
        badges = {
            {
                name = "MyBadge", -- mandatory field, this name must match what is used in the badge list
                description = "My Description", -- optional, shows a tooltip when hovering the mouse over the entry in the filter list
                color = "FF0000", -- optional, if not specified it will use the first color found in the notes, or the normal text color if the badge is not in use
                relations = {"MyOtherBadge"}, -- optional, allows to show other badges simultaneously when this badge is selected
            },
            {
                name = "MyOtherBadge",
            },
        }
    },
    {
        name = "MyGroup", -- optional, groups without a name do not have a header. This is only really useful for the first group in the list.
        description = "My Group Description", -- optional, shows a tooltip when hovering the mouse over the entry in the filter list
        badges = {
            {
                name = "MyGroupBadge",
            },
        }
    },
})
