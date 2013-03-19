\name{projectGeo}
\alias{projectGeo}
\title{GeoProjection}
\usage{
  projectGeo(zip, city, state)
}
\arguments{
  \item{zip}{}

  \item{city}{}

  \item{state}{}
}
\value{
  a data table with columns zip, lat, lon, city, state,
  county
}
\description{
  Append geographic data based on one of zip, city, or
  state
}
\examples{
projectGeo(zip = c(94109, 94306))
}

