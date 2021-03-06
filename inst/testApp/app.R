library(shiny)
library(dplyr)
library(myGIO)

# addMapData <- function(geoJson, df){
#   geoJson$features <- lapply(geoJson$features, function(f){
#     f$properties$values <- df[df$KCTA_ID == f$properties$KCTA_ID, ]
#     return(f)
#   })
#   return(geoJson)
# }
#
# geoJson <- jsonlite::read_json("cta.geojson")


# Define UI for application that draws a histogram
ui <- fluidPage(

   # Application title
   titlePanel("Old Faithful Geyser Data"),

   # Sidebar with a slider input for number of bins
   sidebarLayout(
      sidebarPanel(width = 2,
         sliderInput("bins",
                     "Number of bins:",
                     min = 1,
                     max = 50,
                     value = 30)
      ),

      # Show a plot of the generated distribution
      mainPanel(
         myGIOOutput("map", height = '750px', width = "100%"),
         verbatimTextOutput("data")
      )
   )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

   addResourcePath("maps", "./maps" )

   output$map <- renderMyGIO({
     df <- data.frame(KCTA_ID = paste0("K", 101:350),
                      label = paste0("A", 101:350),
                      data = 101:150 * rnorm(5, mean = input$bins, sd = 2),
                      stringsAsFactors = FALSE)
     #finalData <- addMapData(geoJson, df)

      myGIO() %>%
        addBase(base = "resourceMap",
                data = df,
                geoJson = df,
                mapping = list(dataKey = "KCTA_ID",
                               dataValue = "data",
                               dataLabel = "KCTA_NAME",
                               mapKey = "KCTA_ID"),
                options = c(myGIO::setPolygonZoom(behavior = "click",zoomScale = 20),
                            nameFormat = 'text')
                ) %>%
         readGeoJSON("./maps/cta.geojson")
   })

   output$data <- renderPrint({
     input$mapTopo_selectedPolygon
   })

   output$mapTopo <- renderMyGIO({
      df <- data.frame(KCTA_ID = paste0("K", 101:350),
                       label = paste0("A", 101:350),
                       data = 101:150 * rnorm(5, mean = input$bins, sd = 2),
                       stringsAsFactors = FALSE)
      myGIO() %>%
         addBase(base = "resourceMapTopo",
                 data = df,
                 geoJson = df,
                 mapping = list(dataKey = "KCTA_ID",
                                dataValue = "data",
                                dataLabel = "KCTA_NAME",
                                mapKey = "KCTA_ID"),
                 options = c(myGIO::setPolygonZoom(behavior = "click",zoomScale = 15),
                             nameFormat = 'text')
         ) %>%
         readGeoJSON("./maps/tx_counties.topojson")
   })
}

# Run the application
shinyApp(ui = ui, server = server)

