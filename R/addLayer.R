#' addLayer()
#'
#' Adds a layer to the map
#'
#' @param myGIo the widget object
#' @param type a string indicating the layer to be added ("world", "us")
#' @param label a string unique to the layer for the chart
#' @param data is a dataframe to be mapped tot he base layer
#' @param mapping is a list object mapping the data to the map features; requires a data key and map key
#' @param options is a vector of objects to set and assign layer behaviors
#'
#' @return myGIO object with base layer attached
#' @export
addLayer <- function(myGIO, type, label, data = NULL, mapping = NULL, options = NULL){

  #assert layer type
  stopifnot(is.character(type))
  stopifnot(type %in% c("polygon", "point", "line"))

  #if options are null, fill default options with null
  if(is.null(options)){
    empty_options <- list(assignPolygonFill = NULL,
                          setPolygonZoom = NULL)
    options <- empty_options
  }

  # create layer
  layer <- list(
    type = type,
    label = label,
    data = data,
    mapping = mapping,
    options = options
  )

  ##put the layers together

  if(length(myGIO$x$layers) > 0){
    myGIO$x$layers <- c(myGIO$x$layers, list(layer))
  } else {
    myGIO$x$layers <- list(layer)
  }

  return(myGIO)
}
