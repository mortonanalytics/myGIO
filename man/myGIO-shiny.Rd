% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/myGIO.R
\name{myGIO-shiny}
\alias{myGIO-shiny}
\alias{myGIOOutput}
\alias{renderMyGIO}
\title{Shiny bindings for myGIO}
\usage{
myGIOOutput(outputId, width = "100\%", height = "400px")

renderMyGIO(expr, env = parent.frame(), quoted = FALSE)
}
\arguments{
\item{outputId}{output variable to read from}

\item{width, height}{Must be a valid CSS unit (like \code{'100\%'},
\code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
string and have \code{'px'} appended.}

\item{expr}{An expression that generates a myGIO}

\item{env}{The environment in which to evaluate \code{expr}.}

\item{quoted}{Is \code{expr} a quoted expression (with \code{quote()})? This
is useful if you want to save an expression in a variable.}
}
\description{
Output and render functions for using myGIO within Shiny
applications and interactive Rmd documents.
}
