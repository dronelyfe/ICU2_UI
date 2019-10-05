server <- function(input, output){
    
    output$apache_score <- renderSimpleNetwork({
        apache_vis_net
    })
}