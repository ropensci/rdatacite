rdatacite
=========



[![Build Status](https://travis-ci.org/ropensci/rdatacite.svg?branch=master)](https://travis-ci.org/ropensci/rdatacite)
[![codecov.io](https://codecov.io/github/ropensci/rdatacite/coverage.svg?branch=master)](https://codecov.io/github/ropensci/rdatacite?branch=master)
[![rstudio mirror downloads](https://cranlogs.r-pkg.org/badges/rdatacite)](https://github.com/metacran/cranlogs.app)
[![cran version](https://www.r-pkg.org/badges/version/rdatacite)](https://cran.r-project.org/package=rdatacite)

`rdatacite` provides programmatic accesses to [DataCite](http://datacite.org/) metadata

* OAI-PMH. Documentation for the DataCite OAI-PMH is available [here](http://oai.datacite.org/). [Documentation for general OAI-PMH](http://www.openarchives.org/OAI/openarchivesprotocol.html)
* Solr service. [Docs](http://search.datacite.org/help.html)
* REST API. Docs: <https://support.datacite.org/docs/api> and <https://support.datacite.org/reference>

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
#> $`56225`
#> NULL
```

### List identifiers


```r
dc_oai_listidentifiers(from = '2011-06-01T', until = '2011-07-01T')
#> # A tibble: 5 x 4
#>                   identifier            datestamp setSpec setSpec.1
#>                        <chr>                <chr>   <chr>     <chr>
#> 1 oai:oai.datacite.org:32153 2011-06-08T08:57:11Z     TIB  TIB.WDCC
#> 2 oai:oai.datacite.org:32200 2011-06-20T08:12:41Z     TIB TIB.DAGST
#> 3 oai:oai.datacite.org:32220 2011-06-28T14:11:08Z     TIB TIB.DAGST
#> 4 oai:oai.datacite.org:32241 2011-06-30T13:24:45Z     TIB TIB.DAGST
#> 5 oai:oai.datacite.org:32255 2011-07-01T12:09:24Z     TIB TIB.DAGST
```

### Get records


```r
dc_oai_getrecord(id = "56225")
#> $`oai:oai.datacite.org:56225`
#> $`oai:oai.datacite.org:56225`$header
#> # A tibble: 1 x 3
#>                   identifier            datestamp   setSpec
#>                        <chr>                <chr>     <chr>
#> 1 oai:oai.datacite.org:56225 2014-06-03T12:03:28Z BL;BL.ADS
#> 
#> $`oai:oai.datacite.org:56225`$metadata
#> # A tibble: 1 x 12
#>                                                                         title
#>                                                                         <chr>
#> 1 Land at Hill Barton, Clyst St Mary, Devon (NGR SY 0002 9083) Hill Barton In
#> # ... with 11 more variables: creator <chr>, publisher <chr>, date <chr>,
#> #   identifier <chr>, relation <chr>, subject <chr>, language <chr>,
#> #   type <chr>, format <chr>, rights <chr>, coverage <chr>
```

You can pass in more than one identifier to `id` parameter.

## Solr based search

This is the API for the same query interface you'd use on the DataCite website.

### Search

Search for the term _laser_


```r
dc_search(q = "laser", fl = c('doi','publicationYear'), rows = 5)
#> # A tibble: 5 x 2
#>                          doi publicationYear
#>                        <chr>           <chr>
#> 1 10.17035/D.2016.0008119129            2016
#> 2             10.7283/R3ZW26            2016
#> 3             10.7283/R3V30K            2016
#> 4      10.2314/GBV:377452467            2002
#> 5      10.2314/GBV:499941845            2004
```

Another search: published between 2000 and 2005


```r
dc_search(q = "publicationYear:[2000 TO 2005]", fl = c('doi', 'publicationYear'), rows = 5)
#> # A tibble: 5 x 2
#>                       doi publicationYear
#>                     <chr>           <chr>
#> 1 10.5279/DK-SA-DDA-10032            2003
#> 2  10.5279/DK-SA-DDA-1606            2002
#> 3  10.5279/DK-SA-DDA-1149            2001
#> 4  10.5279/DK-SA-DDA-9704            2004
#> 5  10.5279/DK-SA-DDA-5909            2001
```

### Facet


```r
dc_facet(q = "wind", facet.field = 'publisher_facet', facet.limit = 5)
#> $facet_queries
#> NULL
#> 
#> $facet_fields
#> $facet_fields$publisher_facet
#> # A tibble: 5 x 2
#>                                                         term value
#>                                                        <chr> <chr>
#> 1 PANGAEA - Data Publisher for Earth & Environmental Science 32456
#> 2                       Defense Technical Information Center  2382
#> 3                                                   Figshare  1545
#> 4                                                Unpublished  1193
#> 5                                                     Zenodo   609
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
#>                          min                max  count missing
#> date 01-Jan-2007/29-Nov-2010 September 30, 2015 154991    5409
#> 
#> $facet
#> NULL
```

### More-like-this


```r
dc_mlt(q = "ecology", mlt.fl = 'title', mlt.count = 2, fl = 'doi')
#> $docs
#> # A tibble: 10 x 1
#>                            doi
#>                          <chr>
#>  1         10.7892/BORIS.16589
#>  2         10.7892/BORIS.79067
#>  3         10.7892/BORIS.16333
#>  4      10.13140/2.1.3940.8968
#>  5      10.1594/PANGAEA.745038
#>  6      10.1594/PANGAEA.745039
#>  7      10.1594/PANGAEA.745049
#>  8 10.6084/M9.FIGSHARE.1540730
#>  9 10.6084/M9.FIGSHARE.1541138
#> 10 10.6084/M9.FIGSHARE.1178080
#> 
#> $mlt
#> $mlt$`7245706`
#> # A tibble: 2 x 3
#>   numFound start                      doi
#>      <int> <int>                    <chr>
#> 1      604     0 10.11588/DIGLIT.27812.12
#> 2      604     0         10.4224/23001521
#> 
#> $mlt$`8103779`
#> # A tibble: 1 x 2
#>   numFound start
#>      <int> <int>
#> 1        0     0
#> 
#> $mlt$`5704684`
#> # A tibble: 1 x 2
#>   numFound start
#>      <int> <int>
#> 1        0     0
#> 
#> $mlt$`4647415`
#> # A tibble: 1 x 2
#>   numFound start
#>      <int> <int>
#> 1        0     0
#> 
#> $mlt$`536251`
#> # A tibble: 1 x 2
#>   numFound start
#>      <int> <int>
#> 1        0     0
#> 
#> $mlt$`536252`
#> # A tibble: 1 x 2
#>   numFound start
#>      <int> <int>
#> 1        0     0
#> 
#> $mlt$`536260`
#> # A tibble: 1 x 2
#>   numFound start
#>      <int> <int>
#> 1        0     0
#> 
#> $mlt$`6743504`
#> # A tibble: 1 x 2
#>   numFound start
#>      <int> <int>
#> 1        0     0
#> 
#> $mlt$`6746350`
#> # A tibble: 1 x 2
#>   numFound start
#>      <int> <int>
#> 1        0     0
#> 
#> $mlt$`4013379`
#> # A tibble: 1 x 2
#>   numFound start
#>      <int> <int>
#> 1        0     0
```

## REST API

* `dc_data_center()` - Get a single data center
* `dc_data_centers()` - Search data centers
* `dc_member()` - Get single DataCite member
* `dc_members()` - Search DataCite members
* `dc_work()` - Get single works
* `dc_works()` - Search works

### Get a work


```r
dc_work(doi = "10.5438/0012")
#> $data
#> $data$id
#> [1] "10.5438/0012"
#> 
#> $data$type
#> [1] "works"
#> 
#> $data$attributes
#> $data$attributes$doi
#> [1] "10.5438/0012"
#> 
#> $data$attributes$identifier
#> [1] "https://doi.org/10.5438/0012"
#> 
#> $data$attributes$url
#> [1] "https://schema.datacite.org/meta/kernel-4.0/index.html"
#> 
#> $data$attributes$author
#>                           literal
#> 1 DataCite Metadata Working Group
#> 
#> $data$attributes$title
#> [1] "DataCite Metadata Schema Documentation for the Publication and Citation of Research Data v4.0"
#> 
#> $data$attributes$`container-title`
#> [1] "DataCite e.V."
#> 
#> $data$attributes$description
#> [1] "1 Introduction\n1.1 The DataCite Consortium\n1.2 DataCite Community Participation\n1.3 The Metadata Schema\n1.4 Version 4.0 Update\n2 DataCite Metadata Properties\n2.1 Overview\n2.2 Citation\n2.3 DataCite Properties\n3 XML Example\n4 XML Schema\n5 Other DataCite Services\nAppendices\nAppendix 1: Controlled List Definitions\nAppendix 2: Earlier Version Update Notes"
#> 
#> $data$attributes$`resource-type-subtype`
#> [1] "Documentation"
#> 
#> $data$attributes$`data-center-id`
#> [1] "datacite.datacite"
#> 
#> $data$attributes$`member-id`
#> [1] "datacite"
#> 
#> $data$attributes$`resource-type-id`
#> [1] "text"
#> 
#> $data$attributes$version
#> [1] "4.0"
#> 
#> $data$attributes$license
#> NULL
#> 
#> $data$attributes$`schema-version`
#> [1] "4"
#> 
#> $data$attributes$results
#>               id             title count
#> 1      Documents         Documents     1
#> 2 IsNewVersionOf Is new version of     1
#> 
#> $data$attributes$`related-identifiers`
#>   relation-type-id           related-identifier
#> 1        Documents https://doi.org/10.5438/0013
#> 2   IsNewVersionOf https://doi.org/10.5438/0010
#> 
#> $data$attributes$published
#> [1] "2016"
#> 
#> $data$attributes$registered
#> [1] "2016-09-19T21:53:56Z"
#> 
#> $data$attributes$updated
#> [1] "2016-09-19T22:16:45Z"
#> 
#> $data$attributes$media
#> NULL
#> 
#> $data$attributes$xml
#> [1] "PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz4NCjxyZXNvdXJjZSB4bWxucz0iaHR0cDovL2RhdGFjaXRlLm9yZy9zY2hlbWEva2VybmVsLTQiIHhtbG5zOnhzaT0iaHR0cDovL3d3dy53My5vcmcvMjAwMS9YTUxTY2hlbWEtaW5zdGFuY2UiIHhzaTpzY2hlbWFMb2NhdGlvbj0iaHR0cDovL2RhdGFjaXRlLm9yZy9zY2hlbWEva2VybmVsLTQgaHR0cDovL3NjaGVtYS5kYXRhY2l0ZS5vcmcvbWV0YS9rZXJuZWwtNC9tZXRhZGF0YS54c2QiPg0KCTxpZGVudGlmaWVyIGlkZW50aWZpZXJUeXBlPSJET0kiPjEwLjU0MzgvMDAxMjwvaWRlbnRpZmllcj4NCgk8Y3JlYXRvcnM+DQoJCTxjcmVhdG9yPg0KCQkJPGNyZWF0b3JOYW1lPkRhdGFDaXRlIE1ldGFkYXRhIFdvcmtpbmcgR3JvdXA8L2NyZWF0b3JOYW1lPg0KCQk8L2NyZWF0b3I+DQoJPC9jcmVhdG9ycz4NCgk8dGl0bGVzPg0KCQk8dGl0bGU+RGF0YUNpdGUgTWV0YWRhdGEgU2NoZW1hIERvY3VtZW50YXRpb24gZm9yIHRoZSBQdWJsaWNhdGlvbiBhbmQgQ2l0YXRpb24gb2YgUmVzZWFyY2ggRGF0YSB2NC4wPC90aXRsZT4NCgk8L3RpdGxlcz4NCgk8cHVibGlzaGVyPkRhdGFDaXRlIGUuVi48L3B1Ymxpc2hlcj4NCgk8cHVibGljYXRpb25ZZWFyPjIwMTY8L3B1YmxpY2F0aW9uWWVhcj4NCgk8Y29udHJpYnV0b3JzPg0KCQk8Y29udHJpYnV0b3IgY29udHJpYnV0b3JUeXBlPSJQcm9qZWN0TGVhZGVyIj4NCgkJCTxjb250cmlidXRvck5hbWU+U3RhcnIsIEpvYW48L2NvbnRyaWJ1dG9yTmFtZT4NCgkJCTxnaXZlbk5hbWU+Sm9hbjwvZ2l2ZW5OYW1lPg0KCQkJPGZhbWlseU5hbWU+U3RhcnI8L2ZhbWlseU5hbWU+DQoJCQk8bmFtZUlkZW50aWZpZXIgbmFtZUlkZW50aWZpZXJTY2hlbWU9Ik9SQ0lEIiBzY2hlbWVVUkk9Imh0dHA6Ly9vcmNpZC5vcmciPjAwMDAtMDAwMi03Mjg1LTAyN1g8L25hbWVJZGVudGlmaWVyPg0KCQkJPGFmZmlsaWF0aW9uPkNhbGlmb3JuaWEgRGlnaXRhbCBMaWJyYXJ5PC9hZmZpbGlhdGlvbj4NCgkJPC9jb250cmlidXRvcj4NCgkJPGNvbnRyaWJ1dG9yIGNvbnRyaWJ1dG9yVHlwZT0iUHJvamVjdExlYWRlciI+DQoJCQk8Y29udHJpYnV0b3JOYW1lPlNtYWVsZSwgTWFkZWxlaW5lIGRlPC9jb250cmlidXRvck5hbWU+DQoJCQk8Z2l2ZW5OYW1lPk1hZGVsZWluZSBkZTwvZ2l2ZW5OYW1lPg0KCQkJPGZhbWlseU5hbWU+U21hZWxlPC9mYW1pbHlOYW1lPg0KCQkJPGFmZmlsaWF0aW9uPlRVIERlbGZ0PC9hZmZpbGlhdGlvbj4NCgkJPC9jb250cmlidXRvcj4NCgkJPGNvbnRyaWJ1dG9yIGNvbnRyaWJ1dG9yVHlwZT0iRWRpdG9yIj4NCgkJCTxjb250cmlidXRvck5hbWU+QXNodG9uLCBKYW48L2NvbnRyaWJ1dG9yTmFtZT4NCgkJCTxnaXZlbk5hbWU+SmFuPC9naXZlbk5hbWU+DQoJCQk8ZmFtaWx5TmFtZT5Bc2h0b248L2ZhbWlseU5hbWU+DQoJCQk8YWZmaWxpYXRpb24+QnJpdGlzaCBMaWJyYXJ5PC9hZmZpbGlhdGlvbj4NCgkJPC9jb250cmlidXRvcj4NCgkJPGNvbnRyaWJ1dG9yIGNvbnRyaWJ1dG9yVHlwZT0iRWRpdG9yIj4NCgkJCTxjb250cmlidXRvck5hbWU+QmFydG9uLCBBbXk8L2NvbnRyaWJ1dG9yTmFtZT4NCgkJCTxnaXZlbk5hbWU+QW15PC9naXZlbk5hbWU+DQoJCQk8ZmFtaWx5TmFtZT5CYXJ0b248L2ZhbWlseU5hbWU+DQoJCQk8YWZmaWxpYXRpb24+UHVyZHVlIFVuaXZlcnNpdHkgTGlicmFyeTwvYWZmaWxpYXRpb24+DQoJCTwvY29udHJpYnV0b3I+DQoJCTxjb250cmlidXRvciBjb250cmlidXRvclR5cGU9IkVkaXRvciI+DQoJCQk8Y29udHJpYnV0b3JOYW1lPkJyYWRmb3JkLCBUaW5hPC9jb250cmlidXRvck5hbWU+DQoJCQk8Z2l2ZW5OYW1lPlRpbmE8L2dpdmVuTmFtZT4NCgkJCTxmYW1pbHlOYW1lPkJyYWRmb3JkPC9mYW1pbHlOYW1lPg0KCQkJPGFmZmlsaWF0aW9uPk5SQy9DSVNUSTwvYWZmaWxpYXRpb24+DQoJCTwvY29udHJpYnV0b3I+DQoJCTxjb250cmlidXRvciBjb250cmlidXRvclR5cGU9IkVkaXRvciI+DQoJCQk8Y29udHJpYnV0b3JOYW1lPkNpb2xla+KAkEZpZ2llbCwgQW5uZTwvY29udHJpYnV0b3JOYW1lPg0KCQkJPGdpdmVuTmFtZT5Bbm5lPC9naXZlbk5hbWU+DQoJCQk8ZmFtaWx5TmFtZT5DaW9sZWstRmlnaWVsPC9mYW1pbHlOYW1lPg0KCQkJPGFmZmlsaWF0aW9uPkluaXN04oCQQ05SUzwvYWZmaWxpYXRpb24+DQoJCTwvY29udHJpYnV0b3I+DQoJCTxjb250cmlidXRvciBjb250cmlidXRvclR5cGU9IkVkaXRvciI+DQoJCQk8Y29udHJpYnV0b3JOYW1lPkRpZXRpa2VyLCBTdGVmYW5pZTwvY29udHJpYnV0b3JOYW1lPg0KCQkJPGdpdmVuTmFtZT5TdGVmYW5pZTwvZ2l2ZW5OYW1lPg0KCQkJPGZhbWlseU5hbWU+RGlldGlrZXI8L2ZhbWlseU5hbWU+DQoJCQk8YWZmaWxpYXRpb24+RVRIIFrDvHJpY2g8L2FmZmlsaWF0aW9uPg0KCQk8L2NvbnRyaWJ1dG9yPg0KCQk8Y29udHJpYnV0b3IgY29udHJpYnV0b3JUeXBlPSJFZGl0b3IiPg0KCQkJPGNvbnRyaWJ1dG9yTmFtZT5FbGxpb3R0LCBKYW5uZWFuPC9jb250cmlidXRvck5hbWU+DQoJCQk8Z2l2ZW5OYW1lPkphbm5lYW48L2dpdmVuTmFtZT4NCgkJCTxmYW1pbHlOYW1lPkVsbGlvdDwvZmFtaWx5TmFtZT4NCgkJCTxhZmZpbGlhdGlvbj5ET0UvT1NUSTwvYWZmaWxpYXRpb24+DQoJCTwvY29udHJpYnV0b3I+DQoJCTxjb250cmlidXRvciBjb250cmlidXRvclR5cGU9IkVkaXRvciI+DQoJCQk8Y29udHJpYnV0b3JOYW1lPkdlbmF0LCBCZXJyaXQ8L2NvbnRyaWJ1dG9yTmFtZT4NCgkJCTxnaXZlbk5hbWU+QmVycml0PC9naXZlbk5hbWU+DQoJCQk8ZmFtaWx5TmFtZT5HZW5hdDwvZmFtaWx5TmFtZT4NCgkJCTxhZmZpbGlhdGlvbj5USUI8L2FmZmlsaWF0aW9uPg0KCQk8L2NvbnRyaWJ1dG9yPg0KCQk8Y29udHJpYnV0b3IgY29udHJpYnV0b3JUeXBlPSJFZGl0b3IiPg0KCQkJPGNvbnRyaWJ1dG9yTmFtZT5IYXJ6ZW5ldHRlciwgS2Fyb2xpbmU8L2NvbnRyaWJ1dG9yTmFtZT4NCgkJCTxnaXZlbk5hbWU+S2Fyb2xpbmU8L2dpdmVuTmFtZT4NCgkJCTxmYW1pbHlOYW1lPkhhcnplbmV0dGVyPC9mYW1pbHlOYW1lPg0KCQkJPGFmZmlsaWF0aW9uPkdFU0lTPC9hZmZpbGlhdGlvbj4NCgkJPC9jb250cmlidXRvcj4NCgkJPGNvbnRyaWJ1dG9yIGNvbnRyaWJ1dG9yVHlwZT0iRWRpdG9yIj4NCgkJCTxjb250cmlidXRvck5hbWU+SGlyc2NobWFubiwgQmFyYmFyYTwvY29udHJpYnV0b3JOYW1lPg0KCQkJPGdpdmVuTmFtZT5CYXJiYXJhPC9naXZlbk5hbWU+DQoJCQk8ZmFtaWx5TmFtZT5IaXJzY2htYW5uPC9mYW1pbHlOYW1lPg0KCQkJPG5hbWVJZGVudGlmaWVyIG5hbWVJZGVudGlmaWVyU2NoZW1lPSJPUkNJRCIgc2NoZW1lVVJJPSJodHRwOi8vb3JjaWQub3JnIj4wMDAwLTAwMDMtMDI4OS0wMzQ1PC9uYW1lSWRlbnRpZmllcj4NCgkJCTxhZmZpbGlhdGlvbj5FVEggWsO8cmljaDwvYWZmaWxpYXRpb24+DQoJCTwvY29udHJpYnV0b3I+DQoJCTxjb250cmlidXRvciBjb250cmlidXRvclR5cGU9IkVkaXRvciI+DQoJCQk8Y29udHJpYnV0b3JOYW1lPkpha29ic3NvbiwgU3RlZmFuPC9jb250cmlidXRvck5hbWU+DQoJCQk8Z2l2ZW5OYW1lPlN0ZWZhbjwvZ2l2ZW5OYW1lPg0KCQkJPGZhbWlseU5hbWU+SmFrb2Jzc29uPC9mYW1pbHlOYW1lPg0KCQkJPGFmZmlsaWF0aW9uPlNORDwvYWZmaWxpYXRpb24+DQoJCTwvY29udHJpYnV0b3I+DQoJCTxjb250cmlidXRvciBjb250cmlidXRvclR5cGU9IkVkaXRvciI+DQoJCQk8Y29udHJpYnV0b3JOYW1lPk1haWxsb3V4LCBKZWFu4oCQWXZlczwvY29udHJpYnV0b3JOYW1lPg0KCQkJPGdpdmVuTmFtZT5KZWFuLVl2ZXM8L2dpdmVuTmFtZT4NCgkJCTxmYW1pbHlOYW1lPk1haWxsb3V4PC9mYW1pbHlOYW1lPg0KCQkJPGFmZmlsaWF0aW9uPk5SQy9DSVNUSTwvYWZmaWxpYXRpb24+DQoJCTwvY29udHJpYnV0b3I+DQoJCTxjb250cmlidXRvciBjb250cmlidXRvclR5cGU9IkVkaXRvciI+DQoJCQk8Y29udHJpYnV0b3JOYW1lPk5ld2JvbGQsIEVsaXphYmV0aDwvY29udHJpYnV0b3JOYW1lPg0KCQkJPGdpdmVuTmFtZT5FbGl6YWJldGg8L2dpdmVuTmFtZT4NCgkJCTxmYW1pbHlOYW1lPk5ld2JvbGQ8L2ZhbWlseU5hbWU+DQoJCQk8bmFtZUlkZW50aWZpZXIgbmFtZUlkZW50aWZpZXJTY2hlbWU9Ik9SQ0lEIiBzY2hlbWVVUkk9Imh0dHA6Ly9vcmNpZC5vcmciPjAwMDAtMDAwMi04MjU1LTkwMTM8L25hbWVJZGVudGlmaWVyPg0KCQkJPGFmZmlsaWF0aW9uPkJyaXRpc2ggTGlicmFyeTwvYWZmaWxpYXRpb24+DQoJCTwvY29udHJpYnV0b3I+DQoJCQkJPGNvbnRyaWJ1dG9yIGNvbnRyaWJ1dG9yVHlwZT0iRWRpdG9yIj4NCgkJCTxjb250cmlidXRvck5hbWU+TmllbHNlbiwgTGFycyBIb2xtIDwvY29udHJpYnV0b3JOYW1lPg0KCQkJPGdpdmVuTmFtZT5MYXJzIEhvbG08L2dpdmVuTmFtZT4NCgkJCTxmYW1pbHlOYW1lPk5pZWxzZW48L2ZhbWlseU5hbWU+DQoJCQk8bmFtZUlkZW50aWZpZXIgbmFtZUlkZW50aWZpZXJTY2hlbWU9Ik9SQ0lEIiBzY2hlbWVVUkk9Imh0dHA6Ly9vcmNpZC5vcmciPjAwMDAtMDAwMS04MTM1LTM0ODk8L25hbWVJZGVudGlmaWVyPg0KCQkJPGFmZmlsaWF0aW9uPkNFUk48L2FmZmlsaWF0aW9uPg0KCQk8L2NvbnRyaWJ1dG9yPg0KCQk8Y29udHJpYnV0b3IgY29udHJpYnV0b3JUeXBlPSJFZGl0b3IiPg0KCQkJPGNvbnRyaWJ1dG9yTmFtZT5ZYWhpYSwgTW9oYW1lZDwvY29udHJpYnV0b3JOYW1lPg0KCQkJPGdpdmVuTmFtZT5Nb2hhbWVkPC9naXZlbk5hbWU+DQoJCQk8ZmFtaWx5TmFtZT5ZYWhpYTwvZmFtaWx5TmFtZT4NCgkJCTxhZmZpbGlhdGlvbj5JbmlzdC1DTlJTPC9hZmZpbGlhdGlvbj4NCgkJPC9jb250cmlidXRvcj4NCgkJPGNvbnRyaWJ1dG9yIGNvbnRyaWJ1dG9yVHlwZT0iU3VwZXJ2aXNvciI+DQoJCQk8Y29udHJpYnV0b3JOYW1lPlppZWRvcm4sIEZyYXVrZTwvY29udHJpYnV0b3JOYW1lPg0KCQkJPGdpdmVuTmFtZT5GcmF1a2U8L2dpdmVuTmFtZT4NCgkJCTxmYW1pbHlOYW1lPlppZWRvcm48L2ZhbWlseU5hbWU+DQoJCQk8bmFtZUlkZW50aWZpZXIgbmFtZUlkZW50aWZpZXJTY2hlbWU9Ik9SQ0lEIiBzY2hlbWVVUkk9Imh0dHA6Ly9vcmNpZC5vcmciPjAwMDAtMDAwMi0xMTQzLTc4MVg8L25hbWVJZGVudGlmaWVyPg0KCQkJPGFmZmlsaWF0aW9uPlRJQjwvYWZmaWxpYXRpb24+DQoJCTwvY29udHJpYnV0b3I+DQoJPC9jb250cmlidXRvcnM+DQoJPGxhbmd1YWdlPmVuZzwvbGFuZ3VhZ2U+DQoJPHJlc291cmNlVHlwZSByZXNvdXJjZVR5cGVHZW5lcmFsPSJUZXh0Ij5Eb2N1bWVudGF0aW9uPC9yZXNvdXJjZVR5cGU+DQoJPHJlbGF0ZWRJZGVudGlmaWVycz4NCgkJPHJlbGF0ZWRJZGVudGlmaWVyIHJlbGF0ZWRJZGVudGlmaWVyVHlwZT0iRE9JIiByZWxhdGlvblR5cGU9IkRvY3VtZW50cyI+MTAuNTQzOC8wMDEzPC9yZWxhdGVkSWRlbnRpZmllcj4NCgkJPHJlbGF0ZWRJZGVudGlmaWVyIHJlbGF0ZWRJZGVudGlmaWVyVHlwZT0iRE9JIiByZWxhdGlvblR5cGU9IklzTmV3VmVyc2lvbk9mIj4xMC41NDM4LzAwMTA8L3JlbGF0ZWRJZGVudGlmaWVyPg0KCTwvcmVsYXRlZElkZW50aWZpZXJzPg0KCTxzaXplcz4NCgkJPHNpemU+NDUgcGFnZXM8L3NpemU+DQoJPC9zaXplcz4NCgk8Zm9ybWF0cz4NCgkJPGZvcm1hdD5hcHBsaWNhdGlvbi9wZGY8L2Zvcm1hdD4NCgk8L2Zvcm1hdHM+DQoJPHZlcnNpb24+NC4wPC92ZXJzaW9uPg0KCTxkZXNjcmlwdGlvbnM+DQoJCTxkZXNjcmlwdGlvbiBkZXNjcmlwdGlvblR5cGU9IlRhYmxlT2ZDb250ZW50cyI+MSBJbnRyb2R1Y3Rpb248YnIvPg0KMS4xIFRoZSBEYXRhQ2l0ZSBDb25zb3J0aXVtPGJyLz4NCjEuMiBEYXRhQ2l0ZSBDb21tdW5pdHkgUGFydGljaXBhdGlvbjxici8+DQoxLjMgVGhlIE1ldGFkYXRhIFNjaGVtYTxici8+DQoxLjQgVmVyc2lvbiA0LjAgVXBkYXRlPGJyLz4NCjIgRGF0YUNpdGUgTWV0YWRhdGEgUHJvcGVydGllczxici8+DQoyLjEgT3ZlcnZpZXc8YnIvPg0KMi4yIENpdGF0aW9uPGJyLz4NCjIuMyBEYXRhQ2l0ZSBQcm9wZXJ0aWVzPGJyLz4NCjMgWE1MIEV4YW1wbGU8YnIvPg0KNCBYTUwgU2NoZW1hPGJyLz4NCjUgT3RoZXIgRGF0YUNpdGUgU2VydmljZXM8YnIvPg0KQXBwZW5kaWNlczxici8+DQpBcHBlbmRpeCAxOiBDb250cm9sbGVkIExpc3QgRGVmaW5pdGlvbnM8YnIvPg0KQXBwZW5kaXggMjogRWFybGllciBWZXJzaW9uIFVwZGF0ZSBOb3RlczwvZGVzY3JpcHRpb24+DQoJPC9kZXNjcmlwdGlvbnM+DQo8L3Jlc291cmNlPg0K"
#> 
#> 
#> $data$relationships
#> $data$relationships$`data-center`
#> $data$relationships$`data-center`$meta
#> named list()
#> 
#> 
#> $data$relationships$member
#> $data$relationships$member$meta
#> named list()
#> 
#> 
#> $data$relationships$`resource-type`
#> $data$relationships$`resource-type`$meta
#> named list()
```


## Meta

* Please [report any issues or bugs](https://github.com/ropensci/rdatacite/issues).
* License: MIT
* Get citation information for `rdatacite` in R doing `citation(package = 'rdatacite')`
* Please note that this project is released with a [Contributor Code of Conduct](CONDUCT.md). By participating in this project you agree to abide by its terms.
