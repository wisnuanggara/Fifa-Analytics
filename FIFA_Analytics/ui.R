library(tidyverse) 
library(magrittr)
library(DataExplorer)
library(maps)
library(plotly)
library(DT)
library(tidytext)
library(gridExtra)
library(factoextra)
library(shiny)
library(shinydashboard)

shinyUI(
  dashboardPage(
    dashboardHeader(
      title = "FIFA Analytics"),
    dashboardSidebar(
      sidebarMenu(
        menuItem("Home", tabName = "dashboard", icon = icon("dashboard")),
        menuItem("Players", tabName = "widgets", icon = icon("walking")),
        menuItem("Teams", tabName = "teams", icon = icon("users")),
        menuItem("Analytics", tabName = "analytics", icon = icon("chart-area"))
      )
    ),
    dashboardBody(
      tabItems(
        tabItem(tabName = "dashboard",
                fluidRow(
                  box(title = "Age Distribution", status = "primary", solidHeader = TRUE, plotOutput("ageDist")),
                  box(title = "Market Distribution", status = "primary", solidHeader = TRUE, plotOutput("marketDist")),
                  box(title = "World Map Distribution", status = "primary", solidHeader = TRUE, plotOutput("worldMap")),
                  box(title = "Compare Potensial ", status = "primary", solidHeader = TRUE, plotOutput("comparePotensialPlot")),
                  box(title = "Position Distribution", status = "primary", solidHeader = TRUE, plotOutput("distriPosition")),
                  box(
                    title = "Average Summary Position", status = "primary", solidHeader = TRUE,
                    selectInput("leagueInput", label = "Select League", 
                                choices = list("Bundesliga" = "Bundesliga", 
                                               "Premier League" = "Premier League",
                                               "La Liga" = "La Liga",
                                               "Serie A" = "Serie A",
                                               "Ligue 1" = "Ligue 1", 
                                               "Liga Nos" = "Liga Nos",
                                               "Eredivisie" ="Eredivisie"
                                               ), 
                                selected = "Premier League"),
                    plotOutput("averageSummaryPosition")
                  ),
                )
        ),
        
        tabItem(tabName = "widgets",
                fluidRow(
                  box(
                    width=12,
                    title = "Compare Player", status = "primary", solidHeader = TRUE,
                    textInput("caption", "Player 1", "L. Messi"),
                    textInput("caption2", "Player 2", "Cristiano Ronaldo"),
                    plotOutput("comparePlot"),
                    ),
                  box(
                    title = "Best Ability", status = "primary", solidHeader = TRUE,
                    selectInput("abilityTypeInput", label = "Select League", 
                                choices = list("Goal Keeper" = "Goal Keeper", 
                                               "Defender" = "Defender",
                                               "Midfielder" = "Midfielder",
                                               "Forward" = "Forward"
                                ), 
                                selected = "Forward"),
                    plotOutput("bestAbillity")
                  ),
                  box(
                    title = "Position Ability", status = "primary", solidHeader = TRUE,
                    textInput("positionInput", "Player", "Neymar Jr"),
                    plotOutput("positionPlot"),
                  )
                )
        ),
        
        tabItem(tabName = "teams",
                fluidRow(
                  box(
                    title = "BMI Disribution", status = "primary", solidHeader = TRUE,
                    textInput("bmiInput", "Team", "Liverpool"),
                    plotOutput("bmiPlot"),
                  ),
                  box(
                    title = "Best Team Players", status = "primary", solidHeader = TRUE,
                    textInput("bestTeamsInput", "Team", "Liverpool"),
                    plotOutput("bestTeamsPlot"),
                  ),
                  box(
                    title = "Similar Players", status = "primary", solidHeader = TRUE,
                    textInput("similiarInput", "Player Name", "Cristiano Ronaldo")
                  ),
                  box(
                    title = "Similar Players", status = "primary", solidHeader = TRUE,
                    textInput("similiarInput2", "Player Name", "L. Messi")
                  ),
                  box(
                    width = 12,
                    title = "Similar Players", status = "primary", solidHeader = TRUE,
                    plotOutput("similarPlayer")
                  )
                )
        ),
        tabItem(tabName = "analytics",
                fluidRow(
                  box(
                    title = "Relation Position & Reputation", status = "primary", solidHeader = TRUE,
                    width=12,
                    plotOutput("relationPosRepu"),
                  ),
                  box(
                    title = "Age & Overall Distribution", status = "primary", solidHeader = TRUE,
                    width=12, 
                    plotOutput("avgAgeOverall"),
                  ),
                  box(
                    title = "Top Wonderkids", status = "primary", solidHeader = TRUE,
                    width=12,
                    plotOutput("topWonderkids")
                  )
          )
        )
      )
    )
  )
)
