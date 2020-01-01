#' DataCite REST API: events
#'
#' @export
#' @inheritParams dc_dois
#' @param ids (character) one or more event IDs
#' @param query (character) Query string
#' @param subj_id (character) 
#' @param obj_id (character) 
#' @param doi (character) 
#' @param orcid (character) 
#' @param prefix (character) 
#' @param subtype (character) 
#' @param subject (character) 
#' @param source_id (character) 
#' @param registrant_id (character) 
#' @param relation_type_id (character) 
#' @param issn (character) 
#' @param publication_year (character) 
#' @param year_month (character) 
#' @param sort (character) variable to sort by
#' @examples \dontrun{
#' x <- dc_events()
#' x
#' dc_events(query = "birds")
#' # dc_events(x$data$id[1]) # FIXME: doesn't work
#' # dc_events(x$data$id[1:3]) # FIXME: doesn't work
#' }
dc_events <- function(ids = NULL, query = NULL, subj_id = NULL, obj_id = NULL,
  doi = NULL, orcid = NULL, prefix = NULL,
  subtype = NULL, subject = NULL, source_id = NULL,
  registrant_id = NULL, relation_type_id = NULL, issn = NULL, 
  publication_year = NULL, year_month = NULL, include = NULL,
  sort = NULL, limit = 25, page = 1, cursor = NULL, ...) {

  if (!is.null(ids)) ids <- paste0(ids, collapse = ",")
  args <- cpct(list(ids = ids, query = query, `subj-id` = subj_id,
    `obj-id` = obj_id, doi = doi, orcid = orcid, prefix = prefix,
    subtype = subtype, subject = subject, `source-id` = source_id,
    `registrant-id`  = registrant_id, `relation-type-id` = relation_type_id,
    issn = issn, `publication-year` = publication_year,
    `year-month` = year_month, include = include, sort = sort,
    `page[size]` = limit, `page[number]` = page, `page[cursor]` = cursor))
  as_dc(dc_GET("events", args, ...), "events")
}
