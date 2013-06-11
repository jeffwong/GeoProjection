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
    dist = pdist(latlon, GeoLookup[!is.na(Lat) & !is.na(Lon)][,c("Lat", "Lon"),with=F])
    dist = as.matrix(dist)
    matching.indices = apply(dist, 1, which.min)
    GeoLookup[matching.indices,]
}

#' GeoProjection
#'
#' Append geographic data based on one of zip, city, or state
#'
#' @param zip
#' @param city
#' @param state
#' @return a data table with columns zip, lat, lon, city, state, county
#' @examples
#'  projectGeo(zip = c(94109, 94306))
#' @export
projectGeo = function(zip, city, state) {
    if (!missing(zip)) {
        zip.dt = data.table(Zip = zip)
        geoprojection = GeoLookup[Zip %in% zip]
        geoprojection = merge(zip.dt, geoprojection, all.x = T, by = "Zip")
    }
    else if (!missing(city)) {
        city.dt = data.table(City = city)
        geoprojection = GeoLookup[City %in% toupper(city)]
        geoprojection = merge(city.dt, geoprojection, all.x = T, by = "City")
    }
    else if (!missing(state)) {
        state.dt = data.table(State = state)
        geoprojection = GeoLookup[State %in% toupper(state)]
        geoprojection = merge(state.dt, geoprojection, all.x = T, by = "State")
    }
    return (geoprojection)
}

#' Geo Lookup
#'
#' Find a geo record given one of either zip, city, state, or county.
#' Vectors can be used for any of the parameters
#'
#' @param zip
#' @param city
#' @param state
#' @return a data table with columnz zip, lat, lon, city, state, county
#' @examples
#'  geolookup(zip = c(94109, 94306))
#'  geolookup(city = "san francisco")
#' @export
geolookup = function(zip, city, state) {
    if (!missing(zip)) {
        GeoLookup[Zip %in% zip]
    }
    else if (!missing(city)) {
        GeoLookup[City %in% toupper(city)]
    }
    else if (!missing(state)) {
        GeoLookup[State %in% toupper(state)]
    }
}
