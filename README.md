# Investigating the Use of Generative Adversarial Networks (GANs) for Pansharpening Thermal Satellite Imagery 

Author: Red Willow Coleman

Date last updated: 4/25/2022 

## File List
- Buffered ROI folder: shapefiles for 2km ROIs in each target city 
- PanColorGAN_opti_thermal.ipynb: Google Colab notebook for applying pre-trained PanColorGAN network to thermal-optical patch-pairs
- pix2pix_opti_thermal.ipynb: Google Colab notebook for training and applying pix2pix GAN network trained on thermal-optical patch-pairs 
- PatchPair_Preprocessing.ipynb: Jupyter Notebook for creating thermal-optical .jpeg patch-pairs (normalized from 0-255) 
- Training_Data_Generation.ipynb: Jupyter Notebook for cropping stacked Planet + ECOSTRESS GeoTiffs to buffered 2 km ROIs 
- lst_lookup.csv: CSV file that contains unique look-up values for denormalizing LST patch-pairs, created in PatchPair_Preprocessing.ipynb 
- merge_tifs.sh: Bash script to merge Planet images of target city during each season together by creating a virtual mosaic and then merging to a .tif file 
- stack_tifs.sh: Bash script to stack Planet and ECOSTRESS images for each season and target city
- retile.sh: Bash script to retile each image to 128 x 128 pixels stacked Planet + ECOSTRESS imagery with no overlap 

## Processing steps to create thermal-optical patch-pairs 
1. Download Planet RGB SuperDove imagery over target cities and desired seasons 
2. Download ECOSTRESS LST imagery over target cities and desired seasons 
3. Pre-process ECOSTRESS LST imagery from .h5 to .tif files using [ECOSTRESS_swath2grid](https://git.earthdata.nasa.gov/projects/LPDUR/repos/ecostress_swath2grid/browse)
4. Run [merge_tifs.sh](https://github.com/willowcoleman/hmc-senior-thesis/blob/main/merge_tifs.sh) to create a mosaicked Planet .tif image for each target city and season
5. Run [stack_tifs.sh](https://github.com/willowcoleman/hmc-senior-thesis/blob/main/stack_tif.sh) to create a stacked Planet + ECOSTRESS .tif image for each target city and season
6. [Run Training_Data_generation Jupyter notebook](https://github.com/willowcoleman/hmc-senior-thesis/blob/main/Training_Data_Generation.ipynb) to crop stacked Planet + ECOSTRESS images to buffered 2 km ROIs saved in the [/Buffered ROI folder](https://github.com/willowcoleman/hmc-senior-thesis/tree/main/Buffered%20ROI)
7. Run [retile.sh](https://github.com/willowcoleman/hmc-senior-thesis/blob/main/retile.sh) to retile 2 km ROI images to 128 x 128 Planet + ECOSTRESS images 
8. Run [PatchPair_Preprocessing](https://github.com/willowcoleman/hmc-senior-thesis/blob/main/PatchPair_Preprocessing.ipynb) Jupyter notebook to create the thermal-optical patch-pair dataset 
