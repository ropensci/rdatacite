#' DataCite content negotation
#'
#' @export
#' @param dois (character) one or more DOIs
#' @param format Name of the format. One of "rdf-xml", "turtle",
#' "citeproc-json", "schemaorg", "codemeta", "text", "ris", "bibtex"
#' (default), "datacite-xml", "datacite-json", "bibentry", or
#' "jats".
#' @param style a CSL style (for text format only). See
#' ‘rcrossref::get_styles()’ for options. Default: 'apa'. If there's
#' a style that DataCite doesn't support you'll get a
#' (500) Internal Server Error
#' @param locale Language locale. See ‘?Sys.getlocale’
#' @param ... curl options passed on to [crul::verb-GET]
#' @references
#' https://support.datacite.org/docs/datacite-content-resolver
#' @seealso see also `rcrossref::cr_cn` for a more general purpose
#' content negotation interface
#' @examples \dontrun{
#' dc_cn("10.5281/zenodo.50213")
#' dc_cn(c("10.5281/zenodo.50213", "10.5281/zenodo.57081"), "text")
#' dc_cn(c("a-bad-doi", "10.5281/zenodo.50213", "10.5281/zenodo.57081"), "text")
#' }
dc_cn <- function(dois, format = "bibtex", style = "apa", locale = "en-US",
  ...) {

  assert(dois, "character")
  assert(format, "character")
  assert(style, "character")
  assert(locale, "character")
  pick <- c(
    "rdf-xml" = "application/rdf+xml",
    "turtle" = "text/turtle",
    "citeproc-json" = "application/vnd.citationstyles.csl+json",
    "schemaorg" = "application/ld+json",
    "codemeta" = "application/vnd.codemeta.ld+json",
    "text" = "text/x-bibliography",
    "ris" = "application/x-research-info-systems",
    "bibtex" = "application/x-bibtex",
    "datacite-xml" = "application/vnd.datacite.datacite+xml",
    "datacite-json" = "application/vnd.datacite.datacite+json",
    "bibentry" = "application/x-bibtex",
    "jats" = "application/vnd.jats+xml")
  type <- pick[[format]]
  con <- crul::HttpClient$new(
    url = "https://data.crosscite.org",
    opts = c(list(followlocation = 1), ...),
    headers = list(
      Accept = type,
      `User-Agent` = rdatacite_ua(),
      `X-USER-AGENT` = rdatacite_ua()
    )
  )
  lapply(dois, function(w) {
    res <- con$get(w)
    warn_stat(res)
    res$parse("UTF-8")
  })
}
