rdatacite
=========



[![Project Status: Active – The project has reached a stable, usable state and is being actively developed.](http://www.repostatus.org/badges/latest/active.svg)](http://www.repostatus.org/#active)
[![cran checks](https://cranchecks.info/badges/worst/rdatacite)](https://cranchecks.info/pkgs/rdatacite)
[![Build Status](https://travis-ci.org/ropensci/rdatacite.svg?branch=master)](https://travis-ci.org/ropensci/rdatacite)
[![codecov.io](https://codecov.io/github/ropensci/rdatacite/coverage.svg?branch=master)](https://codecov.io/github/ropensci/rdatacite?branch=master)
[![rstudio mirror downloads](https://cranlogs.r-pkg.org/badges/rdatacite)](https://github.com/metacran/cranlogs.app)
[![cran version](https://www.r-pkg.org/badges/version/rdatacite)](https://cran.r-project.org/package=rdatacite)
[![DOI](https://zenodo.org/badge/2521192.svg)](https://zenodo.org/badge/latestdoi/2521192)

`rdatacite` provides programmatic accesses to DataCite (https://datacite.org/) metadata

* REST API. Docs: https://support.datacite.org/docs/api and https://support.datacite.org/reference

`rdatacite` docs: https://docs.ropensci.org/rdatacite

Package API:

 - `dc_providers`
 - `dc_reports`
 - `dc_check`
 - `dc_events`
 - `dc_dois`
 - `dc_clients`
 - `dc_client_prefixes`
 - `dc_provider_prefixes`
 - `dc_status`
 - `dc_prefixes`
 - `dc_activities`

## Installation

Stable CRAN version


```r
install.packages("rdatacite")
```

Development version from github


```r
devtools::install_github("ropensci/rdatacite")
```


```r
library('rdatacite')
```

## Result objects

Outputs from nearly all `rdatacite` functions will be of class `dc`, an S3 class that's 
simply a named list of results. You can easily remove the class via `unclass()`.
The `print.dc` method prints the data.frame for the `data`, `included`, and `reports`
slots if they exist, but hides the `meta` named list. You can get to the metadata by
indexing to it like `$meta`.

## Searching

You may want to start with `dc_dois()`.


```r
dc_dois(query = "climate change")
#> datacite: dois
#> found: 434105, pages: 400, page: 1
#> slots: data, included, meta, links
#> $data
#> # A tibble: 25 x 4
#>    id    type  attributes$doi $identifiers $creators $titles $publisher
#>    <chr> <chr> <chr>          <list>       <list>    <list>  <chr>     
#>  1 10.5… dois  10.5063/aa/nc… <df[,2] [1 … <df[,6] … <df[,2… KNB Data …
#>  2 10.5… dois  10.5281/zenod… <df[,2] [3 … <df[,5] … <df[,1… Zenodo    
#>  3 10.5… dois  10.5281/zenod… <df[,2] [3 … <df[,5] … <df[,1… Zenodo    
#>  4 10.1… dois  10.1177/09596… <df[,2] [1 … <df[,6] … <df[,1… SAGE Publ…
#>  5 10.1… dois  10.15468/dl.k… <df[,2] [2 … <df[,4] … <df[,1… The Globa…
#>  6 10.1… dois  10.15468/dl.9… <df[,2] [2 … <df[,4] … <df[,1… The Globa…
#>  7 10.5… dois  10.5281/zenod… <df[,2] [3 … <df[,5] … <df[,1… Zenodo    
#>  8 10.5… dois  10.5281/zenod… <df[,2] [3 … <df[,5] … <df[,1… Zenodo    
#>  9 10.5… dois  10.5281/zenod… <df[,2] [3 … <df[,5] … <df[,1… Zenodo    
#> 10 10.5… dois  10.5281/zenod… <df[,2] [3 … <df[,5] … <df[,1… Zenodo    
#> # … with 15 more rows, and 45 more variables: $container$type <chr>,
#> #   $$identifier <chr>, $$identifierType <chr>, $$title <chr>,
#> #   $$firstPage <chr>, $$issue <chr>, $$volume <chr>, $$lastPage <chr>,
#> #   $publicationYear <int>, $subjects <list>, $contributors <list>,
#> #   $dates <list>, $language <chr>, $types$ris <chr>, $$bibtex <chr>,
#> #   $$citeproc <chr>, $$schemaOrg <chr>, $$resourceTypeGeneral <chr>,
#> #   $$resourceType <chr>, $relatedIdentifiers <list>, $sizes <list>,
#> #   $formats <list>, $version <lgl>, $rightsList <list>, $descriptions <list>,
#> #   $geoLocations <list>, $fundingReferences <list>, $url <chr>,
#> #   $contentUrl <lgl>, $metadataVersion <int>, $schemaVersion <chr>,
#> #   $source <chr>, $isActive <lgl>, $state <chr>, $reason <lgl>,
#> #   $viewCount <int>, $downloadCount <int>, $referenceCount <int>,
#> #   $citationCount <int>, $created <chr>, $registered <chr>, $published <chr>,
#> #   $updated <chr>, relationships$client$data$id <chr>, $$$type <chr>
#> 
#> $included
#> # A tibble: 6 x 4
#>   id    type  attributes$name $symbol $year $contactEmail $alternateName
#>   <chr> <chr> <chr>           <chr>   <int> <chr>         <chr>         
#> 1 cdl.… clie… UC Santa Barba… CDL.UC…  2011 ezid@ucop.edu <NA>          
#> 2 cern… clie… Zenodo          CERN.Z…  2013 info@zenodo.… Research. Sha…
#> 3 cros… clie… Crossref Citat… CROSSR…  2019 info@datacit… <NA>          
#> 4 gbif… clie… Global Biodive… GBIF.G…  2018 dnoesgaard@g… <NA>          
#> 5 bl.c… clie… University of … BL.CAM   2015 support@repo… <NA>          
#> 6 ieee… clie… IEEE DataPort   IEEE.D…  2018 melissa.hand… <NA>          
#> # … with 15 more variables: $description <chr>, $language <list>,
#> #   $clientType <chr>, $domains <chr>, $re3data <chr>, $opendoar <lgl>,
#> #   $issn <list>, $url <chr>, $created <chr>, $updated <chr>, $isActive <lgl>,
#> #   $hasPassword <lgl>, relationships$provider$data$id <chr>, $$$type <chr>,
#> #   $prefixes$data <list>
```

The `query` parameter supports Elasticearch query string queries. Some examples:


```r
# search within a field
dc_dois(query = "publicationYear:2016")
# fuzzy search (via *) on a nested field
dc_dois(query = "creators.familyName:mil*")
```

## Caching

You can cache HTTP responses by leveraging the `webmiddens` package https://github.com/ropenscilabs/webmiddens

Caching is optional. It does slow down the original request slightly because
we take a bit extra time to cache the data to disk. But all subsequent
requests for the same function call will be faster.

Toggling caching is done through the environment variable `WEBMIDDENS_TURN_OFF`.
Environment variables allow for flexibly turning caching on/off in interactive
as well as non-interactive R sessions.

By default we set `WEBMIDDENS_TURN_OFF = TRUE`, so there's no caching.

To turn on caching, set it to `FALSE` like


```r
Sys.setenv(WEBMIDDENS_TURN_OFF = FALSE)
```

Then do requests as normal; you can tell if you're doing a real HTTP request or not
by using `verbose = TRUE` for verbose curl output. If you don't get the curl
output you are using a cached response. Here, the first request is a real HTTP request,
while the second uses the cached response from the first.


```r
dc_prefixes(limit = 3, verbose = TRUE)
#> > GET /prefixes?page%5Bsize%5D=3&page%5Bnumber%5D=1 HTTP/2
#> Host: api.datacite.org
#> Accept-Encoding: gzip, deflate
#> Accept: application/vnd.api+json; version=2
#> User-Agent: r-curl/4.3 crul/0.9.0 rOpenSci(rdatacite/0.5.2)
#> X-USER-AGENT: r-curl/4.3 crul/0.9.0 rOpenSci(rdatacite/0.5.2)
#> 
#> < HTTP/2 200
#> < date: Tue, 10 Mar 2020 23:30:38 GMT
#> < content-type: application/json; charset=utf-8
#> < status: 200 OK
#> < x-anonymous-consumer: true
#> < cache-control: max-age=0, private, must-revalidate
#> < vary: Accept-Encoding, Origin
#> < content-encoding: gzip
#> < etag: W/"d791baf5c4aa2d98880c67bb889f3d77"
#> < x-runtime: 3.718953
#> < x-request-id: fbbe32a6-263b-40dd-ab1b-f67d5fe92dd6
#> < x-powered-by: Phusion Passenger 6.0.4
#> < server: nginx/1.14.0 + Phusion Passenger 6.0.4

dc_prefixes(limit = 3, verbose = TRUE)
```


## Meta

* Please [report any issues or bugs](https://github.com/ropensci/rdatacite/issues).
* License: MIT
* Get citation information for `rdatacite` in R doing `citation(package = 'rdatacite')`
* Please note that this project is released with a [Contributor Code of Conduct][coc]. By participating in this project you agree to abide by its terms.

[![rofooter](https://ropensci.org/public_images/github_footer.png)](https://ropensci.org)

[coc]: https://github.com/ropensci/rdatacite/blob/master/CODE_OF_CONDUCT.md
