cars <- mpg
flowers <- iris

## ex. mockup for now; We just want to try out some geometries and such
## then, we can be ready to just slot our production plots right in.
carplot <- ggplot(
    data = cars, 
    aes(x = model)) + 
    geom_bar() +
    theme(
        axis.text.x = element_blank()
    )

## plots for primary tab, 'plot' to be replaced with metric or variable name when ready
## fill out with aesthetic mappings and geometries
primary_plot_1 <- ggplot() 
primary_plot_2 <- ggplot()
primary_plot_3 <- ggplot()
primary_plot_4 <- ggplot()
primary_plot_5 <- ggplot()
primary_plot_6 <- ggplot()

## plots for secondary tab, 'plot' to be replaced with metric or variable name when ready
secondary_plot_1 <- ggplot()
secondary_plot_2 <- ggplot()
secondary_plot_3 <- ggplot()
secondary_plot_4 <- ggplot()
secondary_plot_5 <- ggplot()
secondary_plot_6 <- ggplot()