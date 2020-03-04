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
#> found: 427319, pages: 400, page: 1
#> slots: data, included, meta, links
#> $data
#> # A tibble: 25 x 4
#>    id    type  attributes$doi $identifiers $creators $titles $publisher
#>    <chr> <chr> <chr>          <list>       <list>    <list>  <chr>     
#>  1 10.1… dois  10.1101/2020.… <df[,2] [2 … <df[,6] … <df[,1… bioRxiv   
#>  2 10.1… dois  10.1038/s4156… <df[,2] [1 … <df[,6] … <df[,1… Springer …
#>  3 10.3… dois  10.3886/e1111… <df[,2] [1 … <df[,6] … <df[,2… ICPSR - I…
#>  4 10.1… dois  10.1039/d0dt0… <df[,2] [2 … <df[,6] … <df[,1… Royal Soc…
#>  5 10.4… dois  10.4232/1.134… <df[,2] [3 … <df[,4] … <df[,2… GESIS Dat…
#>  6 10.1… dois  10.1016/j.cat… <df[,2] [2 … <df[,5] … <df[,1… Elsevier …
#>  7 10.1… dois  10.15496/publ… <df[,2] [4 … <df[,6] … <df[,1… Universit…
#>  8 10.1… dois  10.15496/publ… <df[,2] [3 … <df[,6] … <df[,1… Elsevier …
#>  9 10.5… dois  10.5281/zenod… <df[,2] [2 … <df[,6] … <df[,1… Zenodo    
#> 10 10.5… dois  10.5281/zenod… <df[,2] [2 … <df[,6] … <df[,1… Zenodo    
#> # … with 15 more rows, and 44 more variables: $container$type <chr>,
#> #   $$title <chr>, $$identifier <chr>, $$identifierType <chr>, $$volume <chr>,
#> #   $$lastPage <chr>, $$firstPage <chr>, $publicationYear <int>,
#> #   $subjects <list>, $contributors <list>, $dates <list>, $language <chr>,
#> #   $types$ris <chr>, $$bibtex <chr>, $$citeproc <chr>, $$schemaOrg <chr>,
#> #   $$resourceType <chr>, $$resourceTypeGeneral <chr>,
#> #   $relatedIdentifiers <list>, $sizes <list>, $formats <list>, $version <chr>,
#> #   $rightsList <list>, $descriptions <list>, $geoLocations <list>,
#> #   $fundingReferences <list>, $url <chr>, $contentUrl <lgl>,
#> #   $metadataVersion <int>, $schemaVersion <chr>, $source <chr>,
#> #   $isActive <lgl>, $state <chr>, $reason <lgl>, $viewCount <int>,
#> #   $downloadCount <int>, $referenceCount <int>, $citationCount <int>,
#> #   $created <chr>, $registered <chr>, $published <chr>, $updated <chr>,
#> #   relationships$client$data$id <chr>, $$$type <chr>
#> 
#> $included
#> # A tibble: 10 x 4
#>    id    type  attributes$name $symbol $year $contactEmail $alternateName
#>    <chr> <chr> <chr>           <chr>   <int> <chr>         <chr>         
#>  1 cros… clie… Crossref Citat… CROSSR…  2019 info@datacit… <NA>          
#>  2 gesi… clie… ICPSR           GESIS.…  2013 dara@gesis.o… ICPSR data ar…
#>  3 gesi… clie… GESIS Leibniz … GESIS.…  2011 dara@gesis.o… <NA>          
#>  4 tib.… clie… Universitätsbi… TIB.UB…  2014 peter.rempis… <NA>          
#>  5 cern… clie… Zenodo          CERN.Z…  2013 info@zenodo.… Research. Sha…
#>  6 ethz… clie… ARBOR, Berner … ETHZ.B…  2019 doi@library.… <NA>          
#>  7 cist… clie… National Resea… CISTI.…  2011 sophie.roy2@… <NA>          
#>  8 bl.l… clie… University of … BL.LPO…  2015 jkerwin@live… <NA>          
#>  9 tib.… clie… Thüringer Univ… TIB.DBT  2017 thomas.schef… <NA>          
#> 10 sage… clie… Data Planet     SAGE.D…  2018 Kari.Hemdal@… <NA>          
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
