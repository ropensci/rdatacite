rdatacite
=========



[![Project Status: Active – The project has reached a stable, usable state and is being actively developed.](http://www.repostatus.org/badges/latest/active.svg)](http://www.repostatus.org/#active)
[![cran checks](https://cranchecks.info/badges/worst/rdatacite)](https://cranchecks.info/pkgs/rdatacite)
[![Build Status](https://travis-ci.org/ropensci/rdatacite.svg?branch=master)](https://travis-ci.org/ropensci/rdatacite)
[![codecov.io](https://codecov.io/github/ropensci/rdatacite/coverage.svg?branch=master)](https://codecov.io/github/ropensci/rdatacite?branch=master)
[![rstudio mirror downloads](https://cranlogs.r-pkg.org/badges/rdatacite)](https://github.com/metacran/cranlogs.app)
[![cran version](https://www.r-pkg.org/badges/version/rdatacite)](https://cran.r-project.org/package=rdatacite)
[![DOI](https://zenodo.org/badge/2521192.svg)](https://zenodo.org/badge/latestdoi/2521192)

`rdatacite` provides programmatic accesses to [DataCite](https://datacite.org/) metadata

* REST API. Docs: https://support.datacite.org/docs/api and https://support.datacite.org/reference

`rdatacite` docs: <https://docs.ropensci.org/rdatacite>

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
#> found: 340596, pages: 400, page: 1
#> slots: data, included, meta, links
#> $data
#> # A tibble: 25 x 4
#>    id    type  attributes$doi $identifiers $creators $titles $publisher
#>    <chr> <chr> <chr>          <list>       <list>    <list>  <chr>     
#>  1 10.1… dois  10.17863/cam.… <df[,2] [5 … <df[,6] … <df[,1… Apollo - …
#>  2 10.1… dois  10.17863/cam.… <df[,2] [5 … <df[,6] … <df[,1… Apollo - …
#>  3 10.1… dois  10.17863/cam.… <df[,2] [5 … <df[,6] … <df[,1… Apollo - …
#>  4 10.1… dois  10.17863/cam.… <df[,2] [5 … <df[,6] … <df[,1… Apollo - …
#>  5 10.1… dois  10.17863/cam.… <df[,2] [5 … <df[,6] … <df[,1… Apollo - …
#>  6 10.1… dois  10.17863/cam.… <df[,2] [5 … <df[,6] … <df[,1… Apollo - …
#>  7 10.1… dois  10.17863/cam.… <df[,2] [5 … <df[,6] … <df[,1… Apollo - …
#>  8 10.1… dois  10.17863/cam.… <df[,2] [5 … <df[,6] … <df[,1… Apollo - …
#>  9 10.1… dois  10.17863/cam.… <df[,2] [5 … <df[,6] … <df[,1… Apollo - …
#> 10 10.1… dois  10.17863/cam.… <df[,2] [5 … <df[,6] … <df[,1… Apollo - …
#> # … with 15 more rows, and 38 more variables: $container$type <chr>,
#> #   $$title <chr>, $$firstPage <chr>, $$identifier <chr>,
#> #   $$identifierType <chr>, $publicationYear <int>, $subjects <list>,
#> #   $contributors <list>, $dates <list>, $language <chr>, $types$ris <chr>,
#> #   $$bibtex <chr>, $$citeproc <chr>, $$schemaOrg <chr>, $$resourceType <chr>,
#> #   $$resourceTypeGeneral <chr>, $relatedIdentifiers <list>, $sizes <list>,
#> #   $formats <list>, $version <chr>, $rightsList <list>, $descriptions <list>,
#> #   $geoLocations <list>, $fundingReferences <list>, $url <chr>,
#> #   $contentUrl <lgl>, $metadataVersion <int>, $schemaVersion <chr>,
#> #   $source <chr>, $isActive <lgl>, $state <chr>, $reason <lgl>,
#> #   $created <chr>, $registered <chr>, $published <chr>, $updated <chr>,
#> #   relationships$client$data$id <chr>, $$$type <chr>
#> 
#> $included
#> # A tibble: 7 x 4
#>   id    type  attributes$name $symbol $year $contactEmail $alternateName
#>   <chr> <chr> <chr>           <chr>   <int> <chr>         <chr>         
#> 1 bl.c… clie… University of … BL.CAM   2015 support@repo… <NA>          
#> 2 usgs… clie… USGS DOI Tool … USGS.P…  2018 gs-css_csas_… USGS Science …
#> 3 drya… clie… DRYAD           DRYAD.…  2018 admin@datadr… <NA>          
#> 4 rg.rg clie… ResearchGate    RG.RG    2016 christian.sc… <NA>          
#> 5 delf… clie… TU Delft BK Bo… DELFT.…  2012 F.D.vanderHo… <NA>          
#> 6 sage… clie… Data Planet     SAGE.D…  2018 Kari.Hemdal@… <NA>          
#> 7 cern… clie… Zenodo          CERN.Z…  2013 info@zenodo.… Research. Sha…
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

## Meta

* Please [report any issues or bugs](https://github.com/ropensci/rdatacite/issues).
* License: MIT
* Get citation information for `rdatacite` in R doing `citation(package = 'rdatacite')`
* Please note that this project is released with a [Contributor Code of Conduct][coc]. By participating in this project you agree to abide by its terms.

[![rofooter](https://ropensci.org/public_images/github_footer.png)](https://ropensci.org)

[coc]: https://github.com/ropensci/rdatacite/blob/master/CODE_OF_CONDUCT.md
