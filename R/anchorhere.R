#' Drop the anchor to specific directory
#'
#' @param proj.mess character First line in anchor file.
#' @param anchor character Anchor filename.
#' @param path Path. Directory to drop anchor.
#'
#' @return NULL
#' @export
#'
#' @examples \dontrun{anchorhere("my project!")}
anchorhere <-
  function(
    proj.mess = date(), ## first line in anchor file
    anchor = "_proj_version_", ## anchor file
    path = "./" ## absolute path, exsit
  ) {
    if (!dir.exists(path)) {
      stop(paste(path, "dosen't exist!"))
    }

    if (file.exists(anchor)) {
      stop(paste(anchor, " exist!"))
    }

    writeLines(
      proj.mess,
      file.path(path, anchor)
    )

    message("Done!")
  }
