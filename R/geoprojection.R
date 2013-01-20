#' Project Latitude Longitude
#'
#' Given lat lon coordinates, finds the nearest record in geolookup
#'
#' @param latlon a numeric matrix where the first column is the latitude and
#'   the second column is the longitude
#' @return a data table with columnz zip, lat, lon, city, state, county
#' @examples
#'  latlon = data.frame(lat = c(40,51), lon = c(-120, -59))
#'  projectLatLon(latlon)
#' @export
projectLatLon = function(latlon) {
    data("GeoLookup")
    dist = pdist(latlon, subset(GeoLookup[!is.na(Lat) & !is.na(Lon)], select = 2:3))
    dist = as.matrix(dist)
    matching.indices = apply(dist, 1, which.min)
    GeoLookup[matching.indices,]
}

#' Geo Lookup
#'
#' Find a geo record given one of either zip, city, state, or county.
#' Vectors can be used for any of the parameters
#'
#' @param zip
#' @param city
#' @param state
#' @param county
#' @return a data table with columnz zip, lat, lon, city, state, county
#' @examples
#'  geolookup(zip = c(94109, 94306))
#'  geolookup(city = "san francisco")
#' @export
geolookup = function(zip, city, state, county) {
    data("GeoLookup")
    if (!missing(zip)) {
        GeoLookup[Zip %in% zip]
    }
    else if (!missing(city)) {
        GeoLookup[City %in% toupper(city)]
    }
    else if (!missing(state)) {
        GeoLookup[State %in% toupper(state)]
    }
    else if (!missing(county)) {
        GeoLookup[County %in% toupper(county)]
    }
}
