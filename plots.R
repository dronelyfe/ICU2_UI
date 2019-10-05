source('./data.R')

apache_net_target <- c(
    "pao2", "temperature",
    "meanbp", "ph", "heartrate",
    "respiratoryrate", "sodium",
    "hematocrit", "wbc", "gcs",
    "eye", "motor", "verbal"
)

apache_net_src <- c(
    replicate(
        10,
        "apachescore"
    ), "gcs", "gcs", "gcs"
)

apache_net <- data.frame(apache_net_src, apache_net_target)

apache_vis_net <- simpleNetwork(
    Data = apache_net,
    height = NULL,
    width = NULL,
    linkDistance = 150
)

apache_vis_net$x$links$colour <- c(replicate(13, "#300"))


############################ Jeremy Plots:

### Stacked barplot for visualizing contribution to
### Data Preparation:
# Fake weighted values (weight times value), representing the contribution of variables to the apache score
## note: this will only apply to numeric variables, and categorical vars will need to be displayed differently

df2 <- data.frame("v1" = 22, "v2" = 23, "v4" = 8, "v5" = 12, "v6" = 13, "v7" = 6, "v8" = 14, "v9" = 4, 'v10' = 2, "v11" = 18, "v13"= 7, "v14" = 3, "v15" = 1, "v16" = 13, "v17" = 8, "v19" = 2, "v20" = 9, "v21" = 2, "v22"= 6, "v23" = 8, "v24" = 10, "v25" = 13)

df2 <- gather(df2, "Variable", "Weighted_Value")

# Normalize so that the weighted vairables add to less than 1 (a "possible"" probability)
df2$Weighted_Value <- (df2$Weighted_Value)/sum(df2$Weighted_Value) -.002

# Add a dummy variable to use as an x location for the bar. This variable has no real meaning, but is needed because geom_bar excpects multiple bars, but we are plotting only one
df2$dummy <- "dummy"

### PLOT STACKED BARACHART:

p_stacked <- ggplot(data = df2, aes(x= dummy, y = Weighted_Value, fill = Variable)) +
  geom_bar(position = "stack", stat = 'identity', width = .3) +
  theme(panel.background = element_blank(),
        axis.line.x = element_blank(),
        axis.line.y = element_line(colour = "grey40", size = .2),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank(),
        axis.title.x = element_blank(),
        legend.position = "right") +
  scale_y_continuous(expand = c(0, 0)) +
  labs(y = "Contribution to Predicted 48h Mortality") +
  scale_fill_manual(values= c("#1B9E77", "#D95F02", "#7570B3", "#E7298A", "#66A61E", "#E6AB02", "#A6761D", "#666666", "cadetblue3", "darkslateblue", 'deeppink2', "chocolate3", "chartreuse4", "lightgoldenrod3", "pink2", "tomato3", "darkorchid3", "blue4", "coral4", "slategrey", "aquamarine2", "yellow3", "firebrick3", "lightgreen", "goldenrod4", "olivedrab1"))

### PLOT WEIGHTED VARIBALE LEVELS AND ACTUAL VARIABLE LEVELS FOR TOP 5 CONTRIBUTORS TO RISK OF DEATH

## DATA PREPERATION:

weight <- c("unweighted", "weighted")

v1 <-  runif(1, 10, 20)
v1 <- c(v1, v1*1.8)

v2 <-  runif(1, 20, 30)
v2 <- c(v2, v2*1.2)

v3 <-  runif(1, 50, 60)
v3 <- c(v3, v3*(-1))

v4 <-  runif(1, 17, 19)
v4 <- c(v4, v4*1.7)

v5 <-  runif(1, 50, 70)
v5 <- c(v5, v5*1.6)

df <- data.frame(v1, v2, v3, v4, v5, weight)
df <- gather(df, variable, value, 1:5)

## PLOT THE VARIABLES AND WEIGHTED VARIABLES
p <- ggplot(data = df, aes(fill = weight, x= variable , y= value)) +
  geom_bar(position = "dodge", stat="identity", alpha = 1, width = .75) +
  ggtitle("Mock Plot") +
 # scale_y_continuous(limits = c(0, 72), breaks = seq(0, 70, 10)) +
  labs(x = "Variable", y = "Value") +
  theme(panel.background = element_blank(),
        axis.line.x = element_line(colour = "grey40", size = .2),
        axis.line.y = element_line(colour = "grey40", size = .2))

### PLOT THE ACTUAL APACHE SCORE AGAINST THE MEAN APACHE SCORE
## DATA PREPERATION
comparison <- 40
df_apache <- data.frame(Apache = c("apache"), Value = c(55))
## PLOT APACHE SCORE AND MEAN APACHE SCORE
p2 <- ggplot(data = df_apache, aes(y = Value, x = Apache)) +
  geom_hline(yintercept = comparison, linetype = 2, color = "red") +
  geom_bar(stat = "identity", width = .2, alpha = .9) +
  scale_y_continuous(limits = c(0, 75), expand = c(0, 0)) +
  theme(panel.background = element_blank(),
        axis.line.x = element_line(colour = "grey40", size = .2),
        axis.line.y = element_line(colour = "grey40", size = .2),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank())
