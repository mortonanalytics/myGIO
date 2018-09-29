#' <Add Title>
#'
#' <Add Description>
#'
#' @import htmlwidgets
#'
#' @param data a data frame
#' @param width a string indicating pixels or percent width
#' @param height a string indicating pixels height
#' @param elementId a unique htmlwidgets identifier
#'
#' @return myGIO object
#'
#' @export
myGIO <- function(data = NULL, width = NULL, height = NULL, elementId = NULL) {
  # preset options
  options <- list(
    margins = list(top = 0, bottom = 0, right = 0, left = 0)
  )
  # forward options using x
  x = list(
    data = data,
    options = options
  )

  # create widget
  htmlwidgets::createWidget(
    name = 'myGIO',
    x,
    width = width,
    height = height,
    package = 'myGIO',
    elementId = elementId
  )
}

#' Shiny bindings for myGIO
#'
#' Output and render functions for using myGIO within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a myGIO
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name myGIO-shiny
#'
#' @export
myGIOOutput <- function(outputId, width = '100%', height = '400px'){
  htmlwidgets::shinyWidgetOutput(outputId, 'myGIO', width, height, package = 'myGIO')
}

#' @rdname myGIO-shiny
#' @export
renderMyGIO <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, myGIOOutput, env, quoted = TRUE)
}
