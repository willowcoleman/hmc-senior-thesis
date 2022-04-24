### Re-tile 2 km training imagery into 256 x 256 x 5 pixel patches ### 
# Willow Coleman - 01/02/2022

# Austin, Chicago, LA all have 20 ROIs
for city in chicago austin la
    do 
    for season in spring summer winter fall
        do 
        for num in {0..19}
            do 
            gdal_retile.py -of GTiff -ps 128 128 -targetDir /Volumes/pangan/Training_Data_Full/RGB_128/ /Volumes/pangan/Training_Data_Full/RGB_roi/"$num"_"$city"_"$season"_RGB.tif
            gdal_retile.py -of GTiff -ps 128 128 -targetDir /Volumes/pangan/Training_Data_Full/LST_128/ /Volumes/pangan/Training_Data_Full/LST_roi/"$num"_"$city"_"$season"_LST.tif
        done
    done
done

# DC and boulder have 10 ROIs
for city in dc boulder 
    do 
    for season in spring summer winter fall
        do 
        for num in {0..9}
            do 
            gdal_retile.py -of GTiff -ps 128 128 -targetDir /Volumes/pangan/Training_Data_Full/RGB_128/ /Volumes/pangan/Training_Data_Full/RGB_roi/"$num"_"$city"_"$season"_RGB.tif
            gdal_retile.py -of GTiff -ps 128 128 -targetDir /Volumes/pangan/Training_Data_Full/LST_128/ /Volumes/pangan/Training_Data_Full/LST_roi/"$num"_"$city"_"$season"_LST.tif
        done
    done
done