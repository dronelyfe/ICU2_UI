header <- dashboardHeader(
    title = "I C U 2",
    
    dropdownMenu(
        type = "notifications"
        ## notification alert items go here
    ),

    dropdownMenu(
        type = "tasks"
        ## items with progress bars here; 
    ),

    dropdownMenu(
        type = "messages"
    )
)

sidebar <- dashboardSidebar(
    menuItem(
        "Primary Metrics",
        tabName = "primary"
    ),
    menuItem(
        "Secondary Metrics",
        tabName = "secondary"
    )
)

## infoBoxes??? for displaying crucial metrics maybe???
body <- dashboardBody(
    tabItem(
        tabName = "primary",
        fluidRow(
            box(
                title = "",
                width = 2
            ),
            box(
                title = "",
                width = 2
            ),
            box(
                title = "",
                width = 2
            ),
            box(
                title = "",
                width = 2
            ),
            box(
                title = "",
                width = 2
            ),
            box(
                title = "",
                width = 2
            )
        )
    ),

    tabItem(
        tabName = "secondary",
        fluidRow(
            box(
                title = "",
                width = 2
            ),
            box(
                title = "",
                width = 2
            ),
            box(
                title = "",
                width = 2
            ),
            box(
                title = "",
                width = 2
            ),
            box(
                title = "",
                width = 2
            ),
            box(
                title = "",
                width = 2
            ) ## fill rows with boxes, nest plotOutput inside the box!
        )
    )
)