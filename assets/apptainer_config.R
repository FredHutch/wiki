

local({

  inContainer <- function() file.exists("/singularity")
  if (inContainer()) {

    # if any element of .libPaths() starts with "/home", remove it
    if (any(grepl("^/home", .libPaths()))) {
      .libPaths(.libPaths()[!grepl("^/home", .libPaths())]) }

    version <- paste0(R.version$major, ".", substr(R.version$minor, 1, 1),
      "-apptainer")

    localPath <- file.path("/home", Sys.info()[["user"]], "R",
      "x86_64-pc-linux-gnu-library", version)
    dir.create(localPath, recursive =
      TRUE, showWarnings = FALSE)

    .libPaths(c(localPath, .libPaths()))

  }
})
