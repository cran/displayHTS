\name{imageDesign.fn}
\alias{imageDesign.fn}
\title{
  Plate Design Image
}
\description{
   A function that displays the image of well designs in a plate.
}
\usage{
imageDesign.fn(dataOnePlate.df, wellName = NA, rowName, colName, wells = NULL, colors = NULL, title = " ")
}
\arguments{
  \item{dataOnePlate.df}{
The data for one plate including at least three columns for well names, rows and columns, respectively.
}
  \item{wellName}{
Name of the column in dataOnePlate.df indicating well types.
}
  \item{rowName}{
Name of the column in dataOnePlate.df indicating row numbers in a plate.
}
  \item{colName}{
Name of the column in dataOnePlate.df indicating column numbers in a plate.
}
  \item{wells}{
Names for unique wells.
}
  \item{colors}{
Colors for corresponding unique wells.  
}
  \item{title}{
Title of the image.
}
}
\references{
Zhang XHD, Zhang ZZ. 2013. displayHTS: a R package displaying data and
results from high-throughput screening experiments. Bioinformatics
(submitted).  
   
Zhang XHD, 2011. Optimal High-Throughput Screening: Practical
Experimental Design and Data Analysis for Genome-scale RNAi
Research. Cambridge University Press, Cambridge, UK 
   
Zhang XHD, 2008. Novel analytic criteria and effective plate designs for
quality control in genome-wide RNAi screens. Journal of Biomolecular
Screening 13(5): 363-377  
   
Zhang XHD, Espeseth AS, Johnson E, Chin J, Gates A, Mitnaul L, Marine
SD, Tian J, Stec EM, Kunapuli P, Holder DJ, Heyse JF, Stulovici B,
Ferrer M. 2008. Integrating experimental and analytic approaches to
improve data quality in genome-wide RNAi screens. Journal of
Biomolecular Screening 13(5): 378-389  
}
\author{
Xiaohua Douglas Zhang & Zhaozhi Zhang
}
\seealso{
\code{\link{imageIntensity.fn}},  \code{\link{dualFlashlight.fn}},
\code{\link{plateWellSeries.fn}} 
}
\examples{
# for control image
 data(HTSdataSort)
 wells = as.character(unique(HTSdataSort[, "WELL_USAGE"])); wells
 colors = c("black",  "yellow", "grey", "blue", "skyblue", "green", "red")
 plate.vec = as.vector(HTSdataSort[,"BARCODE"]); plates=unique(plate.vec)
 data.df = HTSdataSort[plate.vec==plates[1], c("XPOS","YPOS","WELL_USAGE")]
 imageDesign.fn(dataOnePlate.df=data.df, wellName="WELL_USAGE", rowName="XPOS",
                 colName="YPOS", wells=wells, colors=colors)

# for hit and control image
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
 colors = c("black",  "green", "white", "grey", "red",
            "purple1", "purple2", "yellow", "purple3")  
 par( mfrow=c(2,1) )
 imageDesign.fn(dataOnePlate.df=result.df[1:384,], wellName="hitResult",
                 rowName="XPOS", colName="YPOS", wells=wells, colors=colors,
                 title="Source Plate I")                
 imageDesign.fn(dataOnePlate.df=result.df[1:384+384,],wellName="hitResult",
                rowName="XPOS", colName="YPOS", wells=wells, colors=colors,
                 title="Source Plate II")
}
