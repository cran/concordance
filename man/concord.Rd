% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/concord.R
\name{concord}
\alias{concord}
\title{Concording Different Classification Codes}
\source{
Data consolidated from
\itemize{
  \item Pierce and Schott (2009, 2018) <https://faculty.som.yale.edu/peterschott/international-trade-data/>
  \item World Integrated Trade Solution (WITS), World Bank <https://wits.worldbank.org/product_concordance.html>
  \item United Nations Trade Statistics <https://unstats.un.org/unsd/trade/classifications/correspondence-tables.asp>
}
}
\usage{
concord(sourcevar, origin, destination, dest.digit = 4, all = FALSE)
}
\arguments{
\item{sourcevar}{An input character vector of industry/product codes to be converted.}

\item{origin}{A string setting the input coding scheme. Currently supports: "HS0" (1988/92), "HS1" (1996), "HS2" (2002), "HS3" (2007), "HS4" (2012), "HS5" (2017), "HS" (combined), "SITC1" (1950), "SITC2" (1974), "SITC3" (1985), "SITC4" (2006), "NAICS" (combined).}

\item{destination}{A string setting the output coding scheme. Currently supports: "HS0" (1988/92), "HS1" (1996), "HS2" (2002), "HS3" (2007), "HS4" (2012), "HS5" (2017), "HS" (combined), "SITC1" (1950), "SITC2" (1974), "SITC3" (1985), "SITC4" (2006), "NAICS" (combined).}

\item{dest.digit}{An integer indicating the preferred number of digits for outputs. The default is 4 digits.}

\item{all}{Either TRUE or FALSE. If TRUE, the function will return (1) all matched outputs for each input, and (2) the share of occurrences for each matched output among all matched outputs. Users can use the shares as weights for more precise concordances. If FALSE, the function will only return the matched output with the largest share of occurrences (the mode match). If the mode consists of multiple matches, the function will return the first matched output.}
}
\value{
The matched output(s) for each element of the input vector. Either a list object when all = TRUE or a character vector when all = FALSE.
}
\description{
Concords different classification codes used in international trade.
}
\note{
Always include leading zeros in codes (e.g. use HS code 010110 instead of 10110)---results may be buggy otherwise.
}
\examples{
# HS to NAICS
concord(sourcevar = c("120600", "854690"),
        origin = "HS", destination = "NAICS",
        dest.digit = 6, all = TRUE)
concord(sourcevar = c("120600", "854690"),
        origin = "HS", destination = "NAICS",
        dest.digit = 6, all = FALSE)

# NAICS to HS
concord(sourcevar = c("111120", "326199"),
        origin = "NAICS", destination = "HS",
        dest.digit = 6, all = TRUE)

# HS to SITC4
concord(sourcevar = c("120600", "854690"),
        origin = "HS", destination = "SITC4",
        dest.digit = 5, all = TRUE)

# SITC4 to HS
concord(sourcevar = c("22240", "77324"),
        origin = "SITC4", destination = "HS",
        dest.digit = 6, all = TRUE)

# SITC4 to NAICS
concord(sourcevar = c("22240", "77324"),
        origin = "SITC4", destination = "NAICS",
        dest.digit = 6, all = TRUE)

# NAICS to SITC4
concord(sourcevar = c("111120", "326199"),
        origin = "NAICS", destination = "SITC4",
        dest.digit = 5, all = TRUE)
}
