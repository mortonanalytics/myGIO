#' readGeoJSON()
#'
#' reads a geoJSON file from a specific path
#'
#' @param myGIo the widget object
#' @param file_path
#'
#' @return myGIO object with base layer attached
#' @export
readGeoJSON <- function(myGIO, file_path){

  #assert layer type
  myGIO$x$options$file_path <- file_path

  return(myGIO)
}
