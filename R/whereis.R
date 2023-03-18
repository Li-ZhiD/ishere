#' Find files under target path
#'
#' @param path character Path.
#' @param pattern character File pattern
#' @param absolute.nm logical 'pattern' is full name or not.
#' @param ... character Specify subpath to search.
#'
#' @return character Path.
#' @export
#'
#' @examples \dontrun{whereis(pattern = "_proj_version_")}
whereis <-
  function(
    path = "./",
    pattern,
    absolute.nm = TRUE,
    ... ##
  ) {
    if (!missing(pattern)) {
      path <- normalizePath(file.path(path, ...))
      if (dir.exists(path)) {
        list.files(
          path = path,
          pattern = ifelse(absolute.nm, paste0("^", pattern, "$"), pattern),
          all.files = TRUE,
          full.names = TRUE,
          recursive = TRUE,
          include.dirs = FALSE,
          no.. = TRUE
        )
      } else {
        stop(paste0(path, " dose not exsit!"))
      }
    } else {
      stop("'pattern' missing!")
    }

    return(path)
  }
