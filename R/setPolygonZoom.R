#' setPolytonZoom()
#'
#' Sets the zoom behavior of polygons as layer option
#'
#' @param behavior a string indicating the desired zoom behavior for the layer: "center"
#' @param zoomScale is a numeric value setting the max value for the zooms scale
#'
#' @return list object with layer options
#' @export
setPolygonZoom <- function(behavior = "center", zoomScale = 2){
  settings <- list(setPolygonZoom = list(behavior = behavior,
                                         zoomScale = zoomScale))
  return(settings)
}
