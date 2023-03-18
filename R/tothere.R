#' Return target subpath of project root of same depth with current directory
#'
#' @param anchor.path character Project root path.
#' @param to.branch character Target subpath of project root path.
#' @param pwd.branch character Current subpath of project root path.
#'
#' @return character Path
#' @export
#'
#' @examples \dontrun{tothere(ishere("my project!"))}
tothere <-
  function(
    anchor.path, ## project root path, from ishere()
    to.branch = "data", ## target subpath of project root path
    pwd.branch = "script" ## current subpath of project root path
    ## leaf
  ) {
    if (!dir.exists(anchor.path)) {
      stop(paste(anchor.path, "dosen't exist!"))
    } else {
      anchor.path <- normalizePath(anchor.path)
    }

    pwd <- getwd()

    if (!startsWith(pwd, anchor.path)) {
      stop("You are not in project!")
    }

    if (pwd == anchor.path) {
      stop(paste0("You are not in branch of: ", anchor.path))
    }

    branch.dir <-
      sub(
        file.path(anchor.path, pwd.branch),
        file.path(anchor.path, to.branch),
        getwd()
      )

    message(paste0("New path: ", branch.dir))
    return(branch.dir)
  }
