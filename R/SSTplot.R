#' SST off the West Coast of India
#'
#' This little function plots the SST off the western coast of India from remote sensing data.
#'
#' These data are from the \href{https://podaac.jpl.nasa.gov/dataset/UKMO-L4HRfnd-GLOB-OSTIA}{Global SST & Sea Ice Analysis},
#' L4 OSTIA, UK Met Office,
#' Global, 0.05°, Daily,2013-present dataset available on ERDDAP at
#' \href{https://coastwatch.pfeg.noaa.gov/erddap/griddap/jplUKMO_OSTIAv20}{ERDDAP}.
#'
#' The default is to show the
#' latest SST values but you can enter another date.  The earliest year in this data
#' set is 2013.
#'
#' @param date A character string in "2014-01-30" format. The default is "last" which is the latest values.
#' @return A plot of SST.
#' @examples
#' SSTplot("2017-09-09")
#' @export
SSTplot <- function(date="last"){
  if(date!="last"){
    if(as.numeric(format(as.Date("2008-09-10"),"%Y"))<2013) stop("This SST data set only goes back to 2013")
    date <- paste0(date,"T12:00:00Z")
  }
  url <- paste0(
    "https://coastwatch.pfeg.noaa.gov/erddap/griddap/jplUKMO_OSTIAv20.png?analysed_sst%5B(",
    date,
    ")%5D%5B(7.025):(20.025)%5D%5B(70.025):(78.025)%5D&.draw=surface&.vars=longitude%7Clatitude%7Canalysed_sst&.colorBar=%7C%7C%7C16%7C34%7C&.bgColor=0xffccccff&.trim=0&.size=300"
    )
  img <- png::readPNG(RCurl::getURLContent(url))
  grid::grid.raster(img)
  }
