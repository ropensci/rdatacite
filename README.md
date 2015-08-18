rdatacite
=========



[![Build Status](https://travis-ci.org/ropensci/rdatacite.svg?branch=master)](https://travis-ci.org/ropensci/rdatacite)
[![codecov.io](https://codecov.io/github/ropensci/rdatacite/coverage.svg?branch=master)](https://codecov.io/github/ropensci/rdatacite?branch=master)

`rdatacite` is an R package that provides programmatic accesses to [DataCite](http://datacite.org/) metadata via via

* OAI-PMH. Documentation for the DataCite OAI-PMH is available [here](http://oai.datacite.org/). [Documentation for OAI-PMH](http://www.openarchives.org/OAI/openarchivesprotocol.html)
* REST API. [Docs](http://search.datacite.org/help.html). [Metadata schema](http://schema.datacite.org/). [Solr config file](https://github.com/datacite/search/blob/master/src/main/resources/solrconfig.xml)

## Installation

> Note: If you want to use `wt='csv'` in `dc_*()` function calls, you'll need `solr` package version `0.1.8.99` or greater. Installation instructions at [https://github.com/ropensci/solr#quick-start](https://github.com/ropensci/solr#quick-start). Everything else will work just fine with CRAN version of `solr`

Install `oai`, it's not on CRAN yet:


```r
devtools::install_github("sckott/oai")
```

And install a newer version of `solr`, not yet on CRAN:


```r
devtools::install_github("ropensci/solr")
```

Now install `rdatacite`


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
#> <ListIdentifiers> 5 X 4 
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
#>                                             doi publicationYear
#> 1 10.15129/B7B3D9A1-1960-4D19-B1FE-9AF0A674B3CD            2015
#> 2                         10.2314/GBV:499941845            2004
#> 3                         10.2314/GBV:667365621            2010
#> 4                         10.2314/GBV:676509665            2011
#> 5                         10.2314/GBV:772538778            2012
```

Another search: published between 2000 and 2005


```r
dc_search(q = "publicationYear:[2000 TO 2005]", fl = c('doi', 'publicationYear'), rows = 5)
#> Source: local data frame [5 x 2]
#> 
#>               doi publicationYear
#> 1 10.5517/CC96RBK            2005
#> 2 10.5517/CC7S7RZ            2004
#> 3 10.5517/CC7S7S0            2004
#> 4 10.5517/CC7S7T1            2004
#> 5 10.5517/CC7WF1K            2004
```

### Facet


```r
dc_facet(q = "wind", facet.field = 'publisher', facet.limit = 5)
#> $facet_queries
#> NULL
#> 
#> $facet_fields
#> $facet_fields$publisher
#>          X1    X2
#> 1      data 32281
#> 2       for 31070
#> 3 publisher 30853
#> 4   science 30848
#> 5     earth 30823
#> 
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
#>                       min            max count missing
#> 1 01-Jan-2007/29-Nov-2010 September 2014  9401    2557
```

### More-like-this


```r
dc_mlt(q = "ecology", mlt.fl = 'title', mlt.count = 2, fl = 'doi')
#> $docs
#> Source: local data frame [10 x 1]
#> 
#>                       doi
#> 1         10.5167/UZH-714
#> 2       10.5167/UZH-76892
#> 3       10.5167/UZH-49216
#> 4         10.5167/UZH-503
#> 5         10.5167/UZH-584
#> 6       10.5167/UZH-61344
#> 7       10.5167/UZH-38402
#> 8       10.5167/UZH-41217
#> 9         10.5167/UZH-402
#> 10 10.13140/2.1.3940.8968
#> 
#> $mlt
#> $mlt$`1710865`
#>                        doi
#> 1 10.7890/ETHZ-A-000467066
#> 2 10.7890/ETHZ-A-000467004
#> 
#> $mlt$`1712990`
#>                         doi
#> 1 10.13140/RG.2.1.3868.5287
#> 2 10.6084/M9.FIGSHARE.15727
#> 
#> $mlt$`1699696`
#>                         doi
#> 1 10.13140/RG.2.1.3868.5287
#> 2 10.6084/M9.FIGSHARE.15727
#> 
#> $mlt$`1695042`
#>                      doi
#> 1 10.5287/BODLEIANDVAJ.2
#> 2 10.5287/BODLEIAN8UGR.2
```


## Meta

* Please [report any issues or bugs](https://github.com/ropensci/rdatacite/issues).
* License: MIT
* Get citation information for `rdatacite` in R doing `citation(package = 'rdatacite')`

[![ropensci](http://ropensci.org/public_images/github_footer.png)](http://ropensci.org)
