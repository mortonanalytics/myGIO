#' addBase()
#'
#' Adds the base layer map
#'
#' @param myGIo the widget object
#' @param base a string indicating the base map to be used
#'
#' @return myGIO object with base layer attached
#' @export
addBase <- function(myGIO, base){

  #assert layer type
  stopifnot(is.character(base))
  stopifnot(base %in% c("world", "us"))

  layer <- list(
    type = "base",
    map = base
  )
}
