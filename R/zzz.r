dc_compact <- function(l) Filter(Negate(is.null), l)

dc_base <- function() "search.datacite.org"

dc_oai_base <- function() "https://oai.datacite.org/oai"

pluck <- function(x, name, type) {
  if (missing(type)) {
    lapply(x, "[[", name)
  } else {
    vapply(x, "[[", name, FUN.VALUE = type)
  }
}

last <- function(x) x[length(x)][[1]]

strextract <- function(str, pattern) regmatches(str, regexpr(pattern, str))

make_dc_conn <- function(proxy) {
  solrium::SolrClient$new(host = dc_base(),
    path = "api", scheme = "https", port = NULL, errors = "complete",
    proxy = proxy)
}
