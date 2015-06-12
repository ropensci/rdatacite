#' List the records in the DataCite metadata repository.
#'
#' @export
#'
#' @inheritParams dc_oai_listidentifiers
#' @examples \dontrun{
#' dc_oai_listrecords(from = '2011-06-01T', until = '2011-07-01T')
#' out <- dc_oai_listrecords()
#' }
dc_oai_listrecords <- function(from = NULL, until = NULL, set = NULL, prefix = 'oai_dc',
                               token = NULL, transform = TRUE) {

  oaih_list_records("http://oai.datacite.org/oai", prefix = prefix, from = from,
                    until = until, set = set, transform = transform)
}

# Notes: Not sure about the point behind the examples
