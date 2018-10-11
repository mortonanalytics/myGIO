#' setPolytonZoom()
#'
#' Sets the zoom behavior of polygons as layer option
#'
#' @param behavior a string indicating the desired zoom behavior for the layer: "center"
#' @param zoomScale is a numeric value setting the max value for the zooms scale
#'
#' @return list object with layer options
#' @export
setPolygonZoom <- function(behavior = "center", ids = NULL, zoomScale = 2){
  stopifnot(class(behavior) == "character")
  settings <- list(setPolygonZoom = list(behavior = behavior,
                                         ids = ids,
                                         zoomScale = zoomScale))
  return(settings)
}
