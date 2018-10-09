#' assignPolygonFill()
#'
#' Assigns color to a vector of polygons as layer option
#'
#' @param ids a vector of polygon ids to fill
#' @param propertyId is a string indicating the polygon property for matching the id
#' @param color is a string with any HTML/CSS recognized color
#'
#' @return list object with layer options
#' @export
assignPolygonFill <- function(ids, propertyId, color = "steelblue"){
  settings <- list(assignPolygonFill = list(ids = ids, propertyId = propertyId, color = color))
  return(settings)
}
