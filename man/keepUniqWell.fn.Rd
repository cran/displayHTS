\name{keepUniqWell.fn}
\alias{keepUniqWell.fn}
\title{
  Unique Well Keeper
}
\description{
This function keeps rows with unique wells in each plate, without side effects.
}
\usage{
keepUniqWell.fn(dataIn.df, colFocus = c("Barcode", "Rowpos", "Colpos"))
}
\arguments{
  \item{dataIn.df}{
Data from all plates that includes at least three columns for well names, rows, and columns, respectively.
}
  \item{colFocus}{
These columns are the columns that are kept unique and from these the repeats are removed.
}
}
\author{
 Xiaohua Douglas Zhang
}

\examples{
 data(HTSdata)
 dataUniqWell.df = keepUniqWell.fn(dataIn.df=HTSdata, colFocus=c("BARCODE", "XPOS", "YPOS"))
}

