### Build virtual raster mosaic of Planet imagery, translate to GeoTiff, reproject to WGS84 ### 
# Willow Coleman - 12/31/2021

for city in boulder la austin chicago austin dc
do 
    for season in winter spring summer fall 
    do 
    gdalbuildvrt /Volumes/pangan/Planet/"$city"/"$season"/mosaic.vrt /Volumes/pangan/Planet/"$city"/"$season"/*.tif
    gdal_translate -of GTiff -co "COMPRESS=LZW" -co "TILED=YES" /Volumes/pangan/Planet/"$city"/"$season"/mosaic.vrt /Volumes/pangan/Planet/"$city"/"$season"/"$city"_"$season"_planet.tif
    gdalwarp -t_srs EPSG:4326 -r near -co "COMPRESS=LZW" -co "TILED=YES" -of GTiff /Volumes/pangan/Planet/"$city"/"$season"/"$city"_"$season"_planet.tif /Volumes/pangan/Planet/"$city"/"$season"/"$city"_"$season"_warp_planet.tif
    done
done