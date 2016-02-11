rdatacite
=========



[![Build Status](https://travis-ci.org/ropensci/rdatacite.svg?branch=master)](https://travis-ci.org/ropensci/rdatacite)
[![codecov.io](https://codecov.io/github/ropensci/rdatacite/coverage.svg?branch=master)](https://codecov.io/github/ropensci/rdatacite?branch=master)
[![rstudio mirror downloads](http://cranlogs.r-pkg.org/badges/rdatacite)](https://github.com/metacran/cranlogs.app)

`rdatacite` provides programmatic accesses to [DataCite](http://datacite.org/) metadata

* OAI-PMH. Documentation for the DataCite OAI-PMH is available [here](http://oai.datacite.org/). [Documentation for OAI-PMH](http://www.openarchives.org/OAI/openarchivesprotocol.html)
* REST API. [Docs](http://search.datacite.org/help.html). [Metadata schema](http://schema.datacite.org/). [Solr config file](https://github.com/datacite/search/blob/master/src/main/resources/solrconfig.xml)

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

## OAI-PMH

### Ping the service


```r
dc_oai_identify()
#>   repositoryName                     baseURL protocolVersion
#> 1   DataCite MDS http://oai.datacite.org/oai             2.0
#>           adminEmail    earliestDatestamp deletedRecord
#> 1 admin@datacite.org 2011-01-01T00:00:00Z    persistent
#>            granularity compression compression.1
#> 1 YYYY-MM-DDThh:mm:ssZ        gzip       deflate
#>                                      description
#> 1 oaioai.datacite.org:oai:oai.datacite.org:12425
```

### List metadata formats


```r
dc_oai_listmetadataformats(id = "56225")
#> $`oai:oai.datacite.org:56225`
#>   metadataPrefix
#> 1         oai_dc
#> 2       datacite
#> 3   oai_datacite
#>                                                        schema
#> 1              http://www.openarchives.org/OAI/2.0/oai_dc.xsd
#> 2 http://schema.datacite.org/meta/nonexistant/nonexistant.xsd
#> 3              http://schema.datacite.org/oai/oai-1.0/oai.xsd
#>                             metadataNamespace
#> 1 http://www.openarchives.org/OAI/2.0/oai_dc/
#> 2      http://datacite.org/schema/nonexistant
#> 3     http://schema.datacite.org/oai/oai-1.0/
```

### List identifiers


```r
dc_oai_listidentifiers(from = '2011-06-01T', until = '2011-07-01T')
#> <ListRecords> 5 X 4 
#> 
#>                   identifier            datestamp setSpec setSpec.1
#> 1 oai:oai.datacite.org:32153 2011-06-08T08:57:11Z     TIB  TIB.WDCC
#> 2 oai:oai.datacite.org:32200 2011-06-20T08:12:41Z     TIB TIB.DAGST
#> 3 oai:oai.datacite.org:32220 2011-06-28T14:11:08Z     TIB TIB.DAGST
#> 4 oai:oai.datacite.org:32241 2011-06-30T13:24:45Z     TIB TIB.DAGST
#> 5 oai:oai.datacite.org:32255 2011-07-01T12:09:24Z     TIB TIB.DAGST
```

### Get records


```r
dc_oai_getrecord(id = "56225")
#> <GetRecord> 1 X 23 
#> 
#>                   identifier            datestamp setSpec setSpec.1
#> 1 oai:oai.datacite.org:56225 2014-06-03T12:03:28Z      BL    BL.ADS
#> Variables not shown: title (chr), creator (chr), publisher (chr), date
#>      (chr), identifier.3 (chr), identifier.1 (chr), identifier.2 (chr),
#>      relation (chr), subject (chr), subject.1 (chr), language (chr), type
#>      (chr), type.1 (chr), format (chr), format.1 (chr), rights (chr),
#>      rights.1 (chr), coverage (chr), coverage.1 (chr)
```

You can pass in more than one identifier to `id` parameter.

## Search API

This is the API for the same query interface you'd use on the DataCite website.

### Search

Search for the term _laser_


```r
dc_search(q = "laser", fl = c('doi','publicationYear'), rows = 5)
#> Source: local data frame [5 x 2]
#> 
#>                          doi publicationYear
#>                        (chr)           (chr)
#> 1 10.17035/D.2016.0008119129            2016
#> 2        10.5169/SEALS-52668            1982
#> 3      10.2314/GBV:676509665            2011
#> 4      10.2314/GBV:667365621            2010
#> 5      10.2314/GBV:574957529            2007
```

Another search: published between 2000 and 2005


```r
dc_search(q = "publicationYear:[2000 TO 2005]", fl = c('doi', 'publicationYear'), rows = 5)
#> Source: local data frame [5 x 2]
#> 
#>                   doi publicationYear
#>                 (chr)           (chr)
#> 1      10.13155/36809            2004
#> 2      10.13155/36807            2003
#> 3 10.7892/BORIS.75282            2004
#> 4 10.7892/BORIS.75280            2002
#> 5     10.15150/ATW122            2002
```

### Facet


```r
dc_facet(q = "wind", facet.field = 'publisher_facet', facet.limit = 5)
#> $facet_queries
#> NULL
#> 
#> $facet_fields
#> $facet_fields$publisher_facet
#>                                                                   X1    X2
#> 1         PANGAEA - Data Publisher for Earth & Environmental Science 30670
#> 2 Data-Planet™ Statistical Ready Reference by Conquest Systems, Inc.  1119
#> 3                                                        Unpublished   760
#> 4                                                           Figshare   317
#> 5                                           Archaeology Data Service   263
#> 
#> 
#> $facet_pivot
#> NULL
#> 
#> $facet_dates
#> NULL
#> 
#> $facet_ranges
#> NULL
```

### Stats



```r
dc_stats(q = "ecology", stats.field = 'date')
#> $data
#>                          min                max count missing
#> date 01-Jan-2007/29-Nov-2010 September 30, 2015 13584    3989
#> 
#> $facet
#> NULL
```

### More-like-this


```r
dc_mlt(q = "ecology", mlt.fl = 'title', mlt.count = 2, fl = 'doi')
#> $docs
#> Source: local data frame [10 x 1]
#> 
#>                    doi
#>                  (chr)
#> 1    10.5167/UZH-76892
#> 2      10.5167/UZH-584
#> 3    10.5167/UZH-61344
#> 4      10.5167/UZH-714
#> 5    10.5167/UZH-41217
#> 6      10.5167/UZH-402
#> 7    10.5167/UZH-49216
#> 8      10.5167/UZH-503
#> 9    10.5167/UZH-38402
#> 10 10.7892/BORIS.16333
#> 
#> $mlt
#> $mlt$`1712990`
#>                         doi
#> 1 10.13140/RG.2.1.3868.5287
#> 2 10.6084/M9.FIGSHARE.15727
#> 
#> $mlt$`1710865`
#>                        doi
#> 1 10.7890/ETHZ-A-000467066
#> 2 10.7890/ETHZ-A-000467004
#> 
#> $mlt$`1699696`
#>                         doi
#> 1 10.13140/RG.2.1.3868.5287
#> 2 10.6084/M9.FIGSHARE.15727
#> 
#> $mlt$`1695042`
#>                    doi
#> 1 10.5169/SEALS-511492
#> 2 10.5169/SEALS-421764
```


## Meta

* Please [report any issues or bugs](https://github.com/ropensci/rdatacite/issues).
* License: MIT
* Get citation information for `rdatacite` in R doing `citation(package = 'rdatacite')`
* Please note that this project is released with a [Contributor Code of Conduct](CONDUCT.md). By participating in this project you agree to abide by its terms.

[![ropensci](http://ropensci.org/public_images/github_footer.png)](http://ropensci.org)
