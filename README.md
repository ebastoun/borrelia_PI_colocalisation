# Colocalisation index with manual threshold setting
__________________________________________________________________________________
By Annalena Reuss
PhD student, University of Tubingen
E-mail : annalena.reuss@uni-tuebingen.de
____________________________________________________________________________________
## Description:

This piece of code computes the overlap area in pixels of two images (PI and GFP) as well as their colocalization index.
Example data can be found in the directory _exampleData_. Example results are provided in the directory _results_.

- set the variables piImgPath and gfpImgPath to the paths of the PI and GFP images in .tif format (Default: path to example images)

- set the desired thresholds for each image by adapting the variables piThresh (default for example img: 0.075) and gfpThresh (default: 0.036)

- figures will display the segmented PI and GFP images as well as their overlap

- the overlap area and colocalization index will be displayed in the console
_________________________________________________
