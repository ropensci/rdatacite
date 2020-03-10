dc_midden <- NULL # nocov start
.onLoad <- function(libname, pkgname) {
  # set up a new midden
  x <- webmiddens::midden$new()
  x$init(path = "rdatacite_cache")
  dc_midden <<- x

  # set to WEBMIDDENS_TURN_OFF=FALSE by default
  Sys.setenv(WEBMIDDENS_TURN_OFF = TRUE)
} # nocov end
