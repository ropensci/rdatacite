## Test environments

* local OS X install, R 3.6.0
* ubuntu 14.04 (on travis-ci), R 3.6.0
* win-builder (devel and release)

## R CMD check results

0 errors | 0 warnings | 0 notes

## Reverse dependencies

There are no reverse dependencies.

---

This version fixes two test fixtures that had non-ascii text that caused tests to fail on debian clang devel.

Thanks!
Scott Chamberlain
