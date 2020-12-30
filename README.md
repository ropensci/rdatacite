rdatacite
=========



[![Project Status: Active – The project has reached a stable, usable state and is being actively developed.](http://www.repostatus.org/badges/latest/active.svg)](http://www.repostatus.org/#active)
[![cran checks](https://cranchecks.info/badges/worst/rdatacite)](https://cranchecks.info/pkgs/rdatacite)
[![Build Status](https://travis-ci.org/ropensci/rdatacite.svg?branch=master)](https://travis-ci.org/ropensci/rdatacite)
[![codecov.io](https://codecov.io/github/ropensci/rdatacite/coverage.svg?branch=master)](https://codecov.io/github/ropensci/rdatacite?branch=master)
[![rstudio mirror downloads](https://cranlogs.r-pkg.org/badges/rdatacite)](https://github.com/r-hub/cranlogs.app)
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
pak::pkg_install("ropensci/rdatacite")
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
#> found: 85075, pages: 400, page: 1
#> slots: data, meta, links
#> $data
#> # A tibble: 25 x 4
#>    id    type  attributes$doi $identifiers $creators $titles $publisher
#>    <chr> <chr> <chr>          <list>       <list>    <list>  <chr>     
#>  1 10.1… dois  10.15786/20.5… <list [0]>   <df[,6] … <df[,1… Mountain …
#>  2 10.2… dois  10.25675/1021… <list [0]>   <df[,3] … <df[,2… Mountain …
#>  3 10.2… dois  10.25675/1021… <list [0]>   <df[,3] … <df[,2… Mountain …
#>  4 10.2… dois  10.25675/1021… <list [0]>   <df[,3] … <df[,2… Mountain …
#>  5 10.2… dois  10.25675/1021… <list [0]>   <df[,3] … <df[,2… Mountain …
#>  6 10.2… dois  10.25676/1112… <list [0]>   <df[,6] … <df[,1… Mountain …
#>  7 10.2… dois  10.25676/1112… <list [0]>   <df[,6] … <df[,1… Mountain …
#>  8 10.2… dois  10.25675/1021… <list [0]>   <df[,6] … <df[,2… Mountain …
#>  9 10.2… dois  10.25675/1021… <list [0]>   <df[,6] … <df[,1… Mountain …
#> 10 10.2… dois  10.25675/1021… <list [0]>   <df[,6] … <df[,1… Mountain …
#> # … with 15 more rows, and 42 more variables: $container <df[,0]>,
#> #   $publicationYear <int>, $subjects <list>, $contributors <list>,
#> #   $dates <list>, $language <chr>, $types$ris <chr>, $$bibtex <chr>,
#> #   $$citeproc <chr>, $$schemaOrg <chr>, $$resourceType <chr>,
#> #   $$resourceTypeGeneral <chr>, $relatedIdentifiers <list>, $sizes <list>,
#> #   $formats <list>, $version <lgl>, $rightsList <list>, $descriptions <list>,
#> #   $geoLocations <list>, $fundingReferences <list>, $url <chr>,
#> #   $contentUrl <lgl>, $metadataVersion <int>, $schemaVersion <chr>,
#> #   $source <chr>, $isActive <lgl>, $state <chr>, $reason <lgl>,
#> #   $viewCount <int>, $downloadCount <int>, $referenceCount <int>,
#> #   $citationCount <int>, $partCount <int>, $partOfCount <int>,
#> #   $versionCount <int>, $versionOfCount <int>, $created <chr>,
#> #   $registered <chr>, $published <lgl>, $updated <chr>,
#> #   relationships$client$data$id <chr>, $$$type <chr>
#> 
#> $included
#> NULL
```

The `query` parameter supports Elasticearch query string queries. Some examples:


```r
# search within a field
dc_dois(query = "publicationYear:2016")
# fuzzy search (via *) on a nested field
dc_dois(query = "creators.familyName:mil*")
```

## Meta

* Please [report any issues or bugs](https://github.com/ropensci/rdatacite/issues).
* License: MIT
* Get citation information for `rdatacite` in R doing `citation(package = 'rdatacite')`
* Please note that this package is released with a [Contributor Code of Conduct](https://ropensci.org/code-of-conduct/). By contributing to this project, you agree to abide by its terms.
