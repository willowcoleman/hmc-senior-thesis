
for city in boulder austin chicago la dc 
do 
    for season in winter spring summer fall 
    do 
    gdalwarp -of GTiff -co "COMPRESS=LZW" -co "TILED=YES" -cutline /Volumes/pangan/Shapefiles/Square\ City\ Boundaries/"$city"_sq.shp -crop_to_cutline /Volumes/pangan/LST/"$city"_"$season"*.tif /Volumes/pangan/working/"$city"_"$season"_LST_crop.tif
    gdalwarp -tr 2.969748894e-05 2.969748894e-05 -r near -of GTiff -co "COMPRESS=LZW" -co "TILED=YES" /Volumes/pangan/working/"$city"_"$season"_LST_crop.tif /Volumes/pangan/working/LST/"$city"_"$season"_LST.tif
    gdalwarp -of GTiff -co "COMPRESS=LZW" -co "TILED=YES" -cutline /Volumes/pangan/Shapefiles/Square\ City\ Boundaries/"$city"_sq.shp -crop_to_cutline /Volumes/pangan/Planet/"$city"/"$season"/"$city"_"$season"_warp_planet.tif /Volumes/pangan/working/RGB/"$city"_"$season"_RGB.tif

    done
done