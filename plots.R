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