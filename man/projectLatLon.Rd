\name{projectLatLon}
\alias{projectLatLon}
\title{Project Latitude Longitude}
\usage{
  projectLatLon(latlon)
}
\arguments{
  \item{latlon}{a numeric matrix where the first column is
  the latitude and the second column is the longitude}
}
\value{
  a data table with columnz zip, lat, lon, city, state,
  county
}
\description{
  Given lat lon coordinates, finds the nearest record in
  geolookup
}
\examples{
latlon = data.frame(lat = c(40,51), lon = c(-120, -59))
 projectLatLon(latlon)
}

