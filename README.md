# rdatacite #


`rdatacite` accesses DataCite metadata using their OAI-PMH harvester. 

You do not need an API key. 

Documentation for the DataCite OAI-PMH [here](http://oai.datacite.org/).

Documentation for OAI-PMH in general [here](http://www.openarchives.org/OAI/openarchivesprotocol.html).

DataCite code dev on Github [here](https://github.com/datacite/OAIP).

`rdatacite` is part of the rOpenSci project, visit http://ropensci.org to learn more.

# Install `rdatacite` from GitHub:

```R 
install.packages("devtools")
require(devtools)
install_github("rdatacite", "ropensci")
require(rdatacite)
```