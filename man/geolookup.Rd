\name{geolookup}
\alias{geolookup}
\title{Geo Lookup}
\usage{
  geolookup(zip, city, state)
}
\arguments{
  \item{zip}{}

  \item{city}{}

  \item{state}{}
}
\value{
  a data table with columnz zip, lat, lon, city, state,
  county
}
\description{
  Find a geo record given one of either zip, city, state,
  or county. Vectors can be used for any of the parameters
}
\examples{
geolookup(zip = c(94109, 94306))
 geolookup(city = "san francisco")
}

