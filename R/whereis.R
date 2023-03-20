#' Find files under target path
#'
#' @param path character Path.
#' @param pattern character File pattern
#' @param ... character Specify subpathes to search.
#' @param absolute.nm logical 'pattern' is full name or not.
#' @param ignore.case logical Should pattern-matching be case-insensitive?
#'
#' @return character Path.
#' @export
#'
#' @examples \dontrun{whereis(pattern = "_proj_version_")}
#' @examples \dontrun{whereis(pattern = "_proj_version_", "here", "there")}
whereis <-
  function(
    path = "./",
    pattern,
    ..., ##
    absolute.nm = TRUE,
    ignore.case = FALSE
  ) {
    if (!missing(pattern)) {
      path <- normalizePath(path)

      if (dir.exists(path)) {
        files <-
          list.files(
            path = path,
            pattern = ifelse(absolute.nm, paste0("^", pattern, "$"), pattern),
            all.files = TRUE,
            full.names = TRUE,
            recursive = TRUE,
            ignore.case = ignore.case,
            include.dirs = FALSE,
            no.. = TRUE
          )

        subpath <- list(...)
        if (length(subpath) > 0) {
          i <- 1
          while (i <= length(subpath)) {
            files <-
              grep(
                subpath[[i]], sub(paste0("^", path), "", files),
                ignore.case = ignore.case,
                value = TRUE
              )

            i <- i + 1
          }
        }

        if (length(files) == 0) {
          stop(paste0(pattern, " does not found!"))
        } else {
          res <- normalizePath(file.path(path, files))
          message(paste0("Here: ", paste0(res, collapse = ", ")))

          return(res)
        }
      } else {
        stop(paste0(path, " dose not exsit!"))
      }
    } else {
      stop("'pattern' missing!")
    }
  }
