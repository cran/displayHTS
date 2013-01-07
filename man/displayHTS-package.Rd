\name{displayHTS-package}
\alias{displayHTS-package}
\alias{displayHTS}
\docType{package}
\title{
 Display high-throughput screening data and results
}
\description{
An R package that displays data and results from high-throughput screening experiments.
}
\details{
\tabular{ll}{
Package: \tab displayHTS\cr
Type: \tab Package\cr
Version: \tab 1.0\cr
Date: \tab 2013-01-07\cr
License: \tab GPL(>=2)\cr
}
 The R package displayHTS has four main functions for generating
 graphics to display data and results from HTS experiments:
 \code{\link{plateWellSeries.fn}}, \code{\link{imageDesign.fn}},
 \code{\link{imageIntensity.fn}}, and
 \code{\link{dualFlashlight.fn}}. \code{\link{plateWellSeries.fn}}
 generates a scatter plot based on the measured or calculated values of
 each well in every plate in a HTS
 experiment. \code{\link{imageDesign.fn}} displays a plate design that
 can be used to both visualize the arrangement of controls and samples
 in a plate. \code{\link{imageIntensity.fn}} creates an image plot that
 shows the intensities or calculated values of every well utilizing the
 boxplot statistics and allows for easy analysis of any systematic
 errors of measurement; finally, \code{\link{dualFlashlight.fn}}
 generates the dual-flashlight plot, volcano plot and plate correlation
 plot.
 
 This package also includes three example datasets: \code{\link{HTSdata}},
 \code{\link{HTSdataSort}} and
 \code{\link{HTSresults}}. \code{\link{HTSdata}} contain the raw data; after  
 sorting and removing redundant records, the data are stored into
 \code{\link{HTSdataSort}}. Finally, the data are processed and the SSMD, 
 mean, p-value, and number of replicates of the data are contained in the
 dataset \code{\link{HTSresults}}.
}
\author{
  Xiaohua Douglas Zhang & Zhaozhi Zhang
  
  Maintainer: Zhaozhi Zhang <zhang.zhaozhi7@gmail.com>
}
\references{
Zhang XHD, Zhang ZZ, 2013. displayHTS: a R package displaying data and
results from high-throughput screening experiments. Bioinformatics (submitted).

Zhang XHD, 2011. Optimal High-Throughput Screening: Practical Experimental Design and Data Analysis for Genome-scale RNAi Research. Cambridge University Press, Cambridge, UK.

Zhang XHD, Santini F, Lacson R, Marine SD, Wu Q, Benetti L, Yang R, McCampbell A, Berger JP, Toolan DM, Stec EM, Holder DJ, Soper KA, Heyse JF and Ferrer M. 2011. cSSMD: Assessing collective activity of multiple siRNAs in genome-scale RNAi screens. Bioinformatics 27(20): 2775-2781.

Zhang XHD. 2011. Illustration of SSMD, z-score, SSMD*, z*-score and t-statistic for hit selection in high-throughput screens. Journal of Biomolecular Screening 16 (7): 775 - 785. 

Zhang XHD. 2010. Assessing the size of gene or RNAi effects in multi-factor high-throughput experiments. Pharmacogenomics 11(2): 199 - 213.

Zhang XHD. 2009. A method effectively comparing gene effects in multiple conditions in RNAi and expression profiling research. Pharmacogenomics 10(3):345-358.  

Zhang XHD, Espeseth AS, Johnson E, Chin J, Gates A, Mitnaul L, Marine SD, Tian J, Stec EM, Kunapuli P, Holder DJ, Heyse JF, Stulovici B, Ferrer M. 2008. Integrating experimental and analytic approaches to improve data quality in genome-wide RNAi screens. Journal of Biomolecular Screening 13(5): 378-389.

Zhang XHD, 2008. Novel analytic criteria and effective plate designs for quality control in genome-wide RNAi screens. Journal of Biomolecular Screening 13(5): 363-377.

Zhang XHD. 2007. A new method with flexible and balanced control of false negatives and false positives for hit selection in RNA interference high throughput screening assays. Journal of Biomolecular Screening 12 (5): 645-655.

Zhang XHD, Ferrer M, Espeseth AS, Marine SD, Stec EM, Crackower MA, Holder DJ, Heyse JF, Strulovici B. 2007. The use of strictly standardized mean difference for hit selection in primary RNA interference high throughput screening experiments. Journal of Biomolecular Screening 12 (4): 497-509.

Zhang XHD. 2007. A pair of new statistical parameters for quality control in RNA interference high throughput screening assays. Genomics 39: 552-561.

Zhang XHD, Yang XC, Chung N, Gates AT, Stec EM, Kunapuli P, Holder DJ, Ferrer M, Espeseth AS. 2006. Robust statistical methods for hit selection in RNA interference high throughput screening experiments. Pharmacogenomics 7 (3) 299-309.
}
\examples{
#######################################################################
## generate the figures in the article where this package is published
#######################################################################
# fig1.A: plate-well series plot
data(HTSdataSort)
wells = as.character(unique(HTSdataSort[, "WELL_USAGE"]))
colors = c("black",  "pink", "grey", "blue", "skyblue", "green", "red")
orders=c(1, 3, 2, 4, 5, 7, 6)
par( mfrow=c(1,1) )                                                        
plateWellSeries.fn(data.df = HTSdataSort[1:(384*2),],
                   intensityName="log2Intensity",       
                   plateName="BARCODE", wellName="WELL_USAGE",              
                   rowName="XPOS", colName="YPOS", show.wellTypes=wells,     
                   order.wellTypes=orders, color.wells=colors,
                   pch.wells=rep(1, 7), ppf=6, byRow=TRUE,
                   yRange=NULL, cex.point=0.75,cex.legend=0.75,
                   main="A: Plate-well series plot") 

# fig1.B: hit and control image
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
colors = c("black",  "green", "white", "red",
           "grey", "purple1", "purple2", "pink", "purple3")  
par( mfrow=c(1,1) )
imageDesign.fn(result.df[1:384,], wellName="hitResult", rowName="XPOS",
                colName="YPOS", wells=wells, colors=colors,
                title="B: Image of hits and controls")    

## fig1.C: dual-flashlight plot,
par( mfrow=c(1, 1) )
dualFlashlight.fn(HTSresults, wellName="WELL_USAGE", x.name="mean",
                  y.name="ssmd", sampleName="Sample", sampleColor="black", 
                  controls = c("negCTRL", "posCTRL1", "mock1"),
                  controlColors = c("green", "red", "lightblue"), 
                  xlab="Average Fold Change", ylab="SSMD",
                  main="C: Dual-Flashlight Plot", x.legend=0.1, y.legend= -12, 
                  cex.point=1, cex.legend = 0.8,
                  xat=log2( c(1/4, 1/2, 1/1.2, 1, 1.2, 2, 4) ), 
                  xMark=c("1/4", "1/2", "1/1.2","1", "1.2", "2", "4"),
                  xLines=log2( c(1/4, 1/2, 1/1.2, 1, 1.2, 2, 4) ),
                  yLines=c(-5, -3, -2, -1, 0, 1, 2, 3, 5 ) )

## fig1.D: volcano plot,
result.df = cbind(HTSresults, "neg.log10.pval" = -log10(HTSresults[,"p.value"]))
dualFlashlight.fn(result.df, wellName="WELL_USAGE", x.name="mean",
                  y.name="neg.log10.pval",
                  sampleName="Sample", sampleColor="black", 
                  controls = c("negCTRL", "posCTRL1", "mock1"),
                  controlColors = c("green", "red", "lightblue"), 
                  xlab="Average Fold Change", ylab="p-value in -log10 scale",
                  main="D: Volcano Plot", x.legend=NA, y.legend=-log10(0.006), 
                  cex.point=1, cex.legend = 0.8,
                  xat=log2( c(1/4, 1/2, 1/1.2, 1, 1.2, 2, 4) ), 
                  xMark=c("1/4", "1/2", "1/1.2","1", "1.2", "2", "4"),
                  xLines=log2( c(1/4, 1/2, 1/1.2, 1, 1.2, 2, 4) ),
                  yLines=c(-5, -3, -2, -1, 0, 1, 2, 3, 5 ) )

}
\keyword{ package }

