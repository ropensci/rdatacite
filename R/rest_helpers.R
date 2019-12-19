# helpers --------------------------
dc_rest_GET <- function(route, id = NULL, args = NULL, discard_xml = TRUE,
  ...) {

  cli <- crul::HttpClient$new(
  	url = dc_rest_base(),
  	opts = list(...)
  )
  path <- if (!is.null(id)) file.path(route, id) else route
  res <- cli$get(path, query = args)
  res$raise_for_status()
  tmp <- jsonlite::fromJSON(res$parse("UTF-8"))
  if (discard_xml) tmp$data$attributes$xml <- NULL
  return(tmp)
}

dc_rest_base <- function() "https://api.datacite.org"
