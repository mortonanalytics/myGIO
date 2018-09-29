#' addLayer()
#'
#' Adds a layer to the map
#'
#' @param myGIo the widget object
#' @param type a string indicating the layer to be added ("world", "us")
#' @param data is a dataframe to be mapped tot he base layer
#' @param mapping is a list object mapping the data to the map features; requires a data key and map key
#'
#' @return myGIO object with base layer attached
#' @export
addLayer <- function(myGIO, type, data = NULL, mapping = NULL){

  #assert layer type
  stopifnot(is.character(type))
  stopifnot(type %in% c("polygon", "point", "line"))

  layer <- list(
    type = type,
    data = data,
    mapping = mapping
  )

  ##put the layers together

  if(length(myGIO$x$layers) > 0){
    myGIO$x$layers <- c(myGIO$x$layers, list(layer))
  } else {
    myGIO$x$layers <- list(layer)
  }

  return(myGIO)
}
