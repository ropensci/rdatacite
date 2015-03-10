rdatacite
=========



[![Build Status](https://travis-ci.org/ropensci/rdatacite.svg?branch=master)](https://travis-ci.org/ropensci/rdatacite)

`rdatacite` is an R package that provides programmatic accesses to [DataCite](http://datacite.org/) metadata via via 

* OAI-PMH. Documentation for the DataCite OAI-PMH is available [here](http://oai.datacite.org/). [Documentation for OAI-PMH](http://www.openarchives.org/OAI/openarchivesprotocol.html)
* REST API. [Docs](http://search.datacite.org/help.html). [Metadata schema](http://schema.datacite.org/). [Solr config file](https://github.com/datacite/search/blob/master/src/main/resources/solrconfig.xml)

## Quickstart

### Installation

> Note: If you want to use `wt='csv'` in `dc_*()` function calls, you'll need `solr` package version `0.1.8.99` or greater. Installation instructions at [https://github.com/ropensci/solr#quick-start](https://github.com/ropensci/solr#quick-start). Everything else will work just fine with CRAN version of `solr`


```r
install.packages("devtools")
devtools::install_github("ropensci/rdatacite")
```


```r
library('rdatacite')
```

### OAI-PMH

#### Ping the service


```r
dc_oai_identify()
#> $repositoryName
#> [1] "DataCite MDS"
#> 
#> $baseURL
#> [1] "http://oai.datacite.org/oai"
#> 
#> $protocolVersion
#> [1] "2.0"
#> 
#> $earliestDatestamp
#> [1] "2011-01-01T00:00:00Z"
#> 
#> $deletedRecord
#> [1] "persistent"
#> 
#> $granularity
#> [1] "YYYY-MM-DDThh:mm:ssZ"
#> 
#> $adminEmail
#> [1] "admin@datacite.org"
#> 
#> $compression
#> [1] "gzip"    "deflate"
#> 
#> $description
#> $description[[1]]
#> <oai-identifier schemaLocation="http://www.openarchives.org/OAI/2.0/oai-identifier http://www.openarchives.org/OAI/2.0/oai-identifier.xsd" xmlns="http://www.openarchives.org/OAI/2.0/oai-identifier" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
#>  <scheme>oai</scheme>
#>  <repositoryIdentifier>oai.datacite.org</repositoryIdentifier>
#>  <delimiter>:</delimiter>
#>  <sampleIdentifier>oai:oai.datacite.org:12425</sampleIdentifier>
#> </oai-identifier>
```

#### List metadata formats


```r
dc_oai_listmetadataformats(id = "56225")
#>      metadataPrefix
#> [1,] "oai_dc"      
#> [2,] "datacite"    
#> [3,] "oai_datacite"
#>      schema                                                       
#> [1,] "http://www.openarchives.org/OAI/2.0/oai_dc.xsd"             
#> [2,] "http://schema.datacite.org/meta/nonexistant/nonexistant.xsd"
#> [3,] "http://schema.datacite.org/oai/oai-1.0/oai.xsd"             
#>      metadataNamespace                            
#> [1,] "http://www.openarchives.org/OAI/2.0/oai_dc/"
#> [2,] "http://datacite.org/schema/nonexistant"     
#> [3,] "http://schema.datacite.org/oai/oai-1.0/"
```

#### List identifiers


```r
dc_oai_listidentifiers(from = '2011-06-01T', until = '2011-07-01T')
#>      identifier                   datestamp              setSpec    
#> [1,] "oai:oai.datacite.org:32153" "2011-06-08T08:57:11Z" Character,2
#> [2,] "oai:oai.datacite.org:32200" "2011-06-20T08:12:41Z" Character,2
#> [3,] "oai:oai.datacite.org:32220" "2011-06-28T14:11:08Z" Character,2
#> [4,] "oai:oai.datacite.org:32241" "2011-06-30T13:24:45Z" Character,2
#> [5,] "oai:oai.datacite.org:32255" "2011-07-01T12:09:24Z" Character,2
```

#### Get records


```r
out <- dc_oai_getrecord(id = "56225", transform = TRUE)
```

Get $identifier, $datestamp, $setSpec, or $metadata


```r
out$metadata
#> <oai_dc:dc schemaLocation="http://www.openarchives.org/OAI/2.0/oai_dc/ http://www.openarchives.org/OAI/2.0/oai_dc.xsd" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:oai_dc="http://www.openarchives.org/OAI/2.0/oai_dc/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
#>  <dc:title>Land at Hill Barton, Clyst St Mary, Devon (NGR SY 0002 9083) Hill Barton Industrial Park Strip Map and Sample Excavation Summary Report</dc:title>
#>  <dc:creator>AC archaeology Ltd</dc:creator>
#>  <dc:publisher>Archaeology Data Service</dc:publisher>
#>  <dc:date>2011</dc:date>
#>  <dc:identifier>doi:10.5284/1011335</dc:identifier>
#>  <dc:identifier>ads grey lit id:12257</dc:identifier>
#>  <dc:identifier>oasis id:acarchae2-108244</dc:identifier>
#>  <dc:relation>url:http://archaeologydataservice.ac.uk/archives/view/greylit/</dc:relation>
#>  <dc:subject>Archaeology</dc:subject>
#>  <dc:subject>Grey Literature</dc:subject>
#>  <dc:language>en</dc:language>
#>  <dc:type>Text</dc:type>
#>  <dc:type>Report</dc:type>
#>  <dc:format>1 pdf file</dc:format>
#>  <dc:format>PDF</dc:format>
#>  <dc:rights>ADS Terms and Conditions apply to reuse</dc:rights>
#>  <dc:rights>http://archaeologydataservice.ac.uk/advice/termsOfUseAndAccess</dc:rights>
#>  <dc:coverage>50.708481 -3.417317</dc:coverage>
#>  <dc:coverage>ENGLAND, DEVON, EAST DEVON, CLYST ST MARY</dc:coverage>
#> </oai_dc:dc>
```

Transform only metadata to a list


```r
library("OAIHarvester")
oaih_transform(out$metadata)
#> $title
#> [1] "Land at Hill Barton, Clyst St Mary, Devon (NGR SY 0002 9083) Hill Barton Industrial Park Strip Map and Sample Excavation Summary Report"
#> 
#> $creator
#> [1] "AC archaeology Ltd"
#> 
#> $subject
#> [1] "Archaeology"     "Grey Literature"
#> 
#> $description
#> character(0)
#> 
#> $publisher
#> [1] "Archaeology Data Service"
#> 
#> $contributor
#> character(0)
#> 
#> $date
#> [1] "2011"
#> 
#> $type
#> [1] "Text"   "Report"
#> 
#> $format
#> [1] "1 pdf file" "PDF"       
#> 
#> $identifier
#> [1] "doi:10.5284/1011335"       "ads grey lit id:12257"    
#> [3] "oasis id:acarchae2-108244"
#> 
#> $source
#> character(0)
#> 
#> $language
#> [1] "en"
#> 
#> $relation
#> [1] "url:http://archaeologydataservice.ac.uk/archives/view/greylit/"
#> 
#> $coverage
#> [1] "50.708481 -3.417317"                      
#> [2] "ENGLAND, DEVON, EAST DEVON, CLYST ST MARY"
#> 
#> $rights
#> [1] "ADS Terms and Conditions apply to reuse"                       
#> [2] "http://archaeologydataservice.ac.uk/advice/termsOfUseAndAccess"
```

### REST API

This is the API for the same query interface you'd use on the DataCite website.

#### Search

Search for the term _laser_


```r
dc_search(q = "laser", fl=c('doi','publicationYear'), rows=5)
#>                     doi publicationYear
#> 1   10.5169/SEALS-52668            1982
#> 2 10.2314/GBV:493109919            2005
#> 3 10.2314/GBV:493105263            2005
#> 4 10.2314/GBV:487077911            2004
#> 5 10.2314/GBV:607866403            2008
```

Another search: published between 2000 and 2005


```r
dc_search(q = "publicationYear:[2000 TO 2005]", fl=c('doi','publicationYear'), rows=5)
#>                        doi publicationYear
#> 1    10.4126/38M-004600344            2005
#> 2    10.4126/38M-004600340            2004
#> 3    10.4126/38M-004600357            2005
#> 4          10.5284/1017091            2002
#> 5 10.3929/ETHZ-A-001561087            2002
```

#### Facet


```r
dc_facet(q = "wind", facet.field='publisher', facet.limit=5)
#> $facet_queries
#> NULL
#> 
#> $facet_fields
#> $facet_fields$publisher
#>          X1    X2
#> 1      data 31609
#> 2       for 30493
#> 3 publisher 30262
#> 4   science 30261
#> 5     earth 30237
#> 
#> 
#> $facet_dates
#> NULL
#> 
#> $facet_ranges
#> NULL
```

#### Stats



```r
dc_stats(q = "ecology", stats.field='date')
#>                       min        max count missing
#> 1 01-Jan-2007/29-Nov-2010 22.07.2014  4493    2269
```

#### More-like-this


```r
dc_mlt(q = "ecology", mlt.fl='title', mlt.count=2, fl='doi')
#> $docs
#>                  doi
#> 1  10.5167/UZH-30455
#> 2  10.5167/UZH-49216
#> 3    10.5167/UZH-503
#> 4  10.5167/UZH-38402
#> 5  10.5167/UZH-41217
#> 6    10.5167/UZH-402
#> 7  10.5167/UZH-76182
#> 8  10.5167/UZH-76892
#> 9    10.5167/UZH-584
#> 10 10.5167/UZH-61344
#> 
#> $mlt
#> $mlt$`1699696`
#>                         doi
#> 1 10.6084/M9.FIGSHARE.15727
#> 2  10.6084/M9.FIGSHARE.4171
#> 
#> $mlt$`1695042`
#>                         doi
#> 1        10.5169/SEALS-1649
#> 2 10.6084/M9.FIGSHARE.28839
#> 
#> $mlt$`1712859`
#>                         doi
#> 1 10.6084/M9.FIGSHARE.14529
#> 2 10.6084/M9.FIGSHARE.15901
#> 
#> $mlt$`1712990`
#>                         doi
#> 1 10.6084/M9.FIGSHARE.15727
#> 2  10.6084/M9.FIGSHARE.4171
```


## Meta

* Please [report any issues or bugs](https://github.com/ropensci/rdatacite/issues).
* License: MIT
* Get citation information for `rdatacite` in R doing `citation(package = 'rdatacite')`

[![ropensci](http://ropensci.org/public_images/github_footer.png)](http://ropensci.org)
