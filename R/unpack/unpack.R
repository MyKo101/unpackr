#' unpack
#' @name unpack
#'
#' @title Unpack
#'
#' @description
#' Unpacks all files in subdirectories of the R folder to conform to
#' R's flat file requirements. Make sure you `pack()` after doing this.

#' @export
unpack <- function(){
  stopifnot(file.exists("DESCRIPTION"))
  flist <- list.files("R",recursive = TRUE,all.files=TRUE)

  invisible(lapply(flist,unpack_file))

  dlist <- setdiff(list.dirs("R"),"R")
  invisible(lapply(dlist,unlink))

}

unpack_file <- function(x){
  dest <- gsub(.Platform$file.sep,"_-_",x)
  if(dest != x){
    cat("Unpacking file",x,"->",dest,"\n")
    x2 <- file.path("R",x)
    dest2 <- file.path("R",dest)
    file.copy(x2,dest2)
    file.remove(x2)
  }

}
