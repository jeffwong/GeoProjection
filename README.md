GeoProjection
=============

Geographic Projections are of the same spirit as [Time Projections](https://github.com/jeffwong/TimeProjection).
A geographic location can be specified using latitude, longitude, but we may want to know higher levels of
information, such as: what city or state does this point fall in?.  The function `projectLatLon` takes as an
argument a two column matrix of latitude and longitude, then finds the nearest point in GeoProjection's database.
Finally, `projectLatLon` returns the zip code, city, county, and state of the projected point.

`geolookup` is another function that returns geographic data given any one of

* zipcode
* city
* state
* 

`projectGeo` is similar to `projectDate` from [Time Projections](https://github.com/jeffwong/TimeProjection).
Pass in a vector of zip codes and projectGeo will return all geographic information pertaining to those zips

## Data
The geographic used here was found at [Popular Data](http://www.populardata.com/downloads.html)
