# Investigating the Use of Generative Adversarial Networks (GANs) for Pansharpening Thermal Satellite Imagery 

Author: Red Willow Coleman

Date last updated: 4/25/2022 

## File List
- Buffered ROI folder: shapefiles for 2km ROIs in each target city 

- PanColorGAN_opti_thermal.ipynb: Google Colab notebook for applying pre-trained PanColorGAN network to thermal-optical patch-pairs

- pix2pix_opti_thermal.ipynb: Google Colab notebook for training and applying pix2pix GAN network trained on thermal-optical patch-pairs 

- PatchPair_Preprocessing.ipynb: Jupyter Notebook for creating thermal-optical patch-pairs given a path to 128 x 128 separate LST and RGB .tif images 

- lst_lookup.csv: CSV file that contains unique look-up values for denormalizing LST images, created in PatchPair_Preprocessing.ipynb 
 
- merge_tifs.sh

- stack_tifs.sh

- retile.sh

## Shell Scripts  
- merge_tifs.sh: merge Planet images of target city during each season together by creating a virtual mosaic and then merging to a .tif file 
  - Planet images are stored by city and season inside of a directory (e.g., ~/Planet/Austin/fall/20201005_144249_0f24_3B_AnalyticMS_SR.tif) 
- stack_tifs.sh: stack Planet and ECOSTRESS images for each season and target city
  - LST images are stored in a directory with a unique name for each season and city  (e.g., “~/LST/austin_fall_LST_GEO.tif”)  
  - Images are returned as city_season_stacked.tif (e.g., austin_fall_stacked.tif) 
- retile.sh: retile each image to 128 x 128 Planet pixels with no overlap 
  - Images are returned as ROI_city_season_tile row_tile col.tif (e.g., 0_austin_fall_LST_1_1.tif and 0_austin_fall_RGB_1_1.tif)
