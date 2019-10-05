icu_data <- read.csv('./ICU_dataset.csv')

## drop some useless columns
icu_data <- icu_data %>%
    select(-c("X", "apacheversion"))

icu_apache_90_x <- icu_data %>%
    subset(apachescore >= 90 & unitdischargestatus != "Alive")
icu_apache_50_x <- icu_data %>%
    subset(apachescore <= 50 & unitdischargestatus != "Alive")

icu_data %>% nrow()
icu_apache_90_x %>% nrow()
icu_apache_50_x %>% nrow()