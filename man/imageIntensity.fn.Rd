\name{imageIntensity.fn}
\alias{imageIntensity.fn}
\title{
Plate Intensity Image
}
\description{
  A function that displays the image of intensity of each well in a plate.
}
\usage{
imageIntensity.fn(data.df, intensityName = NA, plateName = "BARCODE", wellName = "WELL_USAGE", rowName, colName, sampleName = "Sample", sourcePlateName = NA)
}
\arguments{
  \item{data.df}{
The data for all plates including at least five columns for intensity, plate names, well names, rows and columns, respectively.
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
  \item{sampleName}{
Name in well types indicating sample names.
}
  \item{sourcePlateName}{
Name of the column in data.df indicating soure plate names.
}
}
\references{
Zhang XHD, Zhang ZZ. 2013. displayHTS: a R package displaying data and
results from high-throughput screening experiments. Bioinformatics
(submitted).   

Zhang XHD, 2011. Optimal High-Throughput Screening: Practical
Experimental Design and Data Analysis for Genome-scale RNAi
Research. Cambridge University Press, Cambridge, UK. 

Zhang XHD, 2008. Novel analytic criteria and effective plate designs for
quality control in genome-wide RNAi screens. Journal of Biomolecular
Screening 13(5): 363-377. 
   
Zhang XHD, Espeseth AS, Johnson E, Chin J, Gates A, Mitnaul L, Marine
SD, Tian J, Stec EM, Kunapuli P, Holder DJ, Heyse JF, Stulovici B,
Ferrer M. 2008. Integrating experimental and analytic approaches to
improve data quality in genome-wide RNAi screens. Journal of
Biomolecular Screening 13(5): 378-389. 
}
\author{
Xiaohua Douglas Zhang & Zhaozhi Zhang
}
\seealso{
  \code{\link{imageDesign.fn}},  \code{\link{dualFlashlight.fn}},  \code{\link{plateWellSeries.fn}}
}
\examples{
   data(HTSdataSort)
   par( mfrow=c(4, 3) )
   imageIntensity.fn(data.df=HTSdataSort, intensityName="log2Intensity",
                      plateName="BARCODE", wellName="WELL_USAGE",
                      rowName="XPOS", colName="YPOS", 
                      sampleName="Sample", sourcePlateName="SOBARCODE" )
}
