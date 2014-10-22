\name{searchWEO}
\alias{searchWEO}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Get a data catalog as a data frame.
}
\description{
This function will return the WEO result for given country or subject.
}
\usage{
searchWEO(WEOCountryCode=NULL, ISOCode=NULL, Country=NULL, WEOSubCode=NULL)
}
\arguments{
  \item{WEOCountryCode}{Numerical values to represent WEO country codes, see \code{availableWEOCountryCode()}}
  \item{ISOCode}{Characters to represent country ISO codes, see \code{availableISOCode()}}
  \item{Country}{Characters to represent country names, see \code{availableCountry()}}
  \item{WEOSubCode}{Characters to represent WEO subject codes, see \code{availableSubCode()}}
}
\value{
This function will return a data frame if the data catalog is available, otherwise it will show how to access the data catalog and return NA.
}
\author{
Ming-Jer Lee <mingjerli@gmail.com>
}
\examples{
WEO512result <- searchWEO(WEOCountryCode=512)
print(WEO512result)
USAresult <- searchWEO(ISOCode="USA")
print(USAresult)
USAPCPIresult <- searchWEO(ISOCode="USA", WEOSubCode="PCPI")
print(USAPCPIresult)
USA512PCPIresult <- searchWEO(ISOCode="USA", WEOCountryCode=512, WEOSubCode="PCPI")
print(USA512PCPIresult)
}

