#' Retrieve the set structure of DataCite, useful for selective harvesting
#'
#' @export
#'
#' @inheritParams dc_oai_listmetadataformats
#' @examples \dontrun{
#' datacite_sets <- dc_oai_listsets()
#' head(datacite_sets)
#' }

dc_oai_listsets <- function() {
	out <- oaih_list_sets("http://oai.datacite.org/oai", transform = FALSE)
	data.frame(
		setSpec = sapply(xpathApply(out, "//setSpec"), xmlValue),
		setName = sapply(xpathApply(out, "//setName"), xmlValue)
		)
}

# library(httr)
# url <- "http://oai.datacite.org/oai"
# args <- list(verb = "ListSets")
# res <- GET(url, query=args)
# tt <- content(res, "text")
# xml <- xmlParse(tt)
# xmlRoot(xml)[[3L]]
# xml
# getNodeSet(xml, "//ListSets")
#
# nodes <- OAIHarvester:::OAI_PMH_issue_request(baseurl, "verb=ListSets")
# verb <- OAIHarvester:::OAI_PMH_get_verb(nodes)
# kids <- xmlChildren(OAIHarvester:::OAI_PMH_get_result(nodes))
#
#
# chunks <- list()
# repeat {
#   size <- length(kids)
#   last <- kids[[size]]
#   done <-
#   if (xmlName(last) != "resumptionToken") {
#     TRUE } else {
#     kids <- kids[-size]
#     !length(token <- xmlValue(last))
#   }
#   if (transform)
#     kids <- OAIHarvester:::oaih_transform(kids)
#   chunks <- c(chunks, list(kids))
#   if (done)
#     break
#   nodes <- OAIHarvester:::OAI_PMH_issue_request(baseurl, sprintf("verb=%s&resumptionToken=%s",
#                                                   verb, token))
#   kids <- xmlChildren(OAIHarvester:::OAI_PMH_get_result(nodes))
# }
# if (transform) {
#   result <- do.call("rbind", chunks)
# }
# else {
#   chunks <- unlist(chunks, recursive = FALSE, use.names = FALSE)
#   result$children <- chunks
# }
# result
# #
#
# baseurl <- "http://epub.wu.ac.at/cgi/oai2"; oaih_list_sets(baseurl)
