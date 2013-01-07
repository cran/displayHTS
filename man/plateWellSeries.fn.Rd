\name{plateWellSeries.fn}
\alias{plateWellSeries.fn}
\title{
Plate-Well Series Plot
}
\description{
Function that draws a plate-well series plot for all or part of plates.
}
\usage{
plateWellSeries.fn(data.df, intensityName = NA, plateName = "BARCODE", wellName = "WELL_USAGE", rowName, colName, show.wellTypes = NULL, order.wellTypes = NULL, color.wells = NULL, pch.wells = NULL, ppf = 12, byRow = T, yRange = NULL, cex.point = 0.25, cex.legend = 0.3, x.legend = NA, y.legend = NA, main = NA, xlab = NA, ylab = NA)
}
\arguments{
  \item{data.df}{
The data for all plates including at least five columns for intensity, plate names, well names, rows, and columns, respectively.
}
  \item{intensityName}{
Name of the column in data.df indicating intensities in a plate.
}
  \item{plateName}{
Name of the column in data.df indicating plate names.
}
  \item{wellName}{
Name of the column in data.df indicating well types.
}
  \item{rowName}{
Name of the column in data.df indicating row numbers in a plate.
}
  \item{colName}{
Name of the column in data.df indicating column numbers in a plate.
}
  \item{show.wellTypes}{
A vector of well types to be shown in the well-series plot.
}
  \item{order.wellTypes}{
A vector of numbers to indicate the order of well types corresponding to 'show.wellTypes' in the well-series plot.
}
  \item{color.wells}{
A vector indicating the colors of well types corresponding to 'show.wellTypes' in the well-series plot.
}
  \item{pch.wells}{
A vector indicating the point types of well types corresponding to 'show.wellTypes' in the well-series plot.
}
  \item{ppf}{
The number of plates per figure to be shown in the well-series plot.
}
  \item{byRow}{
Indicates whether the wells in a plate should be shown by row or column.
}
  \item{yRange}{
Defines the range of the y-axis in the well-series plot.
}
  \item{cex.point}{
Defines the size of points in the well-series plot.
}
  \item{cex.legend}{
Defines the size of legend in the well-series plot.
}
  \item{x.legend}{
Position of legend on x-axis.
}
  \item{y.legend}{
Position of legend on y-axis.
}
  \item{main}{
Title of the image.
}
  \item{xlab}{
The label for the x-axis.
}
  \item{ylab}{
The label for the y-axis.
}
}
\references{
Zhang XHD, Zhang ZZ. 2013. displayHTS: a R package displaying data and
results from high-throughput screening experiments. Bioinformatics
(submitted).   
   
Zhang XHD, 2011. Optimal High-Throughput Screening: Practical
Experimental Design and Data Analysis for Genome-scale RNAi
Research. Cambridge University Press, Cambridge, UK. 
   
Zhang XHD, Yang XC, Chung N, Gates AT, Stec EM, Kunapuli P, Holder DJ,
Ferrer M, Espeseth AS. 2006. Robust statistical methods for hit
selection in RNA interference high throughput screening
experiments. Pharmacogenomics 7 (3) 299-309. 
}
\author{
Xiaohua Douglas Zhang & Zhaozhi Zhang
}
\seealso{
  \code{\link{imageDesign.fn}},  \code{\link{imageIntensity.fn}},  \code{\link{dualFlashlight.fn}}
}
\examples{
   data(HTSdataSort)
   wells = as.character(unique(HTSdataSort[, "WELL_USAGE"])); wells
   colors = c("black",  "yellow", "grey", "blue", "skyblue", "green", "red")
   orders=c(1, 3, 2, 4, 5, 7, 6)
   # by row
   par( mfrow=c(2,1) )                                                        
   plateWellSeries.fn(data.df = HTSdataSort, intensityName="log2Intensity",
                      plateName="BARCODE", wellName="WELL_USAGE",              
                      rowName="XPOS", colName="YPOS", show.wellTypes=wells,
                      order.wellTypes=orders, color.wells=colors,
                      pch.wells=rep(1, 7), ppf=6, byRow=TRUE,  
                      yRange=NULL, cex.point=0.25,cex.legend=0.3) 
   # by column
   par( mfrow=c(2,1) )                                                        
   plateWellSeries.fn(data.df = HTSdataSort, intensityName="log2Intensity",
                      plateName="BARCODE", wellName="WELL_USAGE",              
                      rowName="XPOS", colName="YPOS", show.wellTypes=wells,
                      order.wellTypes=orders, color.wells=colors,
                      pch.wells=rep(1, 7), ppf=6, byRow= FALSE,  
                      yRange=NULL, cex.point=0.25,cex.legend=0.3) 
   # display hits
   data(HTSresults)
   condtSample = HTSresults[, "WELL_USAGE"] == "Sample"
   condtUp = HTSresults[,"ssmd"] >= 1 & HTSresults[,"mean"] >= log2(1.2)
   condtDown = HTSresults[,"ssmd"] <= -1 & HTSresults[,"mean"] <= -log2(1.2)
   sum(condtSample & (condtUp | condtDown) )/sum(condtSample)
   hit.vec = as.character(HTSresults[, "WELL_USAGE"])
   hit.vec[ condtSample & condtUp ] = "up-hit"
   hit.vec[ condtSample & condtDown ] = "down-hit"
   hit.vec[ condtSample & !condtUp & !condtDown] = "non-hit"
   result.df = cbind(HTSresults, "hitResult"=hit.vec)
   wells = as.character(unique(result.df[, "hitResult"])); wells
   orders = c(1, 3, 4, 6, 7, 8, 9, 2, 5) 
   colors = c("black",  "green", "yellow", "red",
              "grey", "purple1", "purple2", "lightblue", "purple3")
   par(mfrow=c(1,1))
   plateWellSeries.fn(data.df = result.df, intensityName="mean",       
                      plateName="SOBARCODE", wellName="hitResult", 
                      rowName="XPOS", colName="YPOS", show.wellTypes=wells,
                      order.wellTypes=orders, color.wells=colors,
                      pch.wells=rep(1, 7), ppf=6, byRow= FALSE,  
                      yRange=NULL, cex.point=0.5,cex.legend=0.55,
                      y.legend=-0.5) 
}
