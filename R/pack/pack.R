#' pack
#' @name pack
#'
#' @title Pack
#'
#' @description
#' Packs away all unpacked files in the R subdirectory of your currently
#' open package


#' @export
pack <- function(){
  stopifnot(file.exists("DESCRIPTION"))
  flist <- list.files("R",recursive=FALSE,all.files=TRUE)

  invisible(lapply(flist,pack_file))

}

pack_file <- function(x){
  dest <- gsub("_-_",.Platform$file.sep,x)
  if(dest != x){
    cat("Packing file",x,"->",dest,"\n")
    x2 <- file.path("R",x)
    dest2 <- file.path("R",dest)
    file.copy(x2,dest2)
    file.remove(x2)
  }
}
