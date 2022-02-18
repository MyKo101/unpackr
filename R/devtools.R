#' devtools
#' @name devtools
#'
#' @title devtool functions
#'
#' @description
#' Functions from devtools which will unpack/pack before and after execution.
#' See the devtools documentation for each of them.
#'
#' @param ... Arguments passed to devtools functions
#'
NULL

#' @export
#' @rdname devtools
install <- function(...){
  unpack()
  on.exit(pack())
  devtools::install(...)
}

#' @export
#' @rdname devtools
load_all <- function(...){
  unpack()
  on.exit(pack())
  devtools::load_all(...)
}

#' @export
#' @rdname devtools
document <- function(...){
  unpack()
  on.exit(pack())
  devtools::document(...)
}

#' @export
#' @rdname devtools
check <- function(...){
  unpack()
  on.exit(pack())
  devtools::check(...)
}
