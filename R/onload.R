conn_dc <- NULL
.onLoad <- function(libname, pkgname){
	x <- solrium::SolrClient$new(host = dc_base(), path = "api",
		scheme = "https", port = NULL, errors = "complete")
  conn_dc <<- x
}
