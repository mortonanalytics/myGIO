#' addBase()
#'
#' Adds the base layer map
#'
#' @param myGIo the widget object
#' @param base a string indicating the base map to be used
#' @param data is a dataframe to be mapped tot he base layer
#' @param mapping is a list object mapping the data to the map features; requires a data key and map key
#' @param options is a vector of objects to set and assign layer behaviors
#'
#' @return myGIO object with base layer attached
#' @export
addBase <- function(myGIO, base, data = NULL, mapping = NULL, options = NULL){

  #assert layer type
  stopifnot(is.character(base))
  stopifnot(base %in% c("world", "us", "zipChloropleth"))

  layer <- list(
    type = "base",
    map = base,
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
