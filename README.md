# ishere: anchor and search target path for project

## Drop anchor
```r
anchorhere(
  proj.mess = "project test",
  anchor = "_proj_version_",
  path = "./"
)
```

## Search anchor directory
```r
ishere(
  proj.mess = "project test",
  anchor = "_proj_version_",
  stop.here = "/mnt"
)
```

## Search specific file
```r
whereis(
  path = "./",
  pattern = "_proj_version_",
  absolute.nm = TRUE,
  ignore.case = FALSE
)
```

## Get sub directory of project
```r
tothere(
  anchor.path = ishere(),
  to.branch = "data",
  pwd.branch = "script"
)
```
