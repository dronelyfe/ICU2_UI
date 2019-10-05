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
    collapsed = TRUE,
    sidebarMenu(
        ## sidebar controls go here
    )
)
## infoBoxes??? for displaying crucial metrics maybe???
body <- dashboardBody(
    fluidRow(
        box(
            simpleNetworkOutput("apache_score") %>% withSpinner(),
            title = "",
            width = 6
        ),
        box(
            title = "",
            width = 6
        )
    )
)