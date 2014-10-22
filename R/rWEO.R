
load("data/WEOdata_df.RData")

availableWEOCountryCode <- function(){as.numeric(as.character(unique(WEOdata_df$WEO.Country.Code)[1:189]))}
availableISOCode <- function(){as.character(unique(WEOdata_df$ISO)[1:189])}
availableWEOSubjectCode <- function(){as.character(unique(WEOdata_df$WEO.Subject.Code)[1:44])}
availableCountry <- function(){as.character(unique(WEOdata_df$Country)[1:189])}

searchWEO <- function(WEOCountryCode=NULL, ISOCode=NULL, Country=NULL, WEOSubCode=NULL){
  WEOQueryBuilder <- function( WEOCountryCode=NULL, ISOCode=NULL, Country=NULL, WEOSubCode=NULL){
    fullQuery <- "dplyr::filter(WEOdata_df"
    if(!is.null(WEOCountryCode)){
      fullQuery <- paste(fullQuery, ", WEO.Country.Code==", WEOCountryCode, sep="")
    }
    if(!is.null(ISOCode)){
      fullQuery <- paste(fullQuery, ", ISO=='", ISOCode,"'", sep="")
    }
    if(!is.null(Country)){
      fullQuery <- paste(fullQuery, ", Country=='", Country,"'", sep="")
    }
    if(!is.null(WEOSubCode)){
      fullQuery <- paste(fullQuery, ", WEO.Subject.Code=='", WEOSubCode,"'", sep="")
    }
    fullQuery <- paste(fullQuery, ")", sep="")
    fullQuery
  }
  
  query <- WEOQueryBuilder(WEOCountryCode=WEOCountryCode, ISOCode=ISOCode, Country=Country, WEOSubCode=WEOSubCode)
  result <- eval(parse(text=query))  
}


# Example

#WEO512result <- searchWEO(WEOCountryCode=512)
#print(WEO512result)
#USAresult <- searchWEO(ISOCode="USA")
#print(USAresult)
#USAPCPIresult <- searchWEO(ISOCode="USA", WEOSubCode="PCPI")
#print(USAPCPIresult)
#USA512PCPIresult <- searchWEO(ISOCode="USA", WEOCountryCode=512, WEOSubCode="PCPI")
#print(USA512PCPIresult)

