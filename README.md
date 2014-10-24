# rdatacite #

`rdatacite` is an R package that provides programmatic accesses to [DataCite](http://datacite.org/)'s metadata using their OAI-PMH harvester.  The package does not require an API key. Documentation for the DataCite OAI-PMH is available [here](http://oai.datacite.org/).

# Installing `rdatacite` from GitHub

```R 
install.packages("devtools")
require(devtools)
install_github("rdatacite", "ropensci")
require(rdatacite)
```

## Reference

* [Documentation for OAI-PMH](http://www.openarchives.org/OAI/openarchivesprotocol.html)
* DataCite's own [code development on Github](https://github.com/datacite/OAIP) is available
* DataCite [metadata schema](http://schema.datacite.org/)
* DataCite [Solr config file](https://github.com/datacite/search/blob/master/src/main/resources/solrconfig.xml)

----

`rdatacite` is part of the rOpenSci project, visit http://ropensci.org to learn more.


## Meta

* Please [report any issues or bugs](https://github.com/ropensci/rdatacite/issues).
* License: MIT
* Get citation information for `rdatacite` in R doing `citation(package = 'rdatacite')`

[![ropensci](http://ropensci.org/public_images/github_footer.png)](http://ropensci.org)
