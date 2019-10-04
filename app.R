library(tidyverse)
library(shiny)
library(shinydashboard)
library(plotly)
library(shinycssloaders)
library(networkD3)

source('./plots.R')
source('./server.R')
source('./UI.R')

shinyApp(ui, server)