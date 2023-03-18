#' Get directory
#'
#' @param proj.nm character First line in anchor file.
#' @param anchor character Anchor filename.
#' @param stop.here Path. Top path to stop search.
#'
#' @return character Path.
#' @export
#'
#' @examples \dontrun{ishere("my project.")}
ishere <-
  function(
    proj.nm = "i am here", ## first line in anchor file
    anchor = "_proj_version_", ## anchor file
    stop.here = "/mnt" ## absolute path, exsit
  ) {
    stop.here <- normalizePath(stop.here)
    pwd <- getwd()

    if (!dir.exists(stop.here)) {
      stop(paste(stop.here, "is not exist!"))
    } else if (!startsWith(stop.here, "/")) {
      stop(paste(stop.here, "is not absolute path!"))
    } else {
      if (!startsWith(pwd, stop.here)) {
        stop(paste(stop.here, pwd, "are different paths!"))
      }
    }

    while (startsWith(pwd, stop.here)) {
      files <-
        list.files(
          pwd,
          pattern = paste0("^", anchor, "$"),
          all.files = TRUE,
          full.names = TRUE,
          include.dirs = FALSE,
          no.. = TRUE
        )

      if (length(files) == 0) {
        if (pwd == stop.here) {
          stop(paste0("Could not find anchor files: ", anchor))
        } else {
          pwd <- normalizePath(file.path(pwd, ".."))
        }
      } else {
        proj.mess <- suppressWarnings(readLines(files, n = 1))
        proj.dir <- dirname(files)
        if (proj.nm == proj.mess) {
          message(paste0("Project directory is here: ", proj.dir))
          message(paste0("Project message: ", proj.mess))
          break
        } else {
          message(paste0("Required project message: ", proj.nm))
          message(paste0("Offered project message: ", proj.mess))
          stop("Messages are not identical!")
        }
      }
    }

    return(proj.dir)
  }
