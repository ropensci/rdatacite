rdatacite 0.5.2
===============

### MINOR IMPROVEMENTS

* fix breaking test on one of the cran checks (#30)


rdatacite 0.5.0
===============

### NEW FEATURES

* Major refactor to work with the new DataCite API: all functions from the previous version are defunct; all OAI-PMH functions are gone; new functions all start with `dc_` (#24) (#29)

### MINOR IMPROVEMENTS

* all examples check if DataCite API is up before running (#28)


rdatacite 0.4.2
===============

### MINOR IMPROVEMENTS

* fix to two fixtures that had non-ascii text in them, that were causing tests to fail (#25)


rdatacite 0.4.0
===============

### MINOR IMPROVEMENTS

* pagination fixes (#18)
* fix unused httr package warning, flagged by cran team (#21)
* add .github PR and issue templates


rdatacite 0.3.0
===============

### NEW FEATURES

* Gains new functions for working with the DataCite REST API:
`dc_data_center`, `dc_data_centers`, `dc_member`, `dc_members`,
`dc_work`, `dc_works` (#13)
* Now using new version of solrium package - users shouldn't see any differences (#16)

### BUG FIXES

* Fix scientific notation (#15)
* Fix `vapply` error (#14)



rdatacite 0.1.0
===============

### NEW FEATURES

* Released to CRAN.
