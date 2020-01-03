#' DataCite REST API: events
#'
#' @export
#' @inheritParams dc_dois
#' @param ids (character) one or more event IDs
#' @param query (character) Query for any event information
#' @param subj_id (character) The identifier for the event subject, expressed
#' as a URL. For example: `https://doi.org/10.7272/q6qn64nk`
#' @param obj_id (character) The identifier for the event object, expressed
#' as a URL. For example: `https://doi.org/10.7272/q6qn64nk`
#' @param doi (character) The subj-id or obj-id of the event, expressed as
#' a DOI. For example: `10.7272/q6qn64nk`
#' @param orcid (character) an ORCID, presumably
#' @param prefix (character) The DOI prefix of the subj-id or obj-id of the
#' event. For example: `10.7272` 
#' @param subtype (character) xxx
#' @param subject (character) xxx
#' @param source_id (character) a source ID. See Details
#' @param registrant_id (character) 
#' @param relation_type_id (character) a relation-type ID. See Details
#' @param issn (character) an ISSN, presumably
#' @param publication_year (character) the publication year
#' @param year_month (character) The year and month in which the event
#' occurred, in the format `YYYY-MM`. For example `2018-08`
#' @param sort (character) variable to sort by
#' @details See https://support.datacite.org/docs/eventdata-guide for
#' details on possible values for parameters
#' @examples \dontrun{
#' if (dc_check()) {
#' x <- dc_events()
#' x
#' dc_events(query = "birds")
#' # dc_events(x$data$id[1]) # FIXME: doesn't work
#' # dc_events(x$data$id[1:3]) # FIXME: doesn't work
#' }}
dc_events <- function(ids = NULL, query = NULL, subj_id = NULL, obj_id = NULL,
  doi = NULL, orcid = NULL, prefix = NULL,
  subtype = NULL, subject = NULL, source_id = NULL,
  registrant_id = NULL, relation_type_id = NULL, issn = NULL, 
  publication_year = NULL, year_month = NULL, include = NULL,
  sort = NULL, limit = 25, page = 1, cursor = NULL, ...) {

  assert(ids, "character")
  assert(query, "character")
  assert(subj_id, "character")
  assert(obj_id, "character")
  assert(doi, "character")
  assert(orcid, "character")
  assert(prefix, "character")
  assert(subtype, "character")
  assert(subject, "character")
  assert(source_id, "character")
  assert(registrant_id, "character")
  assert(relation_type_id, "character")
  assert(issn, "character")
  assert(publication_year, c("numeric", "integer", "character"))
  assert(year_month, "character")
  assert(include, "character")
  assert(limit, c("numeric", "integer"))
  assert(page, c("numeric", "integer"))
  assert(cursor, c("numeric", "integer", "character"))
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
