\name{dualFlashlight.fn}
\alias{dualFlashlight.fn}
\title{
  Dual-Flashlight Plot
}
\description{
 A function that draws a dual-flashlight plot, volcano plot, and plate correlation plot.
}
\usage{
dualFlashlight.fn(result.df, wellName = "WELL_USAGE", x.name = "mean", y.name = "ssmd", sampleName = "Sample", sampleColor = "black", controls = NULL, controlColors = NULL, xlab = "Average Fold Change", ylab = "SSMD", main = "Dual-Flashlight Plot", x.legend = NA, y.legend = NA, cex.point = 1, cex.legend = 0.8, xat = NULL, xMark = NULL, yat = NULL, yMark = NULL, xLines = NULL, yLines = NULL)
}
\arguments{
  \item{result.df}{
 A data frame containing data or results from an HTS experiment. it must
 includes at least three columns for well name, x (e.g., average fold
 change in log) and y (e.g.,SSMD), respectively. 
}
  \item{wellName}{
Name of the column in result.df indicating well names.
}
  \item{x.name}{
Name of the column in result.df indicating values for x-axis.
}
  \item{y.name}{
Name of the column in result.df indicating values for y-axis.
}
  \item{sampleName}{
The name of the well type indicating sample wells. 
}
  \item{sampleColor}{
The color for sample wells. 
}
  \item{controls}{
A vector including controls to be shown in the plot. 
}
  \item{controlColors}{
A vector including the color of the controls to be shown in the plot. It
must have the same length as 'controls'.  
}
  \item{xlab}{
Same as internal function 'plot'.
}
  \item{ylab}{
Same as internal function 'plot'.
}
  \item{main}{
Same as internal function 'plot'.
}
  \item{x.legend}{
The x-coordinates to be used to position the legend.
}
  \item{y.legend}{
The y-coordinates to be used to position the legend.
}
  \item{cex.point}{
Defines the size of points in the plot.
}
  \item{cex.legend}{
Defines the size of the legend in the plot.
}
  \item{xat}{
The position of x-axis to be labeled. 
}
  \item{xMark}{
The labels of x-axis corresponding to 'xat'. 
}
  \item{yat}{
The position of y-axis to be labeled.
}
  \item{yMark}{
The labels of y-axis corresponding to 'yat'.
}
  \item{xLines}{
X-values indicating positions of vertical grey lines to be drawn.
}
  \item{yLines}{
Y-values indicating positions of horizontal grey lines to be drawn.
}
}
\references{
Zhang XHD, Zhang ZZ. 2013. displayHTS: a R package displaying data and
results from high-throughput screening experiments. Bioinformatics (submitted).
   
Zhang XHD, 2011. Optimal High-Throughput Screening: Practical
Experimental Design and Data Analysis for Genome-scale RNAi
Research. Cambridge University Press, Cambridge, UK. 
   
Zhang XHD. 2009. A method effectively comparing gene effects in multiple
conditions in RNAi and expression profiling research. Pharmacogenomics
10(3):345-358. 
   
Zhang XHD. 2010. Assessing the size of gene or RNAi effects in
multi-factor high-throughput experiments. Pharmacogenomics 11(2): 199 -
213.    
   
Zhang XHD, Santini F, Lacson R, Marine SD, Wu Q, Benetti L, Yang R,
McCampbell A, Berger JP, Toolan DM, Stec EM, Holder DJ, Soper KA, Heyse
JF and Ferrer M. 2011. cSSMD: Assessing collective activity of multiple
siRNAs in genome-scale RNAi screens. Bioinformatics 27(20): 2775-2781.   
}
\author{
  Xiaohua Douglas Zhang & Zhaozhi Zhang
}
\seealso{
  \code{\link{plateWellSeries.fn}},  \code{\link{imageDesign.fn}},  \code{\link{imageIntensity.fn}}
}
\examples{
  # for dual-flashlight plot
  data("HTSresults", package = "displayHTS")
  par( mfrow=c(1, 1) )
  dualFlashlight.fn(HTSresults, wellName="WELL_USAGE", x.name="mean",
                    y.name="ssmd", sampleName="Sample", sampleColor="black", 
                    controls = c("negCTRL", "posCTRL1", "mock1"),
                    controlColors = c("green", "red", "lightblue"), 
                    xlab="Average Fold Change", ylab="SSMD",
                    main="Dual-Flashlight Plot", x.legend=NA, y.legend=NA, 
                    cex.point=1, cex.legend = 0.8,
                    xat=log2( c(1/8, 1/4, 1/2, 1, 2, 4, 8) ), 
                    xMark=c("1/8", "1/4", "1/2", "1", "2", "4", "8"),
                    xLines=log2(c(1/4, 1/2 ,1, 2, 4)),
                    yLines=c(-5, -3, -2, -1, 0, 1, 2, 3, 5 ) )
  # for volcano plot
  result.df=cbind(HTSresults,"neg.log10.pval"=-log10(HTSresults[,"p.value"]))
  dualFlashlight.fn(result.df, wellName="WELL_USAGE", x.name="mean",
                    y.name="neg.log10.pval",
                    sampleName="Sample", sampleColor="black", 
                    controls = c("negCTRL", "posCTRL1", "mock1"),
                    controlColors = c("green", "red", "lightblue"), 
                    xlab="Average Fold Change", ylab="p-value",
                    main="Volcano Plot", x.legend=NA, y.legend=-log10(0.06), 
                    cex.point=1, cex.legend = 0.8,
                    xat=log2( c(1/8, 1/4, 1/2, 1, 2, 4, 8) ), 
                    xMark=c("1/8", "1/4", "1/2", "1", "2", "4", "8"),
                    yat=-log10( c(0.00001, 0.0001, 0.001, 0.01, 0.1, 1) ), 
                    yMark=c(0.00001, 0.0001, 0.001, 0.01, 0.1, 1),
                    xLines=log2(c(1/4, 1/2 ,1, 2, 4)),
                    yLines=-log10( c( 0.001, 0.01, 0.05) ) )
  # plate pair correlation plot
  data("HTSdataSort", package = "displayHTS")
  data.df= cbind(HTSdataSort[1:384,], HTSdataSort[384+1:384,])
  names(data.df)=
    c("SOBARCODE.1", "BARCODE.1", "XPOS.1", "YPOS.1", "WELL_USAGE.1",   
      "Compound.1", "Intensity.1", "log2Intensity.1",
      "SOBARCODE.2", "BARCODE.2", "XPOS.2", "YPOS.2", "WELL_USAGE.2",   
      "Compound.2", "Intensity.2", "log2Intensity.2")
  dualFlashlight.fn(data.df, wellName="WELL_USAGE.1", x.name="log2Intensity.1",
                    y.name="log2Intensity.2", 
                    sampleName="Sample", sampleColor="black", 
                    controls = c("negCTRL", "posCTRL1", "mock1"),
                    controlColors = c("green", "red", "lightblue"), 
                    xlab="log2 intensity in plate 1",
                    ylab="log2 intensity in plate 2",
                    main="Plate Pair Correlation Plot", x.legend=NA,
                    y.legend=NA, cex.point=1, cex.legend = 0.8 )
  abline(0,1)
}
