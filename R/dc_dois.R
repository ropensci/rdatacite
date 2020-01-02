#' DataCite REST API: dois
#'
#' @export
#' @param ids (character) one or more DOIs
#' @param query (character) Query string. See Querying below.
#' @param created (character) metadata where year of DOI creation is `created`.
#' See Filtering Responses below.
#' @param registered (character) metadata where year of DOI registration
#' is `year`. See Filtering Responses below.
#' @param provider_id (character) metadata associated with a specific DataCite
#' provider. See Filtering Responses below.
#' @param client_id (character) metadata associated with a specific DataCite
#' client. See Filtering Responses below.
#' @param person_id (character) metadata associated with a specific person's
#' ORCID iD. See Filtering Responses below.
#' @param resource_type_id (character) metadata for a specific
#' resourceTypeGeneral. See Filtering Responses below.
#' @param subject (character) 
#' @param schema_version (character) metadata where schema version of the
#' deposited metadata is `schema-version`. See Filtering Responses below.
#' @param random (logical) return random set of results, can be combined
#' with any kind of query. default: `FALSE`.
#' @param sample_size (character) 
#' @param sample_group (character) 
#' @param include (character) vector of fields to return
#' @param sort (character) variable to sort by
#' @param limit (numeric/integer) results per page
#' @param page (numeric/integer) the page to get results for. default: 1
#' @param cursor (character) page cursor (used instead of `limit` param).
#' to use cursor pagination, set `cursor = 1`, then use the link in
#' `$links$next`
#' @param ... curl options passed on to [crul::verb-GET]
#' @section Querying:
#' See https://support.datacite.org/docs/api-queries for details
#' @section Filtering Responses:
#' See
#' https://support.datacite.org/docs/api-queries#section-filtering-list-responses
#' for details
#' @examples \dontrun{
#' if (dc_check()) {
#' x <- dc_dois()
#' x
#' dc_dois(query = "birds")
#' dc_dois(query = "climate change")
#' dc_dois(query = "publicationYear:2016")
#' x <- dc_dois(query = "creators.familyName:mil*", verbose = TRUE)
#' lapply(x$data$attributes$creators, "[[", "familyName")
#' x <- dc_dois(query = "titles.title:climate +change")
#' lapply(x$data$attributes$titles, "[[", "title")
#' dc_dois(client_id = "dryad.dryad")
#' dc_dois(x$data$id[1])
#' dc_dois(x$data$id[1:3])
#' dc_dois("10.5281/zenodo.1308060")
#' 
#' # pagination
#' dc_dois(limit = 1)
#' x <- dc_dois(cursor = 1)
#' x$links$`next`
#' }}
dc_dois <- function(ids = NULL, query = NULL, created = NULL,
  registered = NULL, provider_id = NULL, client_id = NULL, person_id = NULL,
  resource_type_id = NULL, subject = NULL, schema_version = NULL,
  random = NULL, sample_size = NULL, sample_group = NULL, include = NULL,
  sort = NULL, limit = 25, page = 1, cursor = NULL, ...) {

  assert(ids, "character")
  assert(query, "character")
  assert(created, "character")
  assert(registered, "character")
  assert(provider_id, "character")
  assert(client_id, "character")
  assert(person_id, "character")
  assert(resource_type_id, "character")
  assert(schema_version, "character")
  assert(random, "logical")
  assert(include, "character")
  assert(limit, c("numeric", "integer"))
  assert(page, c("numeric", "integer"))
  assert(cursor, c("numeric", "integer", "character"))
  if (!is.null(ids)) ids <- paste0(ids, collapse = ",")
  args <- cpct(list(ids = ids, query = query, created = created,
    registered = registered, `provider-id` = provider_id,
    `client-id` = client_id, `person-id` = person_id,
    `resource-type-id` = resource_type_id, subject = subject,
    `schema-version` = schema_version, random  = asl(random),
    `sample-size` = sample_size, `sample-group` = sample_group,
    include = include, sort = sort, `page[size]` = limit,
    `page[number]` = page, `page[cursor]` = cursor))
  as_dc(dc_GET("dois", args, ...), "dois")
}
